# Plan de pruebas por color — The Grid × bob rebel music

Objetivo: comprobar que cada color (verde, amarillo, rojo) responde desde todos
los frentes: probador de contrato, celulares, Ableton y operador. Marca cada
casilla y anota lo que no coincida.

## 0. Preparación (una vez)

**Linux Mint**
```
git pull
docker compose --profile monitor up --build -d --force-recreate
docker compose logs -f grid-server
```

**Mac mini**
- Carpeta con: los 3 patches de `max/bobGrid/`, sus videos, `grid.env`,
  `grid.hold`, `grid.strobe`, `grid-router.maxpat` y `ableton-bridge.maxpat`.
- Abre `grid-router` (reloj **apagado**: el tempo lo manda Ableton),
  `ableton-bridge` y los 3 patches de color. Abren en vista de presentación;
  Cmd+Opción+E muestra los cables.
- Max Console abierta (Cmd+M).
- OBS: Browser Source `http://<ip-linux-mint>:8080/pantalla` (1920×1080),
  encima de las 3 ventanas de PROJECTR.

**MacBook (Ableton)**
- GridOSC en la pista de batería (modo **golpes**, **Compás** encendido) y
  en una pista "Control visuales" (modo **escenas**) con clips de una nota:
  C1, C#1, D1, D#1.
- Las dos IPs escritas en la cara del dispositivo.

**Operador**: `http://<ip-linux-mint>:8080/operador` en el iPad o la laptop.
**Celulares**: 2 o 3, en la misma Wi-Fi, escaneando el QR de la proyección.

## 1. Verificar los supuestos de conexión (5 min, Mac mini)

Las entradas de los módulos de Vizzie se cablearon según la convención que ya
usaban tus toggles (**última entrada = on/off**). Pasa el mouse por cada
entrada indicada y confirma su nombre:

| Patch | Módulo | Entrada | Debe decir |
|---|---|---|---|
| Verde | KALEIDR | 5 (última) | on/off |
| Verde | TRANS4MR | 7 (última) | on/off |
| Verde | COLORIZR | 4 (última) | on/off |
| Verde | HUSALIR | 2 | hue / tono |
| Rojo | KALEIDR | 5 (última) | on/off |
| Rojo | PIXL8R | 3 (última) | on/off |

- [ ] Todas coinciden. Si alguna no, mueve ese cable a la entrada correcta y
  avísame cuál era para corregir la herramienta.

**Estado al abrir** (sin tocar nada, 2 s después de abrir):
- [ ] Los 3 videos se reproducen solos.
- [ ] Verde: KALEIDR, TRANS4MR y COLORIZR apagados; el tono de HUSALIR en 0.
- [ ] Amarillo: FOGGR apagado, DELAYR prendido, crossfade en A.
- [ ] Rojo: FRACTALIZR + FOGGR prendidos, crossfade en B (video limpio),
  KALEIDR y PIXL8R apagados.

**Intensidad**: como los módulos de templates están apagados en reposo, sube
sus parámetros al extremo en su panel (que se note mucho) y guarda el patch.

**Prueba a mano sin red**: crea un mensaje `; grid.visual.1 1` en cualquier
patch y dale clic. KALEIDR del verde debe entrar 1 compás y la consola debe
imprimir `GRID-VERDE celda1 1`. Igual con `grid.fx.1`, `grid.vote.1` y
`live.flash`.

## 2. Verde (visual: inmediato)

| # | Frente | Acción | Esperado | ✔ |
|---|---|---|---|---|
| V1 | Probador | `CONTRACT_TARGET=<ip-mac-mini>:9000 ONLY=visual STEP_MS=4000 docker compose run --build --rm contract-tester` | celda 1: caleidoscopio 1 compás · celda 2: el tono da la vuelta y regresa en 2 compases · celda 3: zoom/rotación 1 compás | ☐ |
| V2 | Celular | Toca verde 1, 2 y 3 | Lo mismo, **al instante**; la celda destella en `/pantalla` | ☐ |
| V3 | Celular | Toca verde 1 varias veces seguidas | El caleidoscopio se mantiene mientras toquen (cada toque reinicia el compás) | ☐ |
| V4 | Ableton | Toca la tarola | COLORIZR entra ¼ de compás (destello de color) | ☐ |
| V5 | Ableton | Mueve la perilla 1 | Crossfade A↔B del verde | ☐ |
| V6 | Ableton | Lanza escenas 1→4 | solo A · solo B · A+B · limpio | ☐ |
| V7 | Ableton | Cambia el BPM a 90 y luego a 140; toca verde 1 | El caleidoscopio dura **un compás** a cada tempo | ☐ |
| V8 | Operador | Bloquea la verde | Video verde en pausa, columna apagada en celulares y pantalla; los toques no hacen nada | ☐ |
| V9 | Operador | Desbloquea | El video sigue; los toques vuelven a funcionar | ☐ |

