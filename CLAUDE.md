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
                                                 ←─OSC :9100── /show/bar (Max marca el compás)
```

Roles de las máquinas:
- **Linux Mint** — corre el Grid Server en Docker. Es la única con Docker.
- **Mac mini** — OBS (broadcasting) + Max 8 (visuales con Vizzie, controladores
  MIDI). No se le instala nada más (ni Docker ni OSCulator). En Fase 0 Max
  recibe los toques y **marca el compás** (`/show/bar`).
- **MacBook (Ableton + M4L)** — fuera de la Fase 0.
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

## Estructura del repo
```
server/          Grid Server (Node + ws + node-osc)
  src/index.js   Arranque: conecta OSC (entrada/salida) con app.js
  src/app.js     HTTP + WebSocket + operador (locks, bitácora, conteo de votos)
  src/osc.js     Envío/recepción OSC
  src/columns.js Lógica verde/amarilla/roja (pura, sin red)
  src/oscMonitor.js  Monitor OSC de prueba (perfil `monitor` del compose)
  src/barClock.js    "Max falso": manda /show/bar (perfil `clock`)
  src/contractTester.js  Manda el contrato completo a Max (perfil `contract`)
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
  bobGrid/       Patches de color (verde/amarillo/rojo, Vizzie) + videos. Bloque
                 "THE GRID" agregado a la derecha de cada uno: celda 1 → efectos
                 A, celda 2 → efectos B, celda 3 → crossfade A↔B, bloqueo → pausa
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
