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
  src/index.js   HTTP + WebSocket + endpoint de operador
  src/osc.js     Envío OSC a los targets configurados
  src/state.js   Estado en memoria (locks) + broadcast
  src/columns.js Lógica verde/amarilla/roja (pura, sin red)
  src/oscMonitor.js  Monitor OSC de prueba (perfil `monitor` del compose)
  src/barClock.js    "Max falso": manda /show/bar (perfil `clock`)
  test/          Pruebas de columns.js (`npm test`, node:test)
web/public/      Página pública 3×3 (vanilla JS, sin build)
max/             Patch de Max de prueba (recibe toques, manda /show/bar)
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
