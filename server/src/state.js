import { COLUMNS } from './oscContract.js';
import { createColumns } from './columns.js';

export const state = {
  locks: Object.fromEntries(COLUMNS.map((column) => [column, false])),
};

export const columns = createColumns();

// Lo que se manda a los celulares: locks + compás + estado de fx/voto.
export function publicState() {
  return { locks: state.locks, ...columns.view() };
}

export function broadcast(wss, payload) {
  const data = JSON.stringify(payload);
  for (const client of wss.clients) {
    if (client.readyState === client.OPEN) client.send(data);
  }
}
