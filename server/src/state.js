import { COLUMNS } from './oscContract.js';

export const state = {
  locks: Object.fromEntries(COLUMNS.map((column) => [column, false])),
};

export function broadcast(wss, payload) {
  const data = JSON.stringify(payload);
  for (const client of wss.clients) {
    if (client.readyState === client.OPEN) client.send(data);
  }
}
