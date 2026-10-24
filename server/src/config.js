import 'dotenv/config';

function parseTargets(raw) {
  if (!raw) return [];
  return raw
    .split(',')
    .map((entry) => entry.trim())
    .filter(Boolean)
    .map((entry) => {
      const [host, port] = entry.split(':');
      return { host, port: Number(port) };
    });
}

// Entero dentro de [min, max]; si no, el valor por defecto.
function intInRange(raw, min, max, fallback) {
  const n = Number(raw);
  return Number.isInteger(n) && n >= min && n <= max ? n : fallback;
}

export const config = {
  port: Number(process.env.PORT || 8080),
  operatorKey: process.env.OPERATOR_KEY || 'changeme',
  oscTargets: parseTargets(process.env.OSC_TARGETS),
  oscInPort: Number(process.env.OSC_IN_PORT || 9100),
  // URL que codifica el QR de /pantalla. Vacío = la URL con que OBS abre /pantalla.
  publicUrl: process.env.PUBLIC_URL || '',
  // Compases que la pantalla muestra al ganador del voto (el operador lo cambia en vivo).
  winnerBars: intInRange(process.env.WINNER_BARS, 1, 64, 16),
  // Estilo inicial de las celdas (clasico, psicodelico, atmosferico, naturaleza, elegante).
  theme: process.env.THEME || 'clasico',
};
