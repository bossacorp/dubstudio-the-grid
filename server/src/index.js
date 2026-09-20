import http from 'node:http';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import express from 'express';
import { WebSocketServer } from 'ws';
import { config } from './config.js';
import { OSC, COLUMNS } from './oscContract.js';
import { sendOsc } from './osc.js';
import { state, broadcast } from './state.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const app = express();
app.use(express.static(path.join(__dirname, '../../web/public')));
app.use(express.json());

const server = http.createServer(app);
const wss = new WebSocketServer({ server, path: '/ws' });

// Endpoint del operador (ROR) para bloquear/desbloquear columnas.
app.post('/operador/lock', (req, res) => {
  if (req.get('x-operator-key') !== config.operatorKey) {
    return res.status(401).json({ error: 'unauthorized' });
  }

  const { column, locked } = req.body ?? {};
  if (!COLUMNS.includes(column)) {
    return res.status(400).json({ error: 'unknown column' });
  }

  state.locks[column] = Boolean(locked);
  sendOsc(OSC.lock(column), state.locks[column] ? 1 : 0);
  broadcast(wss, { type: 'state', state });
  res.json({ ok: true, state });
});

wss.on('connection', (ws) => {
  ws.send(JSON.stringify({ type: 'state', state }));

  ws.on('message', (raw) => {
    let msg;
    try {
      msg = JSON.parse(raw.toString());
    } catch {
      return;
    }
    if (msg.type !== 'touch') return;

    const { column, cell, deviceId } = msg;
    if (!COLUMNS.includes(column) || state.locks[column]) return;

    sendOsc(OSC[column](cell), deviceId ?? '');
  });
});

server.listen(config.port, () => {
  console.log(`Grid Server escuchando en :${config.port}`);
});
