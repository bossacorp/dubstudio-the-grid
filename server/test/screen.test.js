// /pantalla (OBS): rol "screen", destellos, ganador del voto, QR y la
// configuración que el operador cambia en vivo.
import { test, afterEach } from 'node:test';
import assert from 'node:assert/strict';
import { startServer, connect, wait } from './helpers.js';

const KEY = 'clave-de-prueba';
let grid;

afterEach(() => grid?.close());

async function setup(opts = {}) {
  const started = await startServer({ operatorKey: KEY, ...opts });
  grid = started.grid;
  return started;
}

async function screen(base) {
  const s = await connect(base);
  s.send({ type: 'hello', role: 'screen' });
  await s.next((m) => m.type === 'state');
  return s;
}

async function operator(base) {
  const op = await connect(base);
  op.send({ type: 'hello', role: 'operator', key: KEY });
  await op.next((m) => m.type === 'operator');
  return op;
}

test('/pantalla sirve la página y el QR viene incluido (sin internet)', async () => {
  const { base } = await setup();
  const page = await fetch(`http://${base}/pantalla`);
  assert.equal(page.status, 200);
  assert.match(await page.text(), /vendor\/qrcode\.js/);
  const lib = await fetch(`http://${base}/vendor/qrcode.js`);
  assert.equal(lib.status, 200);
});

test('por defecto el QR se muestra; PUBLIC_URL viaja en el estado', async () => {
  const { base } = await setup({ publicUrl: 'http://192.168.1.45:8080' });
  const s = await connect(base);
  const { state } = await s.next((m) => m.type === 'state');
  assert.deepEqual(state.display, { qr: true, publicUrl: 'http://192.168.1.45:8080', winner: null });
  s.ws.close();
});

test('la pantalla no cuenta como celular', async () => {
  const { base } = await setup();
  const op = await operator(base);
  const s = await screen(base);
  const phone = await connect(base);
  const msg = await op.next((m) => m.type === 'operator' && m.state.screens === 1 && m.state.phones === 1);
  assert.equal(msg.state.operators, 1);
  for (const c of [op, s, phone]) c.ws.close();
});

test('destellos: verde al tocar y amarilla cuando sale en el compás', async () => {
  const { base } = await setup();
  const s = await screen(base);
  const phone = await connect(base);

  phone.send({ type: 'touch', column: 'visual', cell: 2, deviceId: 'a' });
  assert.deepEqual(await s.next((m) => m.type === 'fire'), { type: 'fire', column: 'visual', cell: 2 });

  grid.onBar(1);
  phone.send({ type: 'touch', column: 'fx', cell: 3, deviceId: 'a' });
  await s.next((m) => m.type === 'state' && m.state.fx.pending.includes(3));
  grid.onBar(2);
  assert.deepEqual(await s.next((m) => m.type === 'fire'), { type: 'fire', column: 'fx', cell: 3 });

  // Los celulares no reciben destellos.
  await wait(50);
  assert.equal(phone.inbox.some((m) => m.type === 'fire'), false);
  s.ws.close();
  phone.ws.close();
});

test('ganador del voto: se muestra 16 compases por defecto', async () => {
  const { base } = await setup();
  const s = await screen(base);
  const phone = await connect(base);
  grid.onBar(1);
  phone.send({ type: 'touch', column: 'vote', cell: 1, deviceId: 'a' });
  await wait(50);
  for (let n = 2; n <= 17; n++) grid.onBar(n);

  let msg = await s.next((m) => m.type === 'state' && m.state.bar === 17);
  assert.deepEqual(msg.state.display.winner, { cell: 1, barsLeft: 16 });
  for (let n = 18; n <= 32; n++) grid.onBar(n);
  msg = await s.next((m) => m.type === 'state' && m.state.bar === 32);
  assert.deepEqual(msg.state.display.winner, { cell: 1, barsLeft: 1 });
  grid.onBar(33);
  msg = await s.next((m) => m.type === 'state' && m.state.bar === 33);
  assert.equal(msg.state.display.winner, null);
  s.ws.close();
  phone.ws.close();
});

test('duración del ganador configurable (servidor y operador en vivo)', async () => {
  const { base } = await setup({ winnerBars: 4 });
  const op = await operator(base);
  const phone = await connect(base);
  grid.onBar(1);
  phone.send({ type: 'touch', column: 'vote', cell: 2, deviceId: 'a' });
  await wait(50);
  grid.onBar(17);
  let msg = await op.next((m) => m.type === 'operator' && m.state.bar === 17);
  assert.deepEqual(msg.state.display.winner, { cell: 2, barsLeft: 4 });
  assert.equal(msg.state.display.winnerBars, 4);

  // El operador lo alarga a 8: aplica también al ganador que se ve ahora.
  op.send({ type: 'display', winnerBars: 8 });
  msg = await op.next((m) => m.type === 'operator' && m.state.display.winnerBars === 8);
  assert.deepEqual(msg.state.display.winner, { cell: 2, barsLeft: 8 });
  assert.equal(msg.state.events[0].text, 'ganador en pantalla: 8 compases (operador)');

  // Valores fuera de rango se ignoran.
  for (const winnerBars of [0, 65, 2.5, '4']) op.send({ type: 'display', winnerBars });
  await wait(250);
  op.send({ type: 'display', qr: true }); // sin cambio, solo para recibir estado
  msg = await op.next((m) => m.type === 'operator');
  assert.equal(msg.state.display.winnerBars, 8);
  op.ws.close();
  phone.ws.close();
});

test('el operador oculta y muestra el QR; el público no puede', async () => {
  const { base } = await setup();
  const s = await screen(base);
  const phone = await connect(base);

  phone.send({ type: 'display', qr: false });
  await wait(50);
  const op = await operator(base);
  op.send({ type: 'display', qr: false });
  let msg = await s.next((m) => m.type === 'state' && m.state.display.qr === false);
  assert.equal(msg.state.display.qr, false);
  const opMsg = await op.next((m) => m.type === 'operator' && m.state.display.qr === false);
  assert.equal(opMsg.state.events[0].text, 'QR oculto en pantalla (operador)');

  op.send({ type: 'display', qr: true });
  msg = await s.next((m) => m.type === 'state' && m.state.display.qr === true);
  assert.equal(msg.state.display.qr, true);
  for (const c of [s, phone, op]) c.ws.close();
});

test('si Max reinicia el transport, el ganador deja de mostrarse', async () => {
  const { base } = await setup();
  const s = await screen(base);
  const phone = await connect(base);
  grid.onBar(1);
  phone.send({ type: 'touch', column: 'vote', cell: 3, deviceId: 'a' });
  await wait(50);
  grid.onBar(17);
  await s.next((m) => m.type === 'state' && m.state.display.winner?.cell === 3);
  grid.onBar(1);
  const msg = await s.next((m) => m.type === 'state' && m.state.bar === 1);
  assert.equal(msg.state.display.winner, null);
  s.ws.close();
  phone.ws.close();
});
