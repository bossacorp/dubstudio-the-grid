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

**0 — Pruebas automáticas** (lógica de columnas, sin red):

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

**2 — Con Max en la Mac mini.** Apaga el reloj falso
(`docker compose stop bar-clock`), agrega la Mac mini a `OSC_TARGETS`
(`osc-monitor:9000,<ip-mac-mini>:9000`) y recrea:
`docker compose --profile monitor up -d --force-recreate`. Abre
`max/grid-monitor.maxpat`:

1. Arriba (`udpreceive 9000` → `print GRID`) ves los mensajes en la Max Console.
2. Abajo está el reloj: edita el mensaje `host …` con la IP de la Linux Mint,
   dale clic, ajusta el BPM y activa el toggle.

Si el patch no abre bien, se arma a mano:
`[udpreceive 9000]→[print GRID]` y
`[toggle]→[metro 1n @quantize 1n]→[transport]→[prepend /show/bar]→[udpsend <ip-linux-mint> 9100]`
(el toggle también va a `[transport]`; `[tempo $1]` fija el BPM).

## Estructura

```
server/          Grid Server (Node + WebSocket + OSC)
web/public/      Página pública 3×3
max/             Patch de Max de prueba
Dockerfile
docker-compose.yml
```

## Estado

Fase 0 — Loop local. Esqueleto inicial: servidor Node/WebSocket, contrato
OSC, página 3×3 y contenedor Docker. El resto de la hoja de ruta vive en la
tarjeta de Trello "Do 'The GRID'".
