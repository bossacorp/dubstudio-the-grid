// Utilidades compartidas por las pruebas del servidor (no contiene pruebas).
import WebSocket from 'ws';
import { createGridServer } from '../src/app.js';

// Arranca un Grid Server en un puerto libre con un `send` OSC falso que
// guarda cada mensaje en `sent`.
export async function startServer({ operatorKey = 'clave-de-prueba', ...opts } = {}) {
  const sent = [];
  const grid = createGridServer({
    operatorKey,
    send: (address, arg) => sent.push([address, arg]),
    log: () => {},
    ...opts,
  });
  await new Promise((resolve) => grid.server.listen(0, '127.0.0.1', resolve));
  const base = `127.0.0.1:${grid.server.address().port}`;
  return { grid, sent, base };
}

// Abre un WebSocket y guarda todos los mensajes; `next(pred)` espera al
// primero (ya llegado o por llegar) que cumpla el predicado y descarta los
// anteriores, para no confundir un estado viejo con uno nuevo.
export async function connect(base) {
  const ws = new WebSocket(`ws://${base}/ws`);
  const inbox = [];
  const waiters = [];
  ws.on('message', (raw) => {
    const msg = JSON.parse(raw.toString());
    const w = waiters.find((x) => x.pred(msg));
    if (w) {
      waiters.splice(waiters.indexOf(w), 1);
      w.resolve(msg);
    } else {
      inbox.push(msg);
    }
  });
  await new Promise((resolve, reject) => {
    ws.once('open', resolve);
    ws.once('error', reject);
  });
  const next = (pred, timeout = 1000) => {
    const i = inbox.findIndex(pred);
    if (i >= 0) return Promise.resolve(inbox.splice(0, i + 1).at(-1));
    inbox.length = 0;
    return new Promise((resolve, reject) => {
      const timer = setTimeout(() => reject(new Error('timeout esperando mensaje')), timeout);
      waiters.push({ pred, resolve: (msg) => { clearTimeout(timer); resolve(msg); } });
    });
  };
  const send = (obj) => ws.send(typeof obj === 'string' ? obj : JSON.stringify(obj));
  return { ws, next, send, inbox };
}

export const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
