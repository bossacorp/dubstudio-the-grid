# The Grid — contexto para Claude

## Qué es
Grilla 3×3 en colores rasta, proyectada y controlada por el público desde su
celular (web por QR). Cada columna tiene un significado fijo:

- **Verde (`visual`)** — dispara visuales, respuesta inmediata.
- **Amarilla (`fx`)** — efectos dub, cuantizados al compás (con enfriamiento).
- **Roja (`vote`)** — voto de escena/canción, ventana de 16 compases.

El operador (ROR) puede bloquear cualquier columna desde `/operador`.

## Arquitectura (Fase 0)
```
Celular (web) → Grid Server (Docker, Linux Mint) ──OSC :9000──→ Mac mini (Max 8 / Vizzie)
                     ↑ /show/bar :9100                            ↑ OSC :9200 (/live/...)
MacBook: Ableton 12 Suite + dispositivo M4L GridOSC ──────────────┘
         (manda el compás al servidor y golpes/CC/perillas/escenas a la Mac mini)
```

Roles de las máquinas:
- **Linux Mint** — corre el Grid Server en Docker. Es la única con Docker.
- **Mac mini** — OBS (broadcasting) + Max 8.6.5 (visuales con Vizzie,
  controladores MIDI). No se le instala nada más (ni Docker ni OSCulator).
  Recibe los toques (grid-router) y lo de Ableton (ableton-bridge).
- **MacBook** — Ableton 12.4.7 Suite (Max for Live 9). **Ableton manda el
  tempo**: el dispositivo GridOSC manda `/show/bar` al servidor; el reloj del
  grid-router queda apagado (solo de respaldo si no hay Ableton).
- **TouchOSC** — fuera por ahora; solo entra si se vuelve indispensable.

Todo lo que corre como servicio (el Grid Server, y lo que se sume después)
va **contenerizado con Docker**. Es la base sobre la que vamos a escalar:
el mismo contenedor debe poder correr en cualquier máquina con Docker (hoy la
Linux Mint del cuarto DubStudio). No asumir instalación nativa de Node fuera de
Docker.

## Contrato OSC (no romper sin actualizar Max/TouchDesigner)
Definido en `server/src/oscContract.js`:
- `/grid/visual/1-3 1` — servidor → Max; el argumento es siempre el número `1`
- `/grid/fx/1-3 1`
- `/grid/vote/1-3 1` — **ganador** de la ventana de voto (no cada toque)
- `/grid/lock/<columna> 1|0`
- `/show/bar <n>` — Max → servidor (puerto `OSC_IN_PORT`, 9100), compás entero

## Contrato Ableton → Max (puerto 9200, separado del de The Grid)
Lo manda `max/ableton/GridOSC.maxpat` (dispositivo M4L) y lo recibe
`max/ableton-bridge.maxpat`, que lo reparte con `send`:
- `/live/hit <nota> <vel>` → `live.hit`; las notas de tarola (38/40, editable
  en el puente) además disparan `live.flash` (destello)
