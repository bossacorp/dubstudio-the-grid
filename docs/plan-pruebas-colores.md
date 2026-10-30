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
- Carpeta con: los 3 patches de `max/bobGrid/`, **todos los videos en la
  misma carpeta, sin subcarpeta**: los HAP que usan los patches
  (greenBob/yellowBob/redBob-hap.mov y Donitas1/3/5-hap.mov) y, para
  regresar si hace falta, los originales (…BobVideo.mov, Donitas*.mp4); `salida.maxpat`,
  `grid.env`, `grid.hold`, `grid.strobe`, `grid.lfo`, `grid-router.maxpat` y
  `ableton-bridge.maxpat`.
- Una sola vez: paquete **Syphon** instalado en Max (Package Manager) y App
  Nap apagado para Max (ver "Salida única" en la sección 1).
- Abre **solo `salida.maxpat`** (la única ventana de video: los 3 colores
  lado a lado, 30 fps): ya carga adentro los 3 patches de color. **No abras
  los patches de color por separado** (se duplicarían y, abiertos aparte, no
  encuentran la ventana: 0 fps). Doble clic en la caja de un color abre sus
  controles (vista de presentación; Cmd+Opción+E muestra los cables).
  Abre también `grid-router` (reloj **apagado**: el tempo lo manda Ableton) y
  `ableton-bridge`.
- Max Console abierta (Cmd+M).
- OBS: fuente **Syphon Client** → servidor "The Grid" (la salida de Max) y,
  encima, Browser Source `http://<ip-linux-mint>:8080/pantalla` (1920×1080).
  Quita las 3 capturas de ventana de PROJECTR que había antes.

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
| Los 3 | XFADR | 3 | crossfade / fade (0..1) — aquí entra el número del crossfade + LFO |

- [ ] Todas coinciden. Si alguna no, mueve ese cable a la entrada correcta y
  avísame cuál era para corregir la herramienta.

**Estado al abrir** (sin tocar nada, 2 s después de abrir):
- [ ] Los 6 videos se reproducen solos (2 por patch), sin sonido. Son los
  **HAP** (`…-hap.mov`): si alguno sale negro o la consola dice que no
  encuentra el archivo, revisa que los `-hap.mov` estén en la carpeta.
- [ ] Ningún patch de color abre ventana propia: ya no traen PROJECTR, su
  imagen sale por `s thegrid.salida.<color>` a `salida.maxpat`, donde se ven
  verde | amarillo | rojo lado a lado.
- [ ] Cada patch tiene un **medidor de fps** (los cuadros que manda a la
  salida) y `salida.maxpat` el suyo; marcan un número estable.
- [ ] Ningún patch trae MIXFADR: la mezcla principal es el **XFADR** (video
  original en su entrada 1 = A, video nuevo en la 2 = B). Ya no existe el
  toggle "mezcla on/off" (iba al MIXFADR y el XFADR no lo usa).
- [ ] Verde: el video nuevo (Donitas1) entra directo a la B del XFADR; la
  salida del XFADR va a KALEIDR → HUSALIR → TRANS4MR → COLORIZR → salida.
- [ ] Amarillo y rojo: la salida del XFADR va directo a la salida.
- [ ] En cada patch el panel **LFO (suave)** está prendido y el crossfade se
  mece despacio alrededor de su valor (no brinca): verde 8 compases / prof.
  0.15, amarillo 4 / 0.1, rojo 16 / 0.2.
- [ ] Verde: KALEIDR, TRANS4MR y COLORIZR apagados; el tono de HUSALIR en 0.
- [ ] Amarillo: FOGGR apagado, DELAYR prendido, crossfade en A.
- [ ] Rojo: FRACTALIZR + FOGGR prendidos, crossfade principal en 0.5 (se ven
  el original y el nuevo), KALEIDR y PIXL8R apagados.

**Salida única (esta versión).** Los 3 PROJECTR se frenaban entre sí y OBS
les quitaba mucho; diagnóstico con la versión anterior:

