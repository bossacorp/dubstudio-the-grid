# The Grid

Grilla 3×3 en colores rasta, proyectada y controlada por el público desde su
celular (web por QR). El público toca celdas; el Grid Server reenvía esos
toques por OSC hacia Max en la Mac mini (visuales), y Max le devuelve el
compás al servidor.

- **Verde** = visuales (respuesta inmediata)
- **Amarilla** = efectos dub (cuantizados al compás)
- **Roja** = voto de escena/canción (ventana de 16 compases)

El operador puede bloquear cualquier columna. Ver `CLAUDE.md` para la
arquitectura completa y el contrato de mensajes OSC.

## Correrlo

Todo corre en Docker — es la base sobre la que se va a escalar.

```
cp server/.env.example server/.env   # ajustar OSC_TARGETS a las IPs reales
docker compose up --build
```

La página pública queda en `http://<host>:8080`.

### Probar

**0 — Pruebas automáticas** (lógica de columnas, sin red). En GitLab corren
solas en cada push (`.gitlab-ci.yml`, runner `self-hosted` de la Linux Mint).
A mano:

```
docker compose run --rm grid-server npm --prefix server test
```

**1 — Todo en la Linux Mint, con "Max falso".** En `server/.env`:
`OSC_TARGETS=osc-monitor:9000`. Luego:

```
docker compose --profile monitor --profile clock up --build -d
docker compose logs -f grid-server osc-monitor
```

`bar-clock` manda `/show/bar` a 120 BPM (cámbialo en el compose). Desde el
celular (`http://<ip-linux-mint>:8080`):

- Verde: sale al instante (`/grid/visual/N [1]` en el monitor).
- Amarilla: la celda parpadea hasta el siguiente compás, sale `/grid/fx/N [1]`
  y queda apagada 4 compases. Log: `compás X: fx N disparado (k toques)`.
- Roja: tu voto queda marcado con borde blanco y abajo se ve cuántos compases
  faltan. Al cerrar la ventana sale solo el ganador `/grid/vote/N [1]`.
  Log: `compás 17: voto cerrado, ganó N (a de b votos)`.

**Operador.** Abre `http://<ip-linux-mint>:8080/operador` (Mac mini, iPad o
laptop) y entra con la `OPERATOR_KEY` de `server/.env`. Desde ahí se bloquean
columnas, se anula el voto en curso y se ve el conteo de votos y la bitácora.

**Estilos de las celdas.** Desde `/operador` (tarjeta "Pantalla · OBS") se
elige el estilo: Clásico, Psicodélico, Atmosférico, Naturaleza o Elegante, y
cambia en vivo en todos los celulares y en la pantalla. Para comparar estilos
en un solo celular: `http://<ip-linux-mint>:8080/?tema=naturaleza`.

**Pantalla en OBS (Mac mini).** Agrega una fuente *Browser Source* con URL
`http://<ip-linux-mint>:8080/pantalla`, ancho 1920 y alto 1080, encima de la
salida de Vizzie. El fondo es transparente. Para verla en un navegador normal:
`/pantalla?preview`. El QR y la duración del ganador se controlan desde
`/operador` (tarjeta "Pantalla · OBS").

**2 — Con Max en la Mac mini.** Apaga el reloj falso
(`docker compose stop bar-clock`), agrega la Mac mini a `OSC_TARGETS`
(`osc-monitor:9000,<ip-mac-mini>:9000`) y recrea:
`docker compose --profile monitor up -d --force-recreate`. Abre
`max/grid-router.maxpat` (uno solo por Max: es el único `udpreceive 9000`):

1. Arriba recibe el contrato, lo imprime en la Max Console (`print GRID`) y lo
   reparte con `send`: `grid.visual.1` … `grid.vote.3` (reciben `1`) y
   `grid.lock.visual|fx|vote` (reciben `1` o `0`). En cada patch de color se
   escucha con `[r grid.visual.1]`, etc.
2. Abajo está el reloj: edita el mensaje `host …` con la IP de la Linux Mint,
   dale clic, ajusta el BPM y activa el toggle.