- `/live/scene <n>` → `live.scene` (en modo "escenas": C1 = 1, C#1 = 2, D1 = 3, D#1 = 4; semitonos)
- `/live/cc <num> <val>` → `live.cc`; CC 21-24 (editable) → `live.knob.1..4`
- `/live/knob/1..4 <0..1>` → `live.knob.1..4` (perillas automatizables en Live)
- `/live/barms <ms>` → `live.barms`: duración del compás según el tempo de Live
  (la manda el GridOSC con "Compás" encendido); la usan grid.env/grid.strobe
El puente también escucha MIDI directo (`notein`/`ctlin`, apagado por defecto).

## Estructura del repo
```
server/          Grid Server (Node + ws + node-osc)
  src/index.js   Arranque: conecta OSC (entrada/salida) con app.js
  src/app.js     HTTP + WebSocket + operador (locks, bitácora, conteo de votos)
  src/osc.js     Envío/recepción OSC
  src/columns.js Lógica verde/amarilla/roja (pura, sin red)
  src/oscMonitor.js  Monitor OSC de prueba (perfil `monitor` del compose)
  src/barClock.js    "Max falso": manda /show/bar (perfil `clock`)
  src/contractTester.js  Manda el contrato completo a Max (perfil `contract`);
                 ONLY=live simula a Ableton contra el puente (:9200)
  test/          Pruebas (`npm test`, node:test): lógica de columnas, flujo
                 celular→servidor→OSC, operador, pantalla y contrato OSC por UDP real
web/public/      Página pública 3×3, operador.html y pantalla.html (vanilla JS, sin build)
  art.js         Arte de las celdas: SVG animado generado por código, 5 estilos
                 (clasico, psicodelico, atmosferico, naturaleza, elegante). Fila 1
                 = efectos A, fila 2 = efectos B, fila 3 = crossfade; color por columna
  vendor/qrcode.js  qrcode-generator 1.4.4 (MIT, Kazuhiko Arase), copiado tal cual
max/             grid-router.maxpat: único udpreceive 9000, reparte el contrato
                 con send (grid.visual.1…grid.vote.3, grid.lock.<col>) y marca
                 el compás (/show/bar). Los patches de color usan [r grid.…]
  bobGrid/       Patches de color (verde/amarillo/rojo, Vizzie) + TODOS sus videos
                 en la misma carpeta (bob*.mov y Donitas*.mp4; los clips guardan
                 solo el nombre del archivo, volumen 0). Cada patch: 2 videos
                 (original = A, uno nuevo con coristas = B) en un solo
                 mixfadr (se quitaron los mixfadr de cruce: pesaban mucho al
                 proyectar). Abren en presentación (solo módulos y
                 controles). A la derecha, en la vista de cables: THE GRID
                 (bloqueo → pausa los videos, play al abrir), TEMPLATES y
                 ABLETON (perilla 1 → crossfade, perilla 2 → profundidad del
                 LFO, 3-4 libres, escenas 1-4). El crossfade que llega al
                 mixfadr = número base + LFO (rebota en 1, nunca brinca)
    grid.env.maxpat     [grid.env pico base compases]: golpe y regreso
    grid.hold.maxpat    [grid.hold compases]: 1 al disparar, 0 a los N compases
    grid.strobe.maxpat  [grid.strobe por-compás compases]: estrobo 1/0
    grid.lfo.maxpat     bpatcher con panel (on/off, compases, prof.), args
                        `compases prof`: vaivén senoidal 0..prof para SUMAR a
                        una base (no la reemplaza); al apagar se desvanece
  ableton-bridge.maxpat  Mac mini: udpreceive 9200 + MIDI directo → send live.*
  ableton/GridOSC.amxd   Dispositivo Max MIDI Effect para Live (IPs editables
                 en su cara); GridOSC.maxpat es su fuente
  tools/generar_gridosc.py  Genera GridOSC.maxpat y GridOSC.amxd
  tools/agregar_bloques.py  Integra una versión nueva de un patch de color:
                 quita lo que no se usa (también ramas cuyo video ya no llega
                 a la salida), arma la cadena, mete el LFO, cablea templates y
                 acomoda la presentación (config por color dentro del script)
  tools/generar_abstracciones.py  Genera grid.env / grid.hold / grid.strobe / grid.lfo
docs/plan-pruebas-colores.md  Plan de pruebas por color (celular, Ableton, operador)
Dockerfile       Imagen del Grid Server (contexto: raíz del repo)
docker-compose.yml
.gitlab-ci.yml   CI: `npm test` en cada push (runner tag `self-hosted`, Linux Mint)
```

## Reglas de columnas (valores por defecto acordados)
- Amarilla: un efecto por compás, el más tocado (empate: el primero tocado);
  la celda que disparó se enfría 4 compases.
- Roja: ventanas fijas de 16 compases (1–16, 17–32…); un voto por celular,
  cambiable; empate al azar; sin votos no sale nada. El celular solo ve su voto.
- Bloquear una columna descarta lo pendiente; si Max reinicia el transport
  (compás menor al anterior) se limpian ventanas y enfriamientos.

## Operador (`/operador`)
- Operador principal: la Mac mini (Max + OBS). También se monitorea desde el
  iPad y una laptop; la página es adaptable.
- Se entra con `OPERATOR_KEY` (se guarda en el navegador). Por WebSocket:
  `{type:'hello', role:'operator', key}`; clave mala → error y cierre 4001.
- Ve: compás (y aviso si Max deja de mandarlo), celulares conectados, toques
  por columna, fx pendiente/enfriando, **conteo de votos en vivo** y bitácora.
- Acciones: bloquear/desbloquear columna, anular el voto en curso, mostrar u
  ocultar el QR de la pantalla, cambiar cuántos compases se muestra el ganador
  y el estilo del arte de las celdas (celulares y pantalla cambian en vivo).
- Muestra también la pantalla en vivo (iframe `/pantalla?preview&monitor`, no
  cuenta como pantalla de OBS) y el QR en grande.
- `POST /operador/lock` (header `x-operator-key`) se queda para scripts.

## Pantalla (`/pantalla`, Browser Source de OBS)
- Escenario fijo de 1920×1080 con fondo **transparente solo dentro de OBS**
  (detecta `window.obsstudio`), encima de Vizzie. En otro navegador sale con
  fondo para que se lea; `?transparente` lo fuerza transparente.
- Se conecta con `{type:'hello', role:'screen'}` (sin clave, solo lectura) y no
  cuenta como celular. Recibe `{type:'fire', column, cell}` por cada mensaje
  OSC de celda para destellar, y se reconecta sola.
- QR visible por defecto (codifica `PUBLIC_URL` o la URL con que OBS la abre);
  el operador lo oculta/muestra.
- Ganador del voto: se muestra `WINNER_BARS` compases (16 por defecto),
  configurable en vivo por el operador (1–64).

## Estilos de celdas
- `display.theme` en el estado público; el operador lo cambia (`{type:'display',
  theme}`), `THEME` en `.env` fija el inicial. `?tema=<estilo>` en la URL lo
  fuerza en un solo celular o pantalla (para comparar).
- Arte propio del artista: reemplazará a `art.js` más adelante.

## Templates de efectos (cableados en los patches de color)
Dos tipos, al tempo de Ableton (`live.barms`):
- **Entra y sale** (`grid.hold` / `grid.strobe`) → entrada on/off del módulo = su
  ÚLTIMA entrada (convención que ya usaban los toggles del artista). En reposo
  el módulo está apagado; su intensidad se ajusta en su panel.
- **Golpe y regreso** (`grid.env`) → solo entradas confirmadas: el número 0..1
  del crossfade (mixfadr entrada 3) y el tono de HUSALIR (entrada 2).
Por color:
- Verde (simplificado): A = bob → fractalizr → foggr; B = Donitas1 directo;
  salida: mixfadr → kaleidr → husalir → trans4mr → colorizr → projectr.
  Celda 1 KALEIDR 1 compás · 2 tono HUSALIR vuelta en 2 · 3 TRANS4MR 1
  compás · tarola COLORIZR ¼. LFO 8 compases, prof. 0.15.
- Amarilla: A = bob → foggr; B = Donitas3 → delayr. 1 eco (crossfade a B,
  regresa en 2) · 2 FOGGR 2 compases · 3 sirena (crossfade A/B en corcheas,
  1 compás) · tarola pulso a B ¼. DELAYR prendido al abrir. LFO 4 compases,
  prof. 0.1.
- Roja (ganador, 16 compases; base crossfade 0.5 = se ven A y B): A = bob →
  fractalizr → foggr; B = Donitas5 → pixl8r → kaleidr (cadena del artista).
  1 Raíces (crossfade a A y vuelve a 0.5) · 2 Steppers (PIXL8R cada compás) ·
  3 Cósmico (KALEIDR + crossfade a B) · tarola pulso a A ¼. LFO 16 compases,
  prof. 0.2.
- Lección aprendida: un LFO que escribe directo el crossfade del mixfadr pelea
  con perilla/templates y brinca. Por eso el LFO solo suma un vaivén suave.
- Supuestos por confirmar en Max (pasar el mouse por la entrada): última
  entrada = on/off en KALEIDR, TRANS4MR, COLORIZR, PIXL8R; entrada 2 = tono en
  HUSALIR. Si alguno no coincide, se mueve ese cable o se ajusta la config de
  `agregar_bloques.py`.

## Principio: KICS
Keep It Cuban/Chill/Simple. La nube y la infraestructura pesada solo entran
cuando el loop local (celular → servidor Docker → OSC → Mac mini/MacBook) ya
funciona sin caídas. Ver hoja de ruta completa (Fases 0–4) en la tarjeta de
Trello "Do 'The GRID'".

## Cómo correrlo local
```
cp server/.env.example server/.env   # ajustar OSC_TARGETS a las IPs reales
docker compose up --build
```

## Convenciones de código
- ES modules (`type: module`), sin framework de frontend — HTML/JS plano.
- Dependencias mínimas: `express`, `ws`, `node-osc`, `dotenv`.
- Cambios en la lógica de columnas (verde/amarilla/roja) van en `server/src/`,
  el contrato OSC no se toca sin avisar (afecta los patches de Max/TD).