## 3. Amarillo (fx: cae en el compás, con enfriamiento)

| # | Frente | Acción | Esperado | ✔ |
|---|---|---|---|---|
| A1 | Probador | `… ONLY=fx STEP_MS=5000 …` | celda 1: salta al eco (B, DELAYR) y regresa en 2 compases · celda 2: niebla (FOGGR) 2 compases · celda 3: sirena (parpadeo A/B en corcheas) 1 compás | ☐ |
| A2 | Celular | Toca amarilla 1 | Parpadea en el celular y la pantalla; el eco entra **en el siguiente compás** | ☐ |
| A3 | Celular | Vuelve a tocar amarilla 1 enseguida | Ignorada 4 compases (celda apagada) | ☐ |
| A4 | 2 celulares | Uno toca 2, el otro toca 3 dos veces en el mismo compás | Sale solo la 3 (la más tocada) | ☐ |
| A5 | Ableton | Toca la tarola | Pulso del crossfade a B (eco) de ¼ de compás | ☐ |
| A6 | Ableton | Perilla 1 y escenas 1→4 | crossfade · niebla · eco · niebla + eco · limpio | ☐ |
| A7 | Operador | Bloquea la amarilla con una celda pendiente | La pendiente se descarta; video amarillo en pausa | ☐ |

## 4. Rojo (voto: el ganador manda 16 compases)

| # | Frente | Acción | Esperado | ✔ |
|---|---|---|---|---|
| R1 | Probador | `… ONLY=vote STEP_MS=35000 …` (a 120 BPM, 16 compases ≈ 32 s) | ganó 1 Raíces: salta a A (fractal + niebla) y vuelve a limpio en 16 compases · ganó 2 Steppers: pixelado prende/apaga cada compás · ganó 3 Cósmico: caleidoscopio + fractal que se desvanece | ☐ |
| R2 | Celulares | Voten (2 por la 3, 1 por la 1) y esperen el cierre (compás 17, 33…) | Sale **solo la 3**; `/pantalla` muestra "GANÓ 3" al mismo tiempo que el visual | ☐ |
| R3 | Celulares | Empate 1 a 1 | Gana una de las dos al azar; se ve su template | ☐ |
| R4 | Operador | Mira el conteo y luego **anula el voto** | Las barras quedan en 0; al cerrar la ventana no sale ganador | ☐ |
| R5 | Ableton | Toca la tarola | Pulso del crossfade a A (fractal) de ¼ de compás | ☐ |
| R6 | Ableton | Escenas 1→4 | fractal + niebla · limpio · mezcla · limpio sin fractal | ☐ |
| R7 | Operador | Cambia "compases que se muestra el ganador" a 4 | Cambia solo el letrero de `/pantalla`; el visual sigue durando 16 (se ajusta en el patch: `grid.env … 16`) | ☐ |

## 5. Todo junto (ensayo del 17 nov)

| # | Acción | Esperado | ✔ |
|---|---|---|---|
| T1 | Una canción completa con Ableton en play, 3 celulares tocando todo y tarolas | Nada se traba; la consola no muestra `GRID-DESCONOCIDO` ni `LIVE-DESCONOCIDO` | ☐ |
| T2 | Detén Ableton y vuelve a darle play desde el inicio | El operador avisa "sin compás"; al volver se reinician ventanas y enfriamientos | ☐ |
| T3 | Apaga y prende la Wi-Fi de un celular | Dice "reconectando…" y vuelve solo | ☐ |
| T4 | Cambia el estilo de celdas desde el operador | Celulares y pantalla cambian en vivo | ☐ |

## Qué reportar

- Las filas que fallaron (por número: V3, A4…).
- En la sección 1, qué decía cada entrada si no coincidía.
- Qué template se notó poco: se ajusta subiendo la intensidad en el panel del
  módulo o cambiando los compases en el objeto (`grid.hold 2`,
  `grid.env 1. 0. 4`…).
