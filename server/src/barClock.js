// Reloj de compás de prueba ("Max falso"): manda /show/bar <n> al Grid Server
// a un BPM fijo. Sirve para probar la amarilla y la roja sin la Mac mini.
// No lo corras al mismo tiempo que el reloj de Max: serían dos relojes.
import { Client } from 'node-osc';
import { OSC } from './oscContract.js';

const [host, port] = (process.env.BAR_CLOCK_TARGET || '127.0.0.1:9100').split(':');
const bpm = Number(process.env.BPM || 120);
const beatsPerBar = Number(process.env.BEATS_PER_BAR || 4);
const barMs = (60000 / bpm) * beatsPerBar;

const client = new Client(host, Number(port));
let bar = 0;

console.log(`Reloj de compás: ${bpm} BPM, ${beatsPerBar}/4 → ${host}:${port}`);
setInterval(() => {
  bar += 1;
  client.send(OSC.bar, bar);
  console.log(`/show/bar ${bar}`);
}, barMs);
