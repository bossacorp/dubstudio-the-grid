import { test, beforeEach, afterEach } from 'node:test';
import assert from 'node:assert/strict';
import { keyMatches } from '../src/app.js';
import { startServer, connect as connectTo } from './helpers.js';

const KEY = 'clave-de-prueba';
let grid;
let sent;
let base;

beforeEach(async () => {
  ({ grid, sent, base } = await startServer({ operatorKey: KEY }));
});

afterEach(() => grid.close());

const connect = () => connectTo(base);

async function operator() {
  const op = await connect();
  op.send({ type: 'hello', role: 'operator', key: KEY });
  await op.next((m) => m.type === 'operator');
  return op;
}

test('keyMatches solo acepta la clave exacta', () => {
  assert.equal(keyMatches(KEY, KEY), true);
  assert.equal(keyMatches('otra', KEY), false);
  assert.equal(keyMatches(undefined, KEY), false);
  assert.equal(keyMatches(KEY, ''), false);
});

test('/operador sirve la página del operador', async () => {
  const res = await fetch(`http://${base}/operador`);
  assert.equal(res.status, 200);
  assert.match(await res.text(), /OPERADOR/);
});

test('el público recibe estado sin conteo de votos', async () => {
  const phone = await connect();
  const msg = await phone.next((m) => m.type === 'state');
  assert.equal(msg.state.vote.tally, undefined);
  assert.equal(msg.state.events, undefined);
  phone.ws.close();
});

test('clave incorrecta: error y se cierra la conexión', async () => {
  const op = await connect();
  const closed = new Promise((resolve) => op.ws.once('close', (code) => resolve(code)));
  op.send({ type: 'hello', role: 'operator', key: 'mala' });
  const msg = await op.next((m) => m.type === 'error');
  assert.equal(msg.error, 'unauthorized');
  assert.equal(await closed, 4001);
});

test('sin hello de operador no se puede bloquear ni anular', async () => {
  const phone = await connect();
  phone.send({ type: 'lock', column: 'fx', locked: true });
  phone.send({ type: 'cancelVote' });
  await new Promise((r) => setTimeout(r, 100));
  assert.deepEqual(sent, []);
  phone.ws.close();
});

test('el operador bloquea: OSC /grid/lock, el público se entera y queda en la bitácora', async () => {
  const phone = await connect();
  await phone.next((m) => m.type === 'state');
  const op = await operator();

  op.send({ type: 'lock', column: 'fx', locked: true });
  const pub = await phone.next((m) => m.type === 'state' && m.state.locks.fx);
  assert.equal(pub.state.locks.fx, true);
  const opMsg = await op.next((m) => m.type === 'operator' && m.state.locks.fx);
  assert.equal(opMsg.state.events[0].text, 'amarilla bloqueada (operador)');
  assert.deepEqual(sent, [['/grid/lock/fx', 1]]);

  // bloqueada: los toques no cuentan
  phone.send({ type: 'touch', column: 'fx', cell: 1, deviceId: 'a' });
  op.send({ type: 'lock', column: 'fx', locked: false });
  const unlocked = await op.next((m) => m.type === 'operator' && !m.state.locks.fx);
  assert.equal(unlocked.state.touches.fx, 0);
  assert.deepEqual(sent.at(-1), ['/grid/lock/fx', 0]);

  phone.ws.close();
  op.ws.close();
});

test('el operador ve conteo de votos, toques y celulares conectados', async () => {
  const op = await operator();
  const a = await connect();
  const b = await connect();
  a.send({ type: 'touch', column: 'vote', cell: 2, deviceId: 'a' });
  b.send({ type: 'touch', column: 'vote', cell: 2, deviceId: 'b' });
  a.send({ type: 'touch', column: 'visual', cell: 1, deviceId: 'a' });

  const msg = await op.next(
    (m) => m.type === 'operator' && m.state.vote.tally[2] === 2 && m.state.touches.visual === 1,
  );
  assert.equal(msg.state.phones, 2);
  assert.equal(msg.state.operators, 1);
  assert.deepEqual(sent, [['/grid/visual/1', 1]]);

  a.ws.close();
  b.ws.close();
  op.ws.close();
});

test('anular voto en curso: no sale ganador al cerrar la ventana', async () => {
  const op = await operator();
  const phone = await connect();
  grid.onBar(1);
  phone.send({ type: 'touch', column: 'vote', cell: 3, deviceId: 'a' });
  await op.next((m) => m.type === 'operator' && m.state.vote.tally[3] === 1);

  op.send({ type: 'cancelVote' });
  const msg = await op.next((m) => m.type === 'operator' && m.state.events.length > 0);
  assert.equal(msg.state.events[0].text, 'voto en curso anulado (operador)');
  assert.deepEqual(msg.state.vote.tally, { 1: 0, 2: 0, 3: 0 });

  grid.onBar(17);
  assert.deepEqual(sent, []);
  phone.ws.close();
  op.ws.close();
});

test('POST /operador/lock exige la clave', async () => {
  const post = (key) => fetch(`http://${base}/operador/lock`, {
    method: 'POST',
    headers: { 'content-type': 'application/json', ...(key ? { 'x-operator-key': key } : {}) },
    body: JSON.stringify({ column: 'vote', locked: true }),
  });
  assert.equal((await post()).status, 401);
  assert.equal((await post('mala')).status, 401);
  assert.deepEqual(sent, []);
  const ok = await post(KEY);
  assert.equal(ok.status, 200);
  assert.deepEqual(sent, [['/grid/lock/vote', 1]]);
});
