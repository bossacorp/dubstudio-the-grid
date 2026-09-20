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

export const config = {
  port: Number(process.env.PORT || 8080),
  operatorKey: process.env.OPERATOR_KEY || 'changeme',
  oscTargets: parseTargets(process.env.OSC_TARGETS),
};
