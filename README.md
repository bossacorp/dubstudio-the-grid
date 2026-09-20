# The Grid

Grilla 3×3 en colores rasta, proyectada y controlada por el público desde su
celular (web por QR). El público toca celdas; el Grid Server reenvía esos
toques por OSC hacia la proyección (Mac mini) y hacia Ableton/M4L (MacBook).

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

## Estructura

```
server/          Grid Server (Node + WebSocket + OSC)
web/public/      Página pública 3×3
Dockerfile
docker-compose.yml
```

## Estado

Fase 0 — Loop local. Esqueleto inicial: servidor Node/WebSocket, contrato
OSC, página 3×3 y contenedor Docker. El resto de la hoja de ruta vive en la
tarjeta de Trello "Do 'The GRID'".