| Prueba | Resultado |
|---|---|
| 3 patches + OBS, al arrancar / a las 2 h | 12 fps / 6–8 fps; Max ≤ 75 % CPU, GPU < 10 %, memoria 899 MB; OBS 140–170 % |
| D1: un solo patch abierto | 30–35 fps |
| D2: su ventana al frente, sin nada encima | 38–41 fps |
| D3: un solo patch y OBS cerrado | 59–60 fps |

Ahora hay una sola ventana (`salida.maxpat`: `jit.world thegrid` a 30 fps
fijos, sin esperar el refresco de pantalla) que dibuja los 3 colores lado a
lado, y OBS la toma por Syphon en vez de capturar 3 ventanas.

Preparación (una sola vez, en la Mac mini):
- [ ] Paquete Syphon instalado: en Max, File → Show Package Manager → busca
  "Syphon" → Install; reinicia Max.
- [ ] App Nap apagado para Max (en Terminal, con Max cerrado):
  `defaults write com.cycling74.Max NSAppSleepDisabled -bool YES`

| # | Prueba | Esperado | ✔ |
|---|---|---|---|
| S1 | Abre solo `salida.maxpat` | Una ventana 1920×1080 con verde \| amarillo \| rojo; los fps de cada color (doble clic en su caja) y de la salida marcan > 0; la caja `jit.gl.syphonserver` NO sale punteada | ☐ |
| S2 | En OBS: + → Syphon Client → servidor "The Grid" (Max) | Se ve la salida en OBS; quita las 3 capturas de ventana viejas | ☐ |
| S3 | Tapa la ventana de salida con OBS | Los fps de la salida no bajan (OBS la toma por Syphon) | ☐ |

Primer intento (abriendo los colores como archivos aparte): la salida a 30
fps pero vacía y los 3 colores en 0 fps. Max solo conecta los módulos de
Vizzie con una ventana de su mismo patch (o de uno que los contenga); por eso
ahora la salida carga los colores adentro.

Si un color sigue en 0 fps o negro: revisa que no esté abierto también por
separado; si aun así, en el inspector de sus `jit.playlist` pon **Output
Texture** en off y avísame cuál fue y qué dice la Max Console.

Mide con todo abierto (salida, 3 colores, OBS), **sin tocar Max con el mouse**
y con las ventanas de los patches minimizadas:

| # | Medición | Antes (HAP, 3 PROJECTR) | Ahora | ✔ |
|---|---|---|---|---|
| P1 | fps de la salida, al arrancar | 12 | | ☐ |
| P2 | fps de la salida, a las 2 h | 6–8 | | ☐ |
| P3 | fps de cada patch (verde / amarillo / rojo) | 12 | / / | ☐ |
| P4 | CPU de Max (Monitor de Actividad) | ≤ 75 % | | ☐ |
| P5 | CPU de OBS | 140–170 % | | ☐ |
| P6 | Memoria de Max, al arrancar / a las 2 h | – / 899 MB | / | ☐ |
| P7 | Mover el crossfade de 0 a 1 y disparar templates | – | Fluido, sin que se pierdan efectos | ☐ |

**Intensidad**: como los módulos de templates están apagados en reposo, sube
sus parámetros al extremo en su panel (que se note mucho) y guarda el patch.

**El LFO a mano** (en cualquier patch, con Ableton en play o sin él: sin
`live.barms` toma 2 s por compás):

| # | Acción | Esperado | ✔ |
|---|---|---|---|
| L1 | Apaga el toggle del panel LFO | El vaivén se desvanece en ½ s y el crossfade se queda en el valor del dial (sin salto) | ☐ |
| L2 | Préndelo, pon prof. 0.4 y compases 2 | Vaivén más amplio y rápido; el cambio de compases entra al terminar la rampa en curso, sin brinco | ☐ |
| L3 | Dial del crossfade en 1 (todo B, en el XFADR) | El LFO sigue meciendo, ahora hacia A (rebota en 1, no se queda pegado) | ☐ |
| L4 | Prof. en 0 | Crossfade quieto, igual que antes del LFO | ☐ |

