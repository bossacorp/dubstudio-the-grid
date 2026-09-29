// Monitor OSC de prueba: escucha en un puerto UDP e imprime cada mensaje.
// Sirve para confirmar que los toques llegan a la Mac mini / MacBook
// antes de conectar Max, Vizzie o TouchDesigner.
import { Server } from 'node-osc';

const port = Number(process.env.OSC_MONITOR_PORT || 9000);
const server = new Server(port, '0.0.0.0', () => {
  console.log(`Monitor OSC escuchando en udp :${port}`);
});

server.on('message', ([address, ...args], rinfo) => {
  const time = new Date().toISOString().slice(11, 23);
  const from = rinfo ? `${rinfo.address}:${rinfo.port}` : '?';
  console.log(`${time}  ${from}  ${address}  ${JSON.stringify(args)}`);
});
