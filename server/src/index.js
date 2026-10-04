import http from 'node:http';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import express from 'express';
import { WebSocketServer } from 'ws';
import { config } from './config.js';
import { OSC, COLUMNS, CELLS } from './oscContract.js';
import { sendOsc, listenOsc } from './osc.js';
import { state, columns, publicState, broadcast } from './state.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const app = express();
app.use(express.static(path.join(__dirname, '../../web/public')));
app.use(express.json());

const server = http.createServer(app);
const wss = new WebSocketServer({ server, path: '/ws' });

const broadcastState = () => broadcast(wss, { type: 'state', state: publicState() });

function run({ send, log }) {
  for (const [address, arg] of send) sendOsc(address, arg);
  for (const line of log) console.log(line);
}

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
  if (state.locks[column]) columns.clear(column);
  sendOsc(OSC.lock(column), state.locks[column] ? 1 : 0);
  broadcastState();
  res.json({ ok: true, state: publicState() });
});

wss.on('connection', (ws) => {
  ws.send(JSON.stringify({ type: 'state', state: publicState() }));

  ws.on('message', (raw) => {
    let msg;
    try {
      msg = JSON.parse(raw.toString());
    } catch {
      return;
    }
    if (msg.type !== 'touch') return;

    const { column, cell, deviceId } = msg;
    if (!COLUMNS.includes(column) || !CELLS.includes(cell)) return;
    if (state.locks[column]) return;

    const result = columns.touch(column, cell, deviceId);
    run(result);
    if (result.changed) broadcastState();
  });
});

// Max marca el compás: en cada /show/bar salen los fx pendientes y, al
// cambiar de ventana, el ganador del voto.
listenOsc(config.oscInPort, (address, args) => {
  if (address !== OSC.bar) return;
  const bar = Number(args[0]);
  if (!Number.isInteger(bar)) return;
  if (columns.view().bar === 0) console.log(`Primer compás recibido de Max: ${bar}`);
  run(columns.onBar(bar));
  broadcastState();
});

server.listen(config.port, () => {
  console.log(`Grid Server escuchando en :${config.port}`);
});
