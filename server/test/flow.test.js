// Funcionalidad inicial de punta a punta: celulares por WebSocket → Grid
// Server → mensajes OSC (con un `send` falso) y el compás de Max por onBar.
import { test, beforeEach, afterEach } from 'node:test';
import assert from 'node:assert/strict';
import { startServer, connect, wait } from './helpers.js';

let grid;
let sent;
let base;

beforeEach(async () => {
  ({ grid, sent, base } = await startServer());
});

afterEach(() => grid.close());

const touch = (phone, column, cell, deviceId = 'cel-1') =>
  phone.send({ type: 'touch', column, cell, deviceId });

test('sirve la página pública 3×3', async () => {
  const res = await fetch(`http://${base}/`);
  assert.equal(res.status, 200);
  assert.match(await res.text(), /THE GRID/);
});

test('al conectar, el celular recibe el estado inicial', async () => {
  const phone = await connect(base);
  const { state } = await phone.next((m) => m.type === 'state');
  assert.deepEqual(state.locks, { visual: false, fx: false, vote: false });
  assert.equal(state.bar, 0);
  assert.deepEqual(state.fx, { pending: [], cooling: {} });
  phone.ws.close();
});

test('verde: cada toque sale al instante como /grid/visual/<celda> 1', async () => {
  const phone = await connect(base);
  touch(phone, 'visual', 1);
  touch(phone, 'visual', 3);
  await wait(50);
  assert.deepEqual(sent, [['/grid/visual/1', 1], ['/grid/visual/3', 1]]);
  phone.ws.close();
});

test('toques inválidos se descartan y el servidor sigue vivo', async () => {
  const phone = await connect(base);
  phone.send('esto no es json');
  phone.send({ type: 'touch', column: 'visual', cell: 4 });
  phone.send({ type: 'touch', column: 'visual', cell: '../x' });
  phone.send({ type: 'touch', column: 'visual', cell: '1' });
  phone.send({ type: 'touch', column: 'nope', cell: 1 });
  phone.send({ type: 'otra-cosa' });
  phone.send(null);
  await wait(50);
  assert.deepEqual(sent, []);

  touch(phone, 'visual', 2);
  await wait(50);
  assert.deepEqual(sent, [['/grid/visual/2', 1]]);
  phone.ws.close();
});

test('amarilla: espera al compás de Max y los celulares ven el pendiente', async () => {
  const a = await connect(base);
  const b = await connect(base);
  grid.onBar(1);
  touch(a, 'fx', 2, 'a');

  const pending = await b.next((m) => m.type === 'state' && m.state.fx.pending.length > 0);
  assert.deepEqual(pending.state.fx.pending, [2]);
  assert.deepEqual(sent, []);

  grid.onBar(2);
  assert.deepEqual(sent, [['/grid/fx/2', 1]]);
  const after = await b.next((m) => m.type === 'state' && m.state.bar === 2);
  assert.deepEqual(after.state.fx.pending, []);
  assert.deepEqual(after.state.fx.cooling, { 2: 4 });
  a.ws.close();
  b.ws.close();
});

test('roja: tres celulares votan y al compás 17 sale solo el ganador', async () => {
  const phones = await Promise.all([connect(base), connect(base), connect(base)]);
  grid.onBar(1);
  touch(phones[0], 'vote', 1, 'a');
  touch(phones[1], 'vote', 3, 'b');
  touch(phones[2], 'vote', 3, 'c');
  await wait(50);
  for (let n = 2; n <= 16; n++) grid.onBar(n);
  assert.deepEqual(sent, []);

  grid.onBar(17);
  assert.deepEqual(sent, [['/grid/vote/3', 1]]);
  const { state } = await phones[0].next((m) => m.type === 'state' && m.state.bar === 17);
  assert.equal(state.vote.barsLeft, 16);
  for (const p of phones) p.ws.close();
});

test('columna bloqueada: los toques no salen hasta desbloquear', async () => {
  const phone = await connect(base);
  const lock = (locked) => fetch(`http://${base}/operador/lock`, {
    method: 'POST',
    headers: { 'content-type': 'application/json', 'x-operator-key': 'clave-de-prueba' },
    body: JSON.stringify({ column: 'visual', locked }),
  });

  await lock(true);
  await phone.next((m) => m.type === 'state' && m.state.locks.visual);
  touch(phone, 'visual', 1);
  await wait(50);
  assert.deepEqual(sent, [['/grid/lock/visual', 1]]);

  await lock(false);
  touch(phone, 'visual', 1);
  await wait(50);
  assert.deepEqual(sent.slice(1), [['/grid/lock/visual', 0], ['/grid/visual/1', 1]]);
  phone.ws.close();
});

test('compás inválido de Max se ignora', async () => {
  const phone = await connect(base);
  grid.onBar(Number('x'));
  grid.onBar(2.5);
  grid.onBar(3);
  const { state } = await phone.next((m) => m.type === 'state' && m.state.bar !== 0);
  assert.equal(state.bar, 3);
  phone.ws.close();
});
