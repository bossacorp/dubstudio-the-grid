// Contrato de mensajes OSC entre el Grid Server y Mac mini / MacBook.
// Cualquier cambio aquí debe reflejarse también en los patches de Max/TouchDesigner.
export const COLUMNS = ['visual', 'fx', 'vote'];

export const OSC = {
  visual: (cell) => `/grid/visual/${cell}`,
  fx: (cell) => `/grid/fx/${cell}`,
  vote: (cell) => `/grid/vote/${cell}`,
  lock: (column) => `/grid/lock/${column}`,
  bar: '/show/bar',
};
