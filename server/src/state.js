import { COLUMNS } from './oscContract.js';

export const state = {
  locks: Object.fromEntries(COLUMNS.map((column) => [column, false])),
  // Último compás recibido de Max por /show/bar (0 = aún no llega ninguno).
  bar: 0,
};

export function broadcast(wss, payload) {
  const data = JSON.stringify(payload);
  for (const client of wss.clients) {
    if (client.readyState === client.OPEN) client.send(data);
  }
}
