// Contrato OSC con UDP real: lo que sale hacia Max y lo que Max manda de
// vuelta. Si alguna de estas pruebas cambia, hay que avisar y actualizar los
// patches de Max (ver CLAUDE.md, "Contrato OSC").
import { test, after } from 'node:test';
import assert from 'node:assert/strict';
import { Client, Server } from 'node-osc';
import { OSC, COLUMNS, CELLS } from '../src/oscContract.js';

const MAX_PORT = 19000; // hace de Max recibiendo toques
const IN_PORT = 19100; // hace de OSC_IN_PORT del servidor

// osc.js lee OSC_TARGETS al cargarse, así que se fija antes de importarlo.
process.env.OSC_TARGETS = `127.0.0.1:${MAX_PORT}`;
const { sendOsc, listenOsc, closeOsc } = await import('../src/osc.js');

const closers = [];
after(() => {
  closeOsc();
  for (const close of closers) close();
});

function fakeMax(port) {
  return new Promise((resolve) => {
    const server = new Server(port, '127.0.0.1', () => resolve(server));
    closers.push(() => server.close());
  });
}

const nextMessage = (server) => new Promise((resolve) => server.once('message', resolve));

test('direcciones del contrato', () => {
  assert.deepEqual(COLUMNS, ['visual', 'fx', 'vote']);
  assert.deepEqual(CELLS, [1, 2, 3]);
  assert.equal(OSC.visual(1), '/grid/visual/1');
  assert.equal(OSC.fx(2), '/grid/fx/2');
  assert.equal(OSC.vote(3), '/grid/vote/3');
  assert.equal(OSC.lock('fx'), '/grid/lock/fx');
  assert.equal(OSC.bar, '/show/bar');
});

test('sendOsc llega a Max como dirección + entero', async () => {
  const max = await fakeMax(MAX_PORT);
  const got = nextMessage(max);
  sendOsc(OSC.visual(2), 1);
  assert.deepEqual(await got, ['/grid/visual/2', 1]);

  const lock = nextMessage(max);
  sendOsc(OSC.lock('vote'), 0);
  assert.deepEqual(await lock, ['/grid/lock/vote', 0]);
});

test('listenOsc recibe /show/bar como lo manda Max', async () => {
  const received = new Promise((resolve) => {
    const server = listenOsc(IN_PORT, (address, args) => resolve([address, args]));
    closers.push(() => server.close());
  });
  await new Promise((r) => setTimeout(r, 50));
  const max = new Client('127.0.0.1', IN_PORT);
  closers.push(() => max.close());
  max.send('/show/bar', 17);
  assert.deepEqual(await received, ['/show/bar', [17]]);
});

test('probador de contrato: recorre las 9 celdas y los 3 bloqueos', async () => {
  const { contractSequence } = await import('../src/contractTester.js');
  const all = contractSequence().map(([address, arg]) => `${address} ${arg}`);
  assert.deepEqual(all, [
    '/grid/visual/1 1', '/grid/visual/2 1', '/grid/visual/3 1',
    '/grid/fx/1 1', '/grid/fx/2 1', '/grid/fx/3 1',
    '/grid/vote/1 1', '/grid/vote/2 1', '/grid/vote/3 1',
    '/grid/lock/visual 1', '/grid/lock/visual 0',
    '/grid/lock/fx 1', '/grid/lock/fx 0',
    '/grid/lock/vote 1', '/grid/lock/vote 0',
  ]);
  assert.equal(contractSequence({ only: 'fx' }).length, 3);
  assert.equal(contractSequence({ only: 'lock' }).length, 6);
  assert.equal(contractSequence({ only: 'nope' }).length, 0);
});

test('probador en modo live: lo que manda Ableton (GridOSC)', async () => {
  const { contractSequence } = await import('../src/contractTester.js');
  const steps = contractSequence({ only: 'live' });
  const addresses = new Set(steps.map(([address]) => address));
  assert.deepEqual([...addresses].sort(), ['/live/barms', '/live/cc', '/live/hit', '/live/knob/1', '/live/scene']);
  // no se mezcla con el contrato de The Grid
  assert.equal(contractSequence().some(([address]) => address.startsWith('/live/')), false);
});

test('probador: un mensaje con varios argumentos llega completo por UDP', async () => {
  const max = await fakeMax(19200);
  const got = nextMessage(max);
  const client = new Client('127.0.0.1', 19200);
  closers.push(() => client.close());
  client.send('/live/hit', ...[].concat([38, 110]));
  assert.deepEqual(await got, ['/live/hit', 38, 110]);
});
