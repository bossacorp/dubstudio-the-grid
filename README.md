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

### Probar el loop

**Tramo 1 — todo en la Linux Mint.** En `server/.env` pon
`OSC_TARGETS=osc-monitor:9000` y levanta servidor + monitor OSC:

```
docker compose --profile monitor up --build
docker compose --profile monitor logs -f osc-monitor
```

Abre `http://<ip-linux-mint>:8080` en el celular (misma Wi-Fi) y toca una
celda: el monitor imprime `/grid/visual/N [1]`, etc.

**Tramo 2 — Mac mini con Max 8.** Abre `max/grid-monitor.maxpat`:

1. La parte de arriba (`udpreceive 9000` → `print GRID`) muestra los toques en
   la Max Console (Cmd+M). Agrega la Mac mini a `OSC_TARGETS`
   (`osc-monitor:9000,<ip-mac-mini>:9000`) y recrea los contenedores con
   `docker compose --profile monitor up -d --force-recreate`.
2. La parte de abajo es el reloj de compás: edita el mensaje `host …` con la IP
   de la Linux Mint, dale clic, ajusta el BPM y activa el toggle. Cada compás
   manda `/show/bar <n>` al puerto 9100; el log del servidor muestra
   `Primer compás recibido de Max`.

Si el patch no abre bien, se arma a mano con los mismos objetos:
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
