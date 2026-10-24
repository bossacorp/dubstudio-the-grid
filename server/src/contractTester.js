// Probador de contrato: manda a Max, en orden y con pausa, cada mensaje del
// contrato OSC para revisar color por color que cada celda reacciona, sin
// público ni servidor. Va directo a Max (no pasa por el Grid Server).
//
//   CONTRACT_TARGET=<ip-mac-mini>:9000 docker compose run --rm contract-tester
//   ONLY=fx  → solo una columna (visual | fx | vote | lock)
//   STEP_MS=3000 → pausa entre mensajes
import { pathToFileURL } from 'node:url';
import { Client } from 'node-osc';
import { OSC, COLUMNS, CELLS } from './oscContract.js';

const LABELS = { visual: 'verde', fx: 'amarilla', vote: 'roja (ganador)' };
const COLORS = { visual: 'verde', fx: 'amarilla', vote: 'roja' };

// Lista de [address, arg, descripción] en el orden en que se prueban.
export function contractSequence({ only } = {}) {
  const steps = [];
  for (const column of COLUMNS) {
    if (only && only !== column) continue;
    for (const cell of CELLS) steps.push([OSC[column](cell), 1, `${LABELS[column]} · celda ${cell}`]);
  }
  if (!only || only === 'lock') {
    for (const column of COLUMNS) {
      steps.push([OSC.lock(column), 1, `bloquear ${COLORS[column]}`]);
      steps.push([OSC.lock(column), 0, `desbloquear ${COLORS[column]}`]);
    }
  }
  return steps;
}

async function main() {
  const [host, port] = (process.env.CONTRACT_TARGET || '').split(':');
  if (!host || !port) {
    console.error('Falta CONTRACT_TARGET=<ip-mac-mini>:9000');
    process.exit(1);
  }
  const only = process.env.ONLY || undefined;
  const stepMs = Number(process.env.STEP_MS || 2000);
  const steps = contractSequence({ only });
  if (steps.length === 0) {
    console.error(`ONLY="${only}" no es válido (visual | fx | vote | lock)`);
    process.exit(1);
  }

  const client = new Client(host, Number(port));
  console.log(`Probando contrato contra ${host}:${port} (${steps.length} mensajes, ${stepMs} ms entre cada uno)`);
  for (const [i, [address, arg, label]] of steps.entries()) {
    client.send(address, arg);
    console.log(`${String(i + 1).padStart(2)}. ${address} ${arg}   ← ${label}`);
    await new Promise((r) => setTimeout(r, stepMs));
  }
  client.close();
  console.log('Listo.');
}

if (import.meta.url === pathToFileURL(process.argv[1]).href) main();
