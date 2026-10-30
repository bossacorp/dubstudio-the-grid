// Grid Server sin OSC ni puertos fijos: HTTP + WebSocket + operador.
// index.js le conecta OSC; las pruebas lo arrancan con un `send` falso.
import http from 'node:http';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
import express from 'express';
import { WebSocketServer } from 'ws';
import { OSC, COLUMNS, CELLS } from './oscContract.js';
import { createColumns } from './columns.js';

const publicDir = path.join(path.dirname(fileURLToPath(import.meta.url)), '../../web/public');
const COLUMN_LABELS = { visual: 'verde', fx: 'amarilla', vote: 'roja' };
const MAX_EVENTS = 30;
const OPERATOR_THROTTLE_MS = 200;
const WINNER_BARS_MAX = 64;
// Estilos de arte de las celdas (celular y /pantalla); el operador cambia en vivo.
export const THEMES = ['clasico', 'psicodelico', 'atmosferico', 'naturaleza', 'elegante'];
const FIRE_ADDRESS = /^\/grid\/(visual|fx|vote)\/([1-3])$/;

// Compara la clave sin filtrar por tiempo de respuesta cuántos caracteres acertó.
export function keyMatches(given, expected) {
  if (typeof given !== 'string' || !expected) return false;
  const hash = (s) => crypto.createHash('sha256').update(s).digest();
  return crypto.timingSafeEqual(hash(given), hash(expected));
}

