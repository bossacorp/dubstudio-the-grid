import { Client } from 'node-osc';
import { config } from './config.js';

const clients = config.oscTargets.map(({ host, port }) => new Client(host, port));

export function sendOsc(address, ...args) {
  for (const client of clients) {
    client.send(address, ...args);
  }
}
