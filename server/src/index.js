import { config } from './config.js';
import { OSC } from './oscContract.js';
import { sendOsc, listenOsc } from './osc.js';
import { createGridServer } from './app.js';

const grid = createGridServer({ operatorKey: config.operatorKey, send: sendOsc });

listenOsc(config.oscInPort, (address, args) => {
  if (address === OSC.bar) grid.onBar(Number(args[0]));
});

if (config.operatorKey === 'changeme') {
  console.warn('AVISO: OPERATOR_KEY sigue en "changeme"; cámbiala en server/.env');
}

grid.server.listen(config.port, () => {
  console.log(`Grid Server escuchando en :${config.port} (operador en /operador)`);
});
