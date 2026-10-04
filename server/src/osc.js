import { Client, Server } from 'node-osc';
import { config } from './config.js';

const clients = config.oscTargets.map(({ host, port }) => new Client(host, port));

export function sendOsc(address, ...args) {
  for (const client of clients) {
    client.send(address, ...args);
  }
}

// Escucha OSC entrante (p. ej. /show/bar desde Max) y entrega cada mensaje
// como (address, args) al handler.
export function listenOsc(port, handler) {
  const server = new Server(port, '0.0.0.0', () => {
    console.log(`OSC entrante escuchando en udp :${port}`);
  });
  server.on('message', ([address, ...args]) => handler(address, args));
  return server;
}
