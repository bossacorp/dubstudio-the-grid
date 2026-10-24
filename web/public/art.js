// Arte de las celdas: SVG animado generado por código (sin imágenes externas,
// sin internet). Lo usan el celular, /pantalla y la vista previa del operador.
//
// Cada fila tiene un motivo que sugiere lo que hace en Max:
//   fila 1 → efectos A (fractal)   fila 2 → efectos B (eco/delay)
//   fila 3 → crossfade A↔B
// y cada columna conserva su color (verde, amarillo, rojo).
//
// Uso: GridArt.svg(tema, columna, celda) → string SVG ('' en "clasico").
(function () {
  // [principal, oscuro, claro]
  const COLORS = {
    visual: ['#1db954', '#06251a', '#9dffc4'],
    fx: ['#ffd200', '#2b2200', '#fff2a6'],
    vote: ['#e11d1d', '#2a0606', '#ffa497'],
  };

  const THEMES = ['clasico', 'psicodelico', 'atmosferico', 'naturaleza', 'elegante'];
  const LABELS = {
    clasico: 'Clásico',
    psicodelico: 'Psicodélico',
    atmosferico: 'Atmosférico',
    naturaleza: 'Naturaleza',
    elegante: 'Elegante',
  };

  const range = (n) => Array.from({ length: n }, (_, i) => i);
  const wrap = (body, defs = '') =>
    `<svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid slice" aria-hidden="true">` +
    `<defs>${defs}</defs>${body}</svg>`;

  // ---------------- Psicodélico: color pleno, giros y pulsos ----------------
  function psicodelico(col, cell, id) {
    const [c, dark, light] = COLORS[col];
    const defs = `<radialGradient id="bg-${id}"><stop offset="0" stop-color="${c}" stop-opacity=".55"/>` +
      `<stop offset="1" stop-color="${dark}"/></radialGradient>`;
    const bg = `<rect width="100" height="100" fill="url(#bg-${id})"/>`;
    if (cell === 1) {
      const petals = range(12).map((i) =>
        `<ellipse cx="50" cy="27" rx="7" ry="21" fill="${i % 2 ? light : c}" opacity=".8" transform="rotate(${i * 30} 50 50)"/>`).join('');
      const star = range(8).map((i) =>
        `<rect x="46" y="33" width="8" height="8" fill="${dark}" transform="rotate(${i * 45} 50 50)"/>`).join('');
      return wrap(`${bg}<g class="ga-spin" style="--d:16s">${petals}</g>` +
        `<g class="ga-spin-rev" style="--d:7s">${star}</g>` +
        `<circle cx="50" cy="50" r="7" fill="${light}" class="ga-pulse" style="--d:1.2s"/>`, defs);
    }
    if (cell === 2) {
      const rings = range(4).map((i) =>
        `<circle cx="50" cy="50" r="30" fill="none" stroke="${i % 2 ? light : c}" stroke-width="5" class="ga-ripple" style="--d:3s;animation-delay:-${i * 0.75}s"/>`).join('');
      return wrap(`${bg}${rings}<circle cx="50" cy="50" r="7" fill="${light}"/>`, defs);
    }
    const stripes = range(10).map((i) =>
      `<rect x="${i * 12 - 10}" y="-20" width="6" height="140" fill="${i % 2 ? c : light}" opacity=".45"/>`).join('');
    return wrap(`${bg}<g class="ga-spin" style="--d:28s">${stripes}</g>` +
      `<g class="ga-sway-x" style="--d:2.6s"><circle cx="38" cy="50" r="19" fill="${c}" opacity=".9" style="mix-blend-mode:screen"/></g>` +
      `<g class="ga-sway-x rev" style="--d:2.6s"><circle cx="62" cy="50" r="19" fill="${light}" opacity=".85" style="mix-blend-mode:screen"/></g>`, defs);
  }

  // ---------------- Atmosférico: nieblas, nebulosas, luz suave ----------------
  function atmosferico(col, cell, id) {
    const [c, dark, light] = COLORS[col];
    const defs = `<linearGradient id="bg-${id}" x1="0" y1="0" x2="0" y2="1">` +
      `<stop offset="0" stop-color="#05070c"/><stop offset="1" stop-color="${dark}"/></linearGradient>` +
      `<radialGradient id="blob-${id}"><stop offset="0" stop-color="${light}" stop-opacity=".85"/>` +
      `<stop offset=".45" stop-color="${c}" stop-opacity=".45"/><stop offset="1" stop-color="${c}" stop-opacity="0"/></radialGradient>` +
      `<linearGradient id="band-${id}" x1="0" y1="0" x2="1" y2="0"><stop offset="0" stop-color="${light}" stop-opacity="0"/>` +
      `<stop offset=".5" stop-color="${light}" stop-opacity=".5"/><stop offset="1" stop-color="${light}" stop-opacity="0"/></linearGradient>` +
      `<linearGradient id="aur-${id}" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="${light}" stop-opacity=".75"/>` +
      `<stop offset=".5" stop-color="${c}" stop-opacity=".35"/><stop offset="1" stop-color="${c}" stop-opacity="0"/></linearGradient>`;
    const bg = `<rect width="100" height="100" fill="url(#bg-${id})"/>`;
    const stars = [[15, 18], [82, 12], [70, 34], [24, 70], [88, 80], [50, 8]].map(([x, y], i) =>
      `<circle cx="${x}" cy="${y}" r="1.1" fill="#fff" class="ga-twinkle" style="--d:${1.6 + i * 0.4}s;animation-delay:-${i * 0.5}s"/>`).join('');
    if (cell === 1) {
      return wrap(`${bg}${stars}` +
        `<g class="ga-drift" style="--d:7s"><circle cx="42" cy="46" r="32" fill="url(#blob-${id})"/></g>` +
        `<g class="ga-drift rev" style="--d:9s"><circle cx="62" cy="60" r="24" fill="url(#blob-${id})"/></g>` +
        `<g class="ga-drift" style="--d:11s"><circle cx="30" cy="68" r="16" fill="url(#blob-${id})"/></g>`, defs);
    }
    if (cell === 2) {
      const bands = [[32, 7], [54, 10], [76, 13]].map(([y, d], i) =>
        `<g class="ga-sway-x ${i % 2 ? 'rev' : ''}" style="--d:${d}s"><ellipse cx="50" cy="${y}" rx="70" ry="${7 + i * 2}" fill="url(#band-${id})"/></g>`).join('');
      return wrap(`${bg}${stars}${bands}`, defs);
    }
    const wave = 'M -50 62 Q -37.5 46 -25 62 T 0 62 T 25 62 T 50 62 T 75 62 T 100 62 T 125 62 T 150 62 V 110 H -50 Z';
    return wrap(`${bg}${stars}` +
      `<circle cx="74" cy="24" r="9" fill="${light}" class="ga-pulse" style="--d:3s" opacity=".9"/>` +
      `<g class="ga-slide" style="--d:7s"><path d="${wave}" fill="url(#aur-${id})"/></g>` +
      `<g class="ga-slide" style="--d:11s" opacity=".6"><path d="${wave}" transform="translate(0 10)" fill="url(#aur-${id})"/></g>`, defs);
  }

  // ---------------- Naturaleza: hoja, agua, sol/luna ----------------
  function naturaleza(col, cell, id) {
    const [c, dark, light] = COLORS[col];
    const defs = `<linearGradient id="bg-${id}" x1="0" y1="0" x2="0" y2="1">` +
      `<stop offset="0" stop-color="${c}" stop-opacity=".35"/><stop offset="1" stop-color="${dark}"/></linearGradient>` +
      `<mask id="moon-${id}"><rect width="100" height="100" fill="#fff"/><circle cx="64" cy="44" r="15" fill="#000"/></mask>`;
    const bg = `<rect width="100" height="100" fill="${dark}"/><rect width="100" height="100" fill="url(#bg-${id})"/>`;
    if (cell === 1) {
      const leaf = (x, s, d, delay) =>
        `<g transform="translate(${x} 0)"><g class="ga-sway" style="--d:${d}s;animation-delay:-${delay}s">` +
        `<g transform="translate(50 88) scale(${s}) translate(-50 -88)">` +
        `<path d="M50 88 C 22 64, 24 26, 50 12 C 76 26, 78 64, 50 88 Z" fill="${c}"/>` +
        `<path d="M50 86 L50 18 M50 64 L36 50 M50 64 L64 50 M50 46 L39 34 M50 46 L61 34" stroke="${light}" stroke-width="1.6" fill="none" stroke-linecap="round"/>` +
        `</g></g></g>`;
      return wrap(`${bg}${leaf(-18, 0.55, 4.5, 1)}${leaf(18, 0.6, 5.2, 2)}${leaf(0, 0.85, 4, 0)}`, defs);
    }
    if (cell === 2) {
      const ripples = range(3).map((i) =>
        `<ellipse cx="50" cy="74" rx="30" ry="7" fill="none" stroke="${light}" stroke-width="1.6" class="ga-ripple" style="--d:3s;animation-delay:-${i}s"/>`).join('');
      return wrap(`${bg}<rect y="68" width="100" height="32" fill="${c}" opacity=".35"/>${ripples}` +
        `<g class="ga-fall" style="--d:3s"><path d="M50 30 C 46 38, 45 42, 50 46 C 55 42, 54 38, 50 30 Z" fill="${light}"/></g>`, defs);
    }
    const rays = range(12).map((i) =>
      `<rect x="48.5" y="16" width="3" height="10" rx="1.5" fill="${c}" transform="rotate(${i * 30} 50 50)"/>`).join('');
    return wrap(`${bg}` +
      `<g class="ga-fade" style="--d:5s"><g class="ga-spin" style="--d:24s">${rays}</g><circle cx="50" cy="50" r="16" fill="${c}"/></g>` +
      `<g class="ga-fade rev" style="--d:5s"><circle cx="54" cy="50" r="20" fill="${light}" mask="url(#moon-${id})"/></g>`, defs);
  }

  // ---------------- Elegante: líneas finas, geometría lenta ----------------
  function elegante(col, cell, id) {
    const [c, dark, light] = COLORS[col];
    const defs = `<radialGradient id="bg-${id}"><stop offset="0" stop-color="${dark}"/>` +
      `<stop offset="1" stop-color="#050505"/></radialGradient>`;
    const bg = `<rect width="100" height="100" fill="url(#bg-${id})"/>`;
    if (cell === 1) {
      const centers = [[50, 50]].concat(range(6).map((i) => {
        const a = (Math.PI / 3) * i;
        return [50 + 14 * Math.cos(a), 50 + 14 * Math.sin(a)];
      }));
      const circles = centers.map(([x, y]) =>
        `<circle cx="${x.toFixed(2)}" cy="${y.toFixed(2)}" r="14" fill="none" stroke="${c}" stroke-width=".9"/>`).join('');
      return wrap(`${bg}<g class="ga-spin" style="--d:40s">${circles}` +
        `<circle cx="50" cy="50" r="28" fill="none" stroke="${light}" stroke-width=".5" opacity=".7"/></g>`, defs);
    }
    if (cell === 2) {
      const diamonds = range(5).map((i) => {
        const s = 8 + i * 8;
        return `<g class="ga-blink" style="--d:2.5s;animation-delay:${i * 0.25}s">` +
          `<rect x="${50 - s}" y="${50 - s}" width="${s * 2}" height="${s * 2}" fill="none" stroke="${i % 2 ? light : c}" stroke-width=".8" transform="rotate(45 50 50)"/></g>`;
      }).join('');
      return wrap(`${bg}${diamonds}`, defs);
    }
    return wrap(`${bg}<line x1="10" y1="50" x2="90" y2="50" stroke="${light}" stroke-width=".4" opacity=".5"/>` +
      `<g class="ga-sway-x" style="--d:5s"><circle cx="40" cy="50" r="22" fill="none" stroke="${c}" stroke-width="1"/></g>` +
      `<g class="ga-sway-x rev" style="--d:5s"><circle cx="60" cy="50" r="22" fill="none" stroke="${light}" stroke-width="1"/></g>`, defs);
  }

  const RENDER = { psicodelico, atmosferico, naturaleza, elegante };

  function svg(theme, column, cell) {
    const fn = RENDER[theme];
    if (!fn || !COLORS[column]) return '';
    return fn(column, cell, `${column}${cell}`);
  }

  // Animaciones compartidas. Solo transform/opacity: baratas en celulares.
  const css = `
    .ga { position: absolute; inset: 0; overflow: hidden; border-radius: inherit; pointer-events: none; }
    .ga svg { width: 100%; height: 100%; display: block; }
    .ga [class*="ga-"] { transform-box: fill-box; transform-origin: center; }
    .ga .ga-spin { animation: ga-spin var(--d, 12s) linear infinite; }
    .ga .ga-spin-rev { animation: ga-spin var(--d, 12s) linear infinite reverse; }
    .ga .ga-pulse { animation: ga-pulse var(--d, 2s) ease-in-out infinite alternate; }
    .ga .ga-ripple { animation: ga-ripple var(--d, 3s) ease-out infinite; }
    .ga .ga-drift { animation: ga-drift var(--d, 8s) ease-in-out infinite alternate; }
    .ga .ga-drift.rev { animation-direction: alternate-reverse; }
    .ga .ga-sway-x { animation: ga-sway-x var(--d, 4s) ease-in-out infinite alternate; }
    .ga .ga-sway-x.rev { animation-direction: alternate-reverse; }
    .ga .ga-slide { animation: ga-slide var(--d, 6s) linear infinite; }
    .ga .ga-twinkle { animation: ga-twinkle var(--d, 2.4s) ease-in-out infinite alternate; }
    .ga .ga-sway { transform-box: view-box; transform-origin: 50px 88px; animation: ga-sway var(--d, 5s) ease-in-out infinite alternate; }
    .ga .ga-fall { animation: ga-fall var(--d, 3s) ease-in infinite; }
    .ga .ga-fade { animation: ga-fade var(--d, 8s) ease-in-out infinite alternate; }
    .ga .ga-fade.rev { animation-direction: alternate-reverse; }
    .ga .ga-blink { animation: ga-blink var(--d, 2.4s) ease-in-out infinite; }
    @keyframes ga-spin { to { transform: rotate(360deg); } }
    @keyframes ga-pulse { from { transform: scale(.85); } to { transform: scale(1.15); } }
    @keyframes ga-ripple { from { transform: scale(.15); opacity: 1; } to { transform: scale(1.6); opacity: 0; } }
    @keyframes ga-drift { from { transform: translate(-6px, 4px); } to { transform: translate(6px, -4px); } }
    @keyframes ga-sway-x { from { transform: translateX(-8px); } to { transform: translateX(8px); } }
    @keyframes ga-slide { from { transform: translateX(0); } to { transform: translateX(-50px); } }
    @keyframes ga-twinkle { from { opacity: .15; } to { opacity: 1; } }
    @keyframes ga-sway { from { transform: rotate(-7deg); } to { transform: rotate(7deg); } }
    @keyframes ga-fall {
      0% { transform: translateY(-30px); opacity: 0; }
      20% { opacity: 1; }
      80% { transform: translateY(26px); opacity: 1; }
      100% { transform: translateY(30px); opacity: 0; }
    }
    @keyframes ga-fade { from { opacity: 1; } to { opacity: 0; } }
    @keyframes ga-blink { 0%, 100% { opacity: .15; } 50% { opacity: 1; } }
    @media (prefers-reduced-motion: reduce) { .ga * { animation: none !important; } }
  `;
  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  window.GridArt = { THEMES, LABELS, svg };
})();