export function createGridServer({
  operatorKey,
  send,
  columns = createColumns(),
  log = console.log,
  publicUrl = '',
  winnerBars = 16,
  theme = 'clasico',
}) {
  const locks = Object.fromEntries(COLUMNS.map((column) => [column, false]));
  const touches = Object.fromEntries(COLUMNS.map((column) => [column, 0]));
  const events = []; // bitácora del operador, la más reciente primero
  // Lo que muestra /pantalla (OBS). winner: { cell, fromBar, untilBar }.
  const display = {
    qr: true,
    winnerBars,
    winner: null,
    theme: THEMES.includes(theme) ? theme : 'clasico',
  };

  const app = express();
  app.use(express.json());
  app.get('/operador', (req, res) => res.sendFile(path.join(publicDir, 'operador.html')));
  app.get('/pantalla', (req, res) => res.sendFile(path.join(publicDir, 'pantalla.html')));
  app.use(express.static(publicDir));

  const server = http.createServer(app);
  const wss = new WebSocketServer({ server, path: '/ws' });

  const isOperator = (ws) => ws.role === 'operator';
  const isScreen = (ws) => ws.role === 'screen';

  // Ganador vigente: se muestra desde el compás en que cerró el voto durante
  // display.winnerBars compases (si Max reinicia el transport, se apaga).
  function currentWinner() {
    const { bar } = columns.view();
    const w = display.winner;
    if (!w || bar < w.fromBar || bar >= w.untilBar) return null;
    return { cell: w.cell, barsLeft: w.untilBar - bar };
  }

  function publicState() {
    return {
      locks,
      ...columns.view(),
      display: { qr: display.qr, publicUrl, winner: currentWinner(), theme: display.theme },
    };
  }

  function operatorState() {
    const view = columns.view();
    let phones = 0;
    let operators = 0;
    let screens = 0;
    for (const client of wss.clients) {
      if (isOperator(client)) operators += 1;
      else if (isScreen(client)) screens += client.monitor ? 0 : 1;
      else phones += 1;
    }
    const pub = publicState();
    return {
      ...pub,
      vote: { ...view.vote, tally: columns.tally() },
      display: { ...pub.display, winnerBars: display.winnerBars },
      touches,
      phones,
      operators,
      screens,
      events,
    };
  }

  function addEvent(text) {
    events.unshift({ time: Date.now(), text });
    events.length = Math.min(events.length, MAX_EVENTS);
    log(text);
  }

  // Cada mensaje OSC de una celda también hace destellar esa celda en /pantalla.
  function run({ send: out, log: lines }) {
    for (const [address, arg] of out) {
      send(address, arg);
      const fire = FIRE_ADDRESS.exec(address);
      if (fire) sendToScreens({ type: 'fire', column: fire[1], cell: Number(fire[2]) });
    }
    for (const line of lines) addEvent(line);
  }

  function sendToScreens(payload) {
    const data = JSON.stringify(payload);
    for (const client of wss.clients) {
      if (isScreen(client) && client.readyState === client.OPEN) client.send(data);
    }
  }

  function sendTo(ws, payload) {
    if (ws.readyState === ws.OPEN) ws.send(JSON.stringify(payload));
  }

  function broadcastAll() {
    const pub = JSON.stringify({ type: 'state', state: publicState() });
    const op = JSON.stringify({ type: 'operator', state: operatorState() });
    for (const client of wss.clients) {
      if (client.readyState === client.OPEN) client.send(isOperator(client) ? op : pub);
    }
  }

  // Lo que solo le importa al operador (toques, votos, conexiones) se agrupa
  // para no mandarle un mensaje por cada toque del público.
  let operatorTimer = null;
  function notifyOperators() {
    if (operatorTimer) return;
    operatorTimer = setTimeout(() => {
      operatorTimer = null;
      const op = JSON.stringify({ type: 'operator', state: operatorState() });
      for (const client of wss.clients) {
        if (isOperator(client) && client.readyState === client.OPEN) client.send(op);
      }
    }, OPERATOR_THROTTLE_MS);
  }

  function setLock(column, locked, by) {
    locks[column] = Boolean(locked);
    if (locks[column]) columns.clear(column);
    send(OSC.lock(column), locks[column] ? 1 : 0);
    addEvent(`${COLUMN_LABELS[column]} ${locks[column] ? 'bloqueada' : 'desbloqueada'} (${by})`);
    broadcastAll();
  }

  function setDisplay({ qr, winnerBars: bars, theme: newTheme }, by) {
    if (typeof qr === 'boolean' && qr !== display.qr) {
      display.qr = qr;
      addEvent(`QR ${qr ? 'visible' : 'oculto'} en pantalla (${by})`);
    }
    if (THEMES.includes(newTheme) && newTheme !== display.theme) {
      display.theme = newTheme;
      addEvent(`estilo de las celdas: ${newTheme} (${by})`);
    }
    if (Number.isInteger(bars) && bars >= 1 && bars <= WINNER_BARS_MAX) {
      display.winnerBars = bars;
      // También ajusta al ganador que se está mostrando.
      if (display.winner) display.winner.untilBar = display.winner.fromBar + bars;
      addEvent(`ganador en pantalla: ${bars} compases (${by})`);
    }
    broadcastAll();
  }

  function cancelVote(by) {
    columns.clear('vote');
    addEvent(`voto en curso anulado (${by})`);
    broadcastAll();
  }

  function touch({ column, cell, deviceId }) {
    if (!COLUMNS.includes(column) || !CELLS.includes(cell) || locks[column]) return;
    touches[column] += 1;
    const result = columns.touch(column, cell, deviceId);
    run(result);
    if (result.changed) broadcastAll();
    else notifyOperators();
  }

  function hello(ws, { role, key, monitor }) {
    if (role === 'screen') {
      ws.role = 'screen';
      // Vista previa (p. ej. la miniatura del operador): recibe todo pero no
      // cuenta como pantalla de OBS.
      ws.monitor = monitor === true;
      notifyOperators();
      return;
    }
    if (role !== 'operator') return;
    if (!keyMatches(key, operatorKey)) {
      sendTo(ws, { type: 'error', error: 'unauthorized' });
      ws.close(4001, 'unauthorized');
      return;
    }
    ws.role = 'operator';
    sendTo(ws, { type: 'operator', state: operatorState() });
    notifyOperators();
  }

  // Endpoint HTTP del operador (para scripts); la página usa el WebSocket.
  app.post('/operador/lock', (req, res) => {
    if (!keyMatches(req.get('x-operator-key'), operatorKey)) {
      return res.status(401).json({ error: 'unauthorized' });
    }
    const { column, locked } = req.body ?? {};
    if (!COLUMNS.includes(column)) {
      return res.status(400).json({ error: 'unknown column' });
    }
    setLock(column, locked, 'http');
    res.json({ ok: true, state: publicState() });
  });

  wss.on('connection', (ws) => {
    sendTo(ws, { type: 'state', state: publicState() });
    notifyOperators();
    ws.on('close', notifyOperators);

    ws.on('message', (raw) => {
      let msg;
      try {
        msg = JSON.parse(raw.toString());
      } catch {
        return;
      }
      if (!msg || typeof msg !== 'object') return;

      if (msg.type === 'hello') return hello(ws, msg);
      if (msg.type === 'touch') return touch(msg);

      // De aquí para abajo, solo el operador.
      if (!isOperator(ws)) return;
      if (msg.type === 'lock' && COLUMNS.includes(msg.column)) {
        setLock(msg.column, msg.locked, 'operador');
      }
      if (msg.type === 'cancelVote') cancelVote('operador');
      if (msg.type === 'display') setDisplay(msg, 'operador');
    });
  });

  // Max marca el compás: salen los fx pendientes y, al cambiar de ventana,
  // el ganador del voto.
  function onBar(bar) {
    if (!Number.isInteger(bar)) return;
    if (columns.view().bar === 0) log(`Primer compás recibido de Max: ${bar}`);
    const result = columns.onBar(bar);
    if (result.winner) {
      display.winner = { cell: result.winner, fromBar: bar, untilBar: bar + display.winnerBars };
    }
    run(result);
    broadcastAll();
  }

  function close() {
    clearTimeout(operatorTimer);
    for (const client of wss.clients) client.terminate();
    wss.close();
    return new Promise((resolve) => server.close(resolve));
  }

  return { server, onBar, close };
}
