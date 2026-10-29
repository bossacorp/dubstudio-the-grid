// Probador de contrato: manda a Max, en orden y con pausa, cada mensaje del
// contrato OSC para revisar color por color que cada celda reacciona, sin
// público ni servidor. Va directo a Max (no pasa por el Grid Server).
//
//   CONTRACT_TARGET=<ip-mac-mini>:9000 docker compose run --build --rm contract-tester
//   ONLY=fx  → solo una columna (visual | fx | vote | lock)
//   ONLY=live → simula a Ableton contra ableton-bridge.maxpat (puerto 9200):
//   CONTRACT_TARGET=<ip-mac-mini>:9200 ONLY=live docker compose run --build --rm contract-tester
//   STEP_MS=3000 → pausa entre mensajes
import { pathToFileURL } from 'node:url';
import { Client } from 'node-osc';
import { OSC, COLUMNS, CELLS } from './oscContract.js';

const LABELS = { visual: 'verde', fx: 'amarilla', vote: 'roja (ganador)' };
const COLORS = { visual: 'verde', fx: 'amarilla', vote: 'roja' };

// Lo que manda el dispositivo GridOSC de Ableton (max/ableton/GridOSC.maxpat).
function liveSequence() {
  return [
    ['/live/hit', [38, 110], 'tarola (38) → destello en los tres tercios'],
    ['/live/hit', [40, 90], 'tarola (40) → destello'],
    ['/live/hit', [36, 100], 'bombo (36) → solo live.hit, sin destello'],
    ['/live/knob/1', 0.0, 'perilla 1 = 0 → crossfade en A'],
    ['/live/knob/1', 0.5, 'perilla 1 = 0.5 → crossfade a la mitad'],
    ['/live/knob/1', 1.0, 'perilla 1 = 1 → crossfade en B'],
    ['/live/cc', [21, 0], 'CC 21 = 0 → perilla 1 en 0'],
    ['/live/scene', 1, 'escena 1 → solo efectos A'],
    ['/live/scene', 2, 'escena 2 → solo efectos B'],
    ['/live/scene', 3, 'escena 3 → A+B mezclados'],
    ['/live/scene', 4, 'escena 4 → limpio'],
  ];
}

// Lista de [address, arg(s), descripción] en el orden en que se prueban.
export function contractSequence({ only } = {}) {
  if (only === 'live') return liveSequence();
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
    console.error(`ONLY="${only}" no es válido (visual | fx | vote | lock | live)`);
    process.exit(1);
  }

  const client = new Client(host, Number(port));
  console.log(`Probando contrato contra ${host}:${port} (${steps.length} mensajes, ${stepMs} ms entre cada uno)`);
  for (const [i, [address, arg, label]] of steps.entries()) {
    const args = [].concat(arg);
    client.send(address, ...args);
    console.log(`${String(i + 1).padStart(2)}. ${address} ${args.join(' ')}   ← ${label}`);
    await new Promise((r) => setTimeout(r, stepMs));
  }
  client.close();
  console.log('Listo.');
}

if (import.meta.url === pathToFileURL(process.argv[1]).href) main();
