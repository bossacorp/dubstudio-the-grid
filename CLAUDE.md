# The Grid — contexto para Claude

## Qué es
Grilla 3×3 en colores rasta, proyectada y controlada por el público desde su
celular (web por QR). Cada columna tiene un significado fijo:

- **Verde (`visual`)** — dispara visuales, respuesta inmediata.
- **Amarilla (`fx`)** — efectos dub, cuantizados al compás (con enfriamiento).
- **Roja (`vote`)** — voto de escena/canción, ventana de 16 compases.

El operador (ROR) puede bloquear cualquier columna desde `/operador`.

## Arquitectura
```
Celular (web) → Grid Server (Node, en Docker) → OSC → Mac mini (proyección)
                                                → OSC → MacBook (Ableton + M4L)
Ableton devuelve compás/tempo al servidor vía /show/bar.
```

Todo lo que corre como servicio (el Grid Server, y lo que se sume después)
va **contenerizado con Docker**. Es la base sobre la que vamos a escalar:
mismo contenedor debe correr igual en la Linux Mint del cuarto DubStudio y
en el Mac mini M4. No asumir instalación nativa de Node fuera de Docker.

## Contrato OSC (no romper sin actualizar Max/TouchDesigner)
Definido en `server/src/oscContract.js`:
- `/grid/visual/1-3`
- `/grid/fx/1-3`
- `/grid/vote/1-3`
- `/grid/lock/<columna>`
- `/show/bar`

## Estructura del repo
```
server/          Grid Server (Node + ws + node-osc)
  src/index.js   HTTP + WebSocket + endpoint de operador
  src/osc.js     Envío OSC a los targets configurados
  src/state.js   Estado en memoria (locks) + broadcast
web/public/      Página pública 3×3 (vanilla JS, sin build)
Dockerfile       Imagen del Grid Server (contexto: raíz del repo)
docker-compose.yml
```

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
