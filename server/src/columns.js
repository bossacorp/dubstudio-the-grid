// Lógica de las columnas, sin red: recibe toques y compases y devuelve los
// mensajes OSC que hay que mandar. Así se puede probar sola (ver test/).
//
// - Verde (visual): sale al instante.
// - Amarilla (fx): se acumula y sale en el siguiente compás; si se tocaron
//   varias celdas, gana la más tocada (empate: la primera tocada). La celda
//   que disparó queda en enfriamiento `fxCooldownBars` compases.
// - Roja (vote): ventanas fijas de `voteWindowBars` compases (1-16, 17-32…).
//   Un voto por celular, se puede cambiar. Al cerrar la ventana sale solo el
//   ganador (empate: al azar). Sin votos no sale nada.
import { OSC } from './oscContract.js';

export function createColumns({
  fxCooldownBars = 4,
  voteWindowBars = 16,
  random = Math.random,
} = {}) {
  let bar = 0;
  const fxPending = new Map(); // celda → toques en este compás
  const fxCoolingUntil = new Map(); // celda → compás en que vuelve a estar libre
  const votes = new Map(); // deviceId → celda
  let voteRound = 0; // sube cada vez que se vacían los votos (los celulares limpian "tu voto")

  function resetVotes() {
    votes.clear();
    voteRound += 1;
  }

  const windowOf = (n) => Math.floor((n - 1) / voteWindowBars);
  const isCooling = (cell) => bar < (fxCoolingUntil.get(cell) ?? 0);

  // Devuelve { send: [[address, arg]], log: [texto], changed: bool }.
  function touch(column, cell, deviceId) {
    if (column === 'visual') {
      return { send: [[OSC.visual(cell), 1]], log: [], changed: false };
    }
    if (column === 'fx') {
      if (isCooling(cell)) return { send: [], log: [], changed: false };
      const isNew = !fxPending.has(cell);
      fxPending.set(cell, (fxPending.get(cell) ?? 0) + 1);
      return { send: [], log: [], changed: isNew };
    }
    if (column === 'vote') {
      if (typeof deviceId !== 'string' || !deviceId) {
        return { send: [], log: [], changed: false };
      }
      votes.set(deviceId, cell);
      return { send: [], log: [], changed: false };
    }
    return { send: [], log: [], changed: false };
  }

  function onBar(n) {
    const send = [];
    const log = [];
    if (!Number.isInteger(n) || n < 1 || n === bar) return { send, log };

    if (n < bar) {
      // Max reinició el transport: empiezan de cero ventanas y enfriamientos.
      log.push(`compás ${n}: transport reiniciado (venía de ${bar})`);
      fxCoolingUntil.clear();
      resetVotes();
    } else if (bar > 0 && windowOf(n) > windowOf(bar)) {
      const winner = closeVote();
      if (winner) {
        send.push([OSC.vote(winner.cell), 1]);
        log.push(`compás ${n}: voto cerrado, ganó ${winner.cell} (${winner.count} de ${winner.total} votos)`);
      } else {
        log.push(`compás ${n}: voto cerrado sin votos`);
      }
    }
    bar = n;

    if (fxPending.size > 0) {
      let cell = null;
      let count = 0;
      for (const [c, k] of fxPending) {
        if (k > count) {
          cell = c;
          count = k;
        }
      }
      fxPending.clear();
      fxCoolingUntil.set(cell, n + fxCooldownBars);
      send.push([OSC.fx(cell), 1]);
      log.push(`compás ${n}: fx ${cell} disparado (${count} toques)`);
    }

    return { send, log };
  }

  function closeVote() {
    const total = votes.size;
    if (total === 0) {
      resetVotes();
      return null;
    }
    const counts = new Map();
    for (const cell of votes.values()) counts.set(cell, (counts.get(cell) ?? 0) + 1);
    resetVotes();
    const max = Math.max(...counts.values());
    const tied = [...counts].filter(([, k]) => k === max).map(([c]) => c);
    const cell = tied[Math.floor(random() * tied.length)];
    return { cell, count: max, total };
  }

  // Al bloquear una columna se descarta lo que estaba en curso.
  function clear(column) {
    if (column === 'fx') fxPending.clear();
    if (column === 'vote') resetVotes();
  }

  // Lo que ven los celulares.
  function view() {
    const cooling = {};
    for (const [cell, until] of fxCoolingUntil) {
      if (bar < until) cooling[cell] = until - bar;
    }
    return {
      bar,
      fx: { pending: [...fxPending.keys()], cooling },
      vote: {
        round: voteRound,
        barsLeft: bar > 0 ? voteWindowBars - ((bar - 1) % voteWindowBars) : null,
      },
    };
  }

  // Conteo de votos de la ventana en curso. Solo lo ve el operador.
  function tally() {
    const counts = { 1: 0, 2: 0, 3: 0 };
    for (const cell of votes.values()) counts[cell] = (counts[cell] ?? 0) + 1;
    return counts;
  }

  return { touch, onBar, clear, view, tally };
}
