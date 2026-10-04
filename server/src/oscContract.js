// Contrato de mensajes OSC entre el Grid Server y Mac mini / MacBook.
// Cualquier cambio aquí debe reflejarse también en los patches de Max/TouchDesigner.
//
// Salida (servidor → Max):
//   /grid/visual/<celda> 1         toque verde, al instante (celda 1-3)
//   /grid/fx/<celda> 1             efecto amarillo, al inicio del compás
//   /grid/vote/<celda> 1           GANADOR de la ventana de voto (16 compases)
//   /grid/lock/<columna> 1|0       columna bloqueada / desbloqueada
// Entrada (Max → servidor):
//   /show/bar <compás>             Max marca el compás (entero, desde 1)
export const COLUMNS = ['visual', 'fx', 'vote'];
export const CELLS = [1, 2, 3];

export const OSC = {
  visual: (cell) => `/grid/visual/${cell}`,
  fx: (cell) => `/grid/fx/${cell}`,
  vote: (cell) => `/grid/vote/${cell}`,
  lock: (column) => `/grid/lock/${column}`,
  bar: '/show/bar',
};
