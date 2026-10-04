import { test } from 'node:test';
import assert from 'node:assert/strict';
import { createColumns } from '../src/columns.js';

const sent = (result) => result.send.map(([address]) => address);

test('verde sale al instante', () => {
  const c = createColumns();
  assert.deepEqual(sent(c.touch('visual', 2)), ['/grid/visual/2']);
});

test('amarilla espera al siguiente compás', () => {
  const c = createColumns();
  c.onBar(1);
  assert.deepEqual(sent(c.touch('fx', 1)), []);
  assert.deepEqual(c.view().fx.pending, [1]);
  assert.deepEqual(sent(c.onBar(2)), ['/grid/fx/1']);
  assert.deepEqual(c.view().fx.pending, []);
  assert.deepEqual(sent(c.onBar(3)), []);
});

test('amarilla: toques antes del primer compás salen en el primero', () => {
  const c = createColumns();
  c.touch('fx', 3);
  assert.deepEqual(sent(c.onBar(1)), ['/grid/fx/3']);
});

test('amarilla: gana la más tocada; empate = la primera tocada', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('fx', 1);
  c.touch('fx', 2);
  c.touch('fx', 2);
  assert.deepEqual(sent(c.onBar(2)), ['/grid/fx/2']);

  c.touch('fx', 3);
  c.touch('fx', 1);
  assert.deepEqual(sent(c.onBar(3)), ['/grid/fx/3']);
});

test('amarilla: enfriamiento de 4 compases por celda', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('fx', 1);
  c.onBar(2); // dispara fx 1 → enfriada en compases 2, 3, 4, 5
  assert.deepEqual(c.view().fx.cooling, { 1: 4 });

  c.touch('fx', 1);
  c.touch('fx', 2); // otra celda sí puede
  assert.deepEqual(sent(c.onBar(3)), ['/grid/fx/2']);

  c.onBar(4);
  c.onBar(5);
  c.touch('fx', 1);
  assert.deepEqual(sent(c.onBar(6)), []); // tocada en el 5, aún enfriada
  c.touch('fx', 1);
  assert.deepEqual(sent(c.onBar(7)), ['/grid/fx/1']);
});

test('roja: al cerrar la ventana sale solo el ganador', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('vote', 1, 'a');
  c.touch('vote', 3, 'b');
  c.touch('vote', 3, 'c');
  for (let n = 2; n <= 16; n++) assert.deepEqual(sent(c.onBar(n)), []);
  assert.equal(c.view().vote.barsLeft, 1);
  assert.deepEqual(sent(c.onBar(17)), ['/grid/vote/3']);
  assert.equal(c.view().vote.barsLeft, 16);
  // la ventana siguiente empieza vacía
  assert.deepEqual(sent(c.onBar(33)), []);
});

test('roja: un voto por celular, cuenta el último', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('vote', 1, 'a');
  c.touch('vote', 1, 'b');
  c.touch('vote', 2, 'a'); // 'a' cambia de opinión → 1 voto para 1 y 1 para 2
  c.touch('vote', 2, 'c');
  const result = c.onBar(17);
  assert.deepEqual(sent(result), ['/grid/vote/2']);
  assert.match(result.log[0], /2 de 3 votos/);
});

test('roja: sin deviceId no cuenta; sin votos no sale nada', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('vote', 1);
  assert.deepEqual(sent(c.onBar(17)), []);
});

test('roja: empate se decide al azar', () => {
  const pick = (r) => {
    const c = createColumns({ random: () => r });
    c.onBar(1);
    c.touch('vote', 1, 'a');
    c.touch('vote', 2, 'b');
    return sent(c.onBar(17));
  };
  assert.deepEqual(pick(0), ['/grid/vote/1']);
  assert.deepEqual(pick(0.99), ['/grid/vote/2']);
});

test('roja: si se salta un compás igual cierra la ventana', () => {
  const c = createColumns();
  c.onBar(15);
  c.touch('vote', 2, 'a');
  assert.deepEqual(sent(c.onBar(18)), ['/grid/vote/2']);
});

test('bloquear descarta lo pendiente', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('fx', 1);
  c.touch('vote', 1, 'a');
  c.clear('fx');
  c.clear('vote');
  assert.deepEqual(sent(c.onBar(17)), []);
});

test('reinicio del transport limpia ventanas y enfriamientos', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('fx', 1);
  c.onBar(2);
  c.onBar(10);
  c.touch('vote', 3, 'a');
  const result = c.onBar(1); // Max volvió a 1
  assert.deepEqual(sent(result), []);
  assert.match(result.log[0], /reiniciado/);
  assert.deepEqual(c.view().fx.cooling, {});
  c.touch('fx', 1);
  assert.deepEqual(sent(c.onBar(2)), ['/grid/fx/1']);
  assert.deepEqual(sent(c.onBar(17)), []); // el voto viejo se descartó
});

test('compás repetido o inválido no hace nada', () => {
  const c = createColumns();
  c.onBar(1);
  c.touch('fx', 1);
  assert.deepEqual(sent(c.onBar(1)), []);
  assert.deepEqual(sent(c.onBar(0)), []);
  assert.deepEqual(sent(c.onBar(2.5)), []);
  assert.deepEqual(sent(c.onBar(2)), ['/grid/fx/1']);
});

test('roja: round cambia al cerrar ventana, bloquear o reiniciar', () => {
  const c = createColumns();
  c.onBar(1);
  const r0 = c.view().vote.round;
  c.onBar(17);
  const r1 = c.view().vote.round;
  assert.ok(r1 > r0);
  c.clear('vote');
  const r2 = c.view().vote.round;
  assert.ok(r2 > r1);
  c.onBar(5);
  assert.ok(c.view().vote.round > r2);
});

test('roja: tally cuenta el voto vigente de cada celular', () => {
  const c = createColumns();
  c.onBar(1);
  assert.deepEqual(c.tally(), { 1: 0, 2: 0, 3: 0 });
  c.touch('vote', 1, 'a');
  c.touch('vote', 3, 'b');
  c.touch('vote', 3, 'a'); // 'a' cambia a 3
  assert.deepEqual(c.tally(), { 1: 0, 2: 0, 3: 2 });
  assert.equal('tally' in c.view().vote, false); // el público no lo ve
  c.clear('vote');
  assert.deepEqual(c.tally(), { 1: 0, 2: 0, 3: 0 });
});