Anota la profundidad y los compases que te gusten por color: se dejan como
valores iniciales en `agregar_bloques.py` (`'lfo': (compases, prof)`).

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
| V5b | Ableton | Mueve la perilla 2 de 0 a 1 | La profundidad del LFO va de 0 a 0.5 (se ve en su panel): de quieto a vaivén amplio | ☐ |
| V6 | Ableton | Lanza escenas 1→4 | A (bob con fractal + niebla) · B (coristas) · A+B · bob limpio | ☐ |
| V7 | Ableton | Cambia el BPM a 90 y luego a 140; toca verde 1 | El caleidoscopio dura **un compás** a cada tempo | ☐ |
| V8 | Operador | Bloquea la verde | Los 2 videos del verde en pausa, columna apagada en celulares y pantalla; los toques no hacen nada | ☐ |
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
| A6b | Ableton | Perilla 2 a la mitad y toca amarilla 3 (sirena) | La sirena se sigue viendo nítida: el LFO solo mece, no tapa los templates | ☐ |
| A7 | Operador | Bloquea la amarilla con una celda pendiente | La pendiente se descarta; video amarillo en pausa | ☐ |

## 4. Rojo (voto: el ganador manda 16 compases)

| # | Frente | Acción | Esperado | ✔ |
|---|---|---|---|---|
| R1 | Probador | `… ONLY=vote STEP_MS=35000 …` (a 120 BPM, 16 compases ≈ 32 s) | ganó 1 Raíces: salta a A (bob con fractal + niebla) y vuelve a la mezcla en 16 compases · ganó 2 Steppers: pixelado en el video nuevo, prende/apaga cada compás · ganó 3 Cósmico: caleidoscopio en el video nuevo, a pantalla completa, que regresa a la mezcla | ☐ |
| R2 | Celulares | Voten (2 por la 3, 1 por la 1) y esperen el cierre (compás 17, 33…) | Sale **solo la 3**; `/pantalla` muestra "GANÓ 3" al mismo tiempo que el visual | ☐ |
| R3 | Celulares | Empate 1 a 1 | Gana una de las dos al azar; se ve su template | ☐ |
| R4 | Operador | Mira el conteo y luego **anula el voto** | Las barras quedan en 0; al cerrar la ventana no sale ganador | ☐ |
| R5 | Ableton | Toca la tarola | Pulso del crossfade a A (fractal) de ¼ de compás | ☐ |
| R6 | Ableton | Escenas 1→4 | original con fractal + niebla · video nuevo · mezcla · mezcla sin fractal | ☐ |
| R6b | Ableton | Perilla 2 en 0 y luego en 1 | Sin vaivén / vaivén amplio alrededor de la mezcla 0.5 | ☐ |
| R7 | Operador | Cambia "compases que se muestra el ganador" a 4 | Cambia solo el letrero de `/pantalla`; el visual sigue durando 16 (se ajusta en el patch: `grid.env … 16`) | ☐ |

## 5. Todo junto (ensayo del 17 nov)

| # | Acción | Esperado | ✔ |
|---|---|---|---|
| T1 | Una canción completa con Ableton en play, 3 celulares tocando todo y tarolas, los 3 patches proyectando | Nada se traba ni se alenta (revisa el uso de CPU de Max en el Monitor de Actividad); la consola no muestra `GRID-DESCONOCIDO` ni `LIVE-DESCONOCIDO` | ☐ |
| T2 | Detén Ableton y vuelve a darle play desde el inicio | El operador avisa "sin compás"; al volver se reinician ventanas y enfriamientos | ☐ |
| T3 | Apaga y prende la Wi-Fi de un celular | Dice "reconectando…" y vuelve solo | ☐ |
| T4 | Cambia el estilo de celdas desde el operador | Celulares y pantalla cambian en vivo | ☐ |

## Qué reportar

- Las filas que fallaron (por número: V3, A4…).
- Si la entrada 3 del XFADR no es el crossfade, cuál es (se cambia
  `XFADE_IN` en `agregar_bloques.py`).
- S1–S3 y la tabla P1–P7 llena.
- Si las franjas de la salida se ven estiradas o mal acomodadas (se ajustan
  en `generar_salida.py`).
- En la sección 1, qué decía cada entrada si no coincidía.
- Valores del LFO que te gustaron por color (compases y profundidad).
- Qué template se notó poco: se ajusta subiendo la intensidad en el panel del
  módulo o cambiando los compases en el objeto (`grid.hold 2`,
  `grid.env 1. 0. 4`…).