Si el patch no abre bien, se arma a mano:
`[udpreceive 9000]→[route /grid/visual/1 … /grid/lock/vote]→[s grid.visual.1]…` y
`[toggle]→[metro 1n @quantize 1n]→[transport]→[prepend /show/bar]→[udpsend <ip-linux-mint> 9100]`
(el toggle también va a `[transport]`; `[tempo $1]` fija el BPM).

**Patches de color (`max/bobGrid/`).** Copia la carpeta completa a la Mac
mini (los videos van junto a los patches) y abre `grid-router.maxpat` y los tres
patches. Cada uno trae a la derecha un bloque **THE GRID**:

| Mensaje | Qué hace en el tercio de su color |
|---|---|
| celda 1 | prende/apaga efectos A (`toggle[4]` → fractalizr/foggr) |
| celda 2 | prende/apaga efectos B (`toggle[5]` → interpol8r/delayr) |
| celda 3 | salta el crossfade del `mixfadr`: A (`0.`) ↔ B (`1.`) |
| bloqueo 1/0 | pausa / reanuda el video |
| al abrir | play del video al segundo |

Cada mensaje se imprime en la Max Console como `GRID-VERDE`, `GRID-AMARILLO`
o `GRID-ROJO`.

**Ableton (MacBook) → visuales y compás.** Ableton manda el tempo.

1. *Crear el dispositivo (una vez):* en Live arrastra un **Max MIDI Effect** a
   una pista MIDI → **Edit**. En Max abre `max/ableton/GridOSC.maxpat`,
   selecciona todo (Cmd+A), copia, pégalo en el dispositivo (borra antes el
   `midiin → midiout` que trae), edita las IPs de los dos `udpsend` (Mac mini
   :9200 y Linux Mint :9100) y guárdalo como `GridOSC.amxd`.
2. *Usarlo:* ponlo en las pistas que deben mover visuales (el MIDI sigue
   pasando al instrumento). Modo **golpes**: cada nota sale como
   `/live/hit` (tarolas 38/40 → destello). Modo **escenas**: en una pista de
   control, un clip por escena con una nota (C1 = escena 1, D1 = 2…). Las 4
   perillas se automatizan o se mapean a tu microKORG/MC-101. Deja **Compás**
   encendido en un solo dispositivo y apaga el reloj del `grid-router`.
3. *En la Mac mini:* abre `max/ableton-bridge.maxpat` junto al router y los
   patches de color.
4. *Probar sin Ableton:*
   `CONTRACT_TARGET=<ip-mac-mini>:9200 ONLY=live docker compose run --rm contract-tester`

Si mandas una versión nueva de un patch de color, los bloques se reaplican con
`python3 max/tools/agregar_bloques.py nuevo.maxpat max/bobGrid/<color>-bob-rebel-music.maxpat verde|amarillo|rojo`.

**3 — Validación por color (patches de Max).** Con `grid-router.maxpat` y los
tres patches de color abiertos en la Mac mini, manda el contrato completo
directo a Max, un mensaje cada 2 s:

```
CONTRACT_TARGET=<ip-mac-mini>:9000 docker compose run --rm contract-tester
CONTRACT_TARGET=<ip-mac-mini>:9000 ONLY=fx STEP_MS=4000 docker compose run --rm contract-tester
```

`ONLY` = `visual` | `fx` | `vote` | `lock`. Para cada línea que imprime, revisa:

- [ ] Verde 1, 2, 3: cada celda hace su cambio en el tercio verde.
- [ ] Amarilla 1, 2, 3: cada celda hace su cambio en el tercio amarillo.
- [ ] Roja 1, 2, 3 (ganador): cada celda hace su cambio en el tercio rojo.
- [ ] Bloquear/desbloquear cada color: el tercio responde como se acordó.
- [ ] Nada aparece en `print GRID-DESCONOCIDO`.

## Estructura

```
server/          Grid Server (Node + WebSocket + OSC)
web/public/      Página pública 3×3
max/             grid-router.maxpat (entrada OSC + reloj de compás)
Dockerfile
docker-compose.yml
```

## Estado

Fase 0 — Loop local. Esqueleto inicial: servidor Node/WebSocket, contrato
OSC, página 3×3 y contenedor Docker. El resto de la hoja de ruta vive en la
tarjeta de Trello "Do 'The GRID'".
