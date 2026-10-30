#!/usr/bin/env python3
"""Integra un patch de color (Vizzie) con The Grid y Ableton.

Uso:
  python3 max/tools/agregar_bloques.py ENTRADA.maxpat SALIDA.maxpat COLOR
  COLOR: verde | amarillo | rojo

Qué hace (se puede volver a correr sobre una versión nueva del patch):
  1. Quita lo que ya no se usa: los módulos listados en `quitar` y los
     controles (dial, número, toggle) que no llegan a ningún lado, y los
     módulos cuyo video ya no llega a la salida (ramas muertas).
  2. Arma la cadena de video: mixfadr → módulos de templates → projectr.
  3. Agrega a la derecha (vista de cables) los bloques THE GRID, ABLETON y
     TEMPLATES, con cada template conectado a su módulo.
  4. Mete un LFO suave (bpatcher grid.lfo) que SUMA un vaivén al crossfade
     principal: número del crossfade + LFO → (rebota en 1) → mixfadr entrada 3.
     La perilla, los templates y las escenas siguen moviendo la base.
  5. Acomoda la vista de presentación: solo módulos y controles que se
     manipulan, con etiquetas; el resto queda fuera.

Templates:
  - "entra y sale" ([grid.hold N] o [grid.strobe ...]) → entrada on/off del
    módulo (su ÚLTIMA entrada, la misma convención que ya usan los toggles del
    patch). El módulo está apagado en reposo; su intensidad se ajusta en su
    panel.
  - "golpe y regreso" ([grid.env ...]) → solo a entradas confirmadas: el
    crossfade del mixfadr (el número 0..1 que entra a su entrada 2) y el tono
    de HUSALIR (entrada 1).
Las abstracciones grid.env / grid.hold / grid.strobe / grid.lfo deben estar en la misma
carpeta que el patch (max/tools/generar_abstracciones.py).
"""
import json
import sys

TAG = 'thegrid_'

# Destinos: ('mod', nombre, 'ultima' | n) · ('xfade',) · ('var', varname)
COLORS = {
    'verde': {
        'col': 'visual',
        'quitar': ['vz.zoomr.maxpat', 'vz.randomizr.maxpat'],
        'post': ['vz.kaleidr.maxpat', 'vz.husalir.maxpat', 'vz.trans4mr.maxpat', 'vz.colorizr.maxpat'],
        'mix_b_desde_video': False,
        'lfo': (8, 0.15),   # (compases por ciclo, profundidad)
        'templates': [
            ('grid.visual.1', 'grid.hold 1', ('mod', 'vz.kaleidr.maxpat', 'ultima'),
             'celda 1 · Caleidoscopio: KALEIDR entra 1 compás'),
            ('grid.visual.2', 'grid.env 1. 0. 2', ('mod', 'vz.husalir.maxpat', 1),
             'celda 2 · Giro de color: el tono (HUSALIR) da la vuelta y regresa en 2 compases'),
            ('grid.visual.3', 'grid.hold 1', ('mod', 'vz.trans4mr.maxpat', 'ultima'),
             'celda 3 · Espejo + zoom: TRANS4MR entra 1 compás'),
            ('live.flash', 'grid.hold 0.25', ('mod', 'vz.colorizr.maxpat', 'ultima'),
             'tarola · Flash: COLORIZR entra ¼ de compás'),
        ],
        'al_abrir': [],
        # A = bob → FRACTALIZR → FOGGR · B = video con coristas, directo.
        'escenas': ([('var', 'toggle[4]'), ('xfade',)],
                    [('1 0.', 'escena 1: A (bob con fractal + niebla)'),
                     ('0 1.', 'escena 2: B (coristas)'),
                     ('1 0.5', 'escena 3: A + B mezclados'),
                     ('0 0.', 'escena 4: bob limpio')]),
        'etiquetas': {'toggle[4]': 'fractal + niebla on/off',
                      'toggle[3]': 'mezcla on/off', 'dial[1]': 'crossfade A↔B'},
    },
    'amarillo': {
        'col': 'fx',
        'quitar': ['vz.randomizr.maxpat'],
        'post': [],
        'mix_b_desde_video': False,
        'lfo': (4, 0.1),
        'templates': [
            ('grid.fx.1', 'grid.env 1. 0. 2', ('xfade',),
             'celda 1 · Eco dub: crossfade a B (pasa por DELAYR) y regresa en 2 compases'),
            ('grid.fx.2', 'grid.hold 2', ('var', 'toggle[4]'),
             'celda 2 · Reverb de imagen: FOGGR entra 2 compases'),
            ('grid.fx.3', 'grid.strobe 8 1', ('xfade',),
             'celda 3 · Sirena: crossfade A/B en corcheas durante 1 compás'),
            ('live.flash', 'grid.env 1. 0. 0.25', ('xfade',),
             'tarola · Flash: pulso del crossfade a B, ¼ de compás'),
        ],
        # DELAYR siempre prendido para que el eco se acumule.
        'al_abrir': [(('var', 'toggle[5]'), '1')],
        'escenas': ([('var', 'toggle[4]'), ('var', 'toggle[5]'), ('xfade',)],
                    [('1 1 0.', 'escena 1: niebla (A)'),
                     ('0 1 1.', 'escena 2: eco (B)'),
                     ('1 1 0.5', 'escena 3: niebla + eco'),
                     ('0 1 0.', 'escena 4: limpio')]),
        'etiquetas': {'toggle[4]': 'niebla (FOGGR) on/off', 'toggle[5]': 'eco (DELAYR) on/off',
                      'toggle[3]': 'mezcla on/off', 'dial[1]': 'crossfade A↔B'},
    },
    'rojo': {
        'col': 'vote',
        'quitar': ['vz.randomizr.maxpat'],
        # El artista armó la cadena B: videos nuevos → PIXL8R → KALEIDR → mixfadr B.
        'post': [],
        'mix_b_desde_video': False,
        'lfo': (16, 0.2),
        # Base: crossfade en 0.5 (se ven el video original y los nuevos).
        'templates': [
            ('grid.vote.1', 'grid.env 0. 0.5 16', ('xfade',),
             'ganó 1 · Raíces: salta a A (fractal + niebla) y vuelve a la mezcla en 16 compases'),
            ('grid.vote.2', 'grid.strobe 1 16', ('mod', 'vz.pixl8r.maxpat', 'ultima'),
             'ganó 2 · Steppers: PIXL8R (en B) corta cada compás durante 16 compases'),
            ('grid.vote.3', 'grid.hold 16', ('mod', 'vz.kaleidr.maxpat', 'ultima'),
             'ganó 3 · Cósmico: KALEIDR (en B) 16 compases…'),
            ('grid.vote.3', 'grid.env 1. 0.5 16', ('xfade',),
             '…con el crossfade en B, que regresa a la mezcla en 16 compases'),
            ('live.flash', 'grid.env 0. 0.5 0.25', ('xfade',),
             'tarola · Flash: pulso del crossfade a A, ¼ de compás'),
        ],
        # FRACTALIZR + FOGGR prendidos para que A tenga look.
        'al_abrir': [(('var', 'toggle[4]'), '1')],
        'escenas': ([('var', 'toggle[4]'), ('xfade',)],
                    [('1 0.', 'escena 1: original con fractal + niebla (A)'),
                     ('1 1.', 'escena 2: videos nuevos (B)'),
                     ('1 0.5', 'escena 3: mezcla A + B'),
                     ('0 0.5', 'escena 4: mezcla, fractal apagado')]),
        'etiquetas': {'toggle[4]': 'fractal + niebla on/off', 'toggle[3]': 'mezcla on/off',
                      'dial[1]': 'crossfade A↔B'},
    },
}

LABEL = {'vz.kaleidr.maxpat': 'KALEIDR', 'vz.husalir.maxpat': 'HUSALIR', 'vz.trans4mr.maxpat': 'TRANS4MR',
         'vz.colorizr.maxpat': 'COLORIZR', 'vz.pixl8r.maxpat': 'PIXL8R'}


def main():
    if len(sys.argv) != 4 or sys.argv[3] not in COLORS:
        sys.exit(__doc__)
    src, dst, color = sys.argv[1:]
    cfg = COLORS[color]
    col = cfg['col']
    up = color.upper()
    doc = json.load(open(src, encoding='utf-8'))
    p = doc['patcher']

    # ---------------- 0. quitar bloques generados antes ----------------
    def generated(b):
        if str(b.get('varname', '')).startswith(TAG):
            return True
        num = b['id'].split('-')[-1]
        return num.isdigit() and 2001 <= int(num) <= 3999

    def drop(ids):
        p['boxes'] = [x for x in p['boxes'] if x['box']['id'] not in ids]
        p['lines'] = [l for l in p['lines']
                      if l['patchline']['source'][0] not in ids and l['patchline']['destination'][0] not in ids]
        params = p.get('parameters', {})
        for k in [k for k in params if k.split('::')[0] in ids]:
            del params[k]

    # El LFO se mete entre el número del crossfade y el mixfadr: antes de
    # quitarlo, recuerda qué número era para devolverle su cable.
    gen_ids = {x['box']['id'] for x in p['boxes'] if generated(x['box'])}
    xfade_prev = [l['patchline']['source'][0] for l in p['lines']
                  if l['patchline']['destination'][0] in gen_ids and l['patchline']['source'][0] not in gen_ids
                  and any(x['box']['id'] == l['patchline']['destination'][0]
                          and x['box'].get('varname') == TAG + 'xfade_in' for x in p['boxes'])]
    drop(gen_ids)

    def boxes():
        return {x['box']['id']: x['box'] for x in p['boxes']}

    def by_name(name):
        found = [b for b in boxes().values() if b.get('name') == name]
        return found[0] if found else None

    def outs(bid):
        return [l['patchline'] for l in p['lines'] if l['patchline']['source'][0] == bid]

    def ins(bid, inlet=None):
        return [l['patchline'] for l in p['lines'] if l['patchline']['destination'][0] == bid
                and (inlet is None or l['patchline']['destination'][1] == inlet)]

    def link(a, ao, b, bi):
        p['lines'].append({'patchline': {'source': [a, ao], 'destination': [b, bi]}})

    # ---------------- 1. quitar lo que no se usa ----------------
    sobrantes = {b['id']: b['name'] for b in boxes().values() if b.get('name') in cfg['quitar']}
    drop(set(sobrantes))

    proj = by_name('vz.projectr.maxpat')
    mixers = [b for b in boxes().values() if b.get('name') == 'vz.mixfadr.maxpat']
    if not mixers or not proj:
        sys.exit('No encontré vz.mixfadr o vz.projectr en el patch')

    def reaches_output(bid):
        """¿La salida de video de este módulo llega al projectr sin pasar por otro mixfadr?"""
        cur, seen = bid, set()
        while cur not in seen:
            seen.add(cur)
            nxt = [l['destination'][0] for l in outs(cur) if l['source'][1] == 0
                   and boxes()[l['destination'][0]]['maxclass'] == 'bpatcher']
            if proj['id'] in nxt:
                return True
            if not nxt or any(boxes()[n].get('name') == 'vz.mixfadr.maxpat' for n in nxt):
                return False
            cur = nxt[0]
        return False

    principal = [m for m in mixers if reaches_output(m['id'])]
    mix = principal[0] if principal else mixers[0]

    def mix_inlet(bid):
        """Entrada del mixfadr principal a la que llega el video de este objeto (9 = ninguna)."""
        cur, seen = bid, set()
        while cur not in seen:
            seen.add(cur)
            nxt = [l['destination'] for l in outs(cur) if l['source'][1] == 0]
            if any(d[0] == mix['id'] for d in nxt):
                return min(d[1] for d in nxt if d[0] == mix['id'])
            nxt = [d for d in nxt if boxes()[d[0]]['maxclass'] == 'bpatcher']
            if not nxt:
                return 9
            cur = nxt[0][0]
        return 9

    playlists = sorted((b for b in boxes().values() if b['maxclass'] == 'jit.playlist'),
                       key=lambda b: (mix_inlet(b['id']), b['patching_rect'][0]))
    playlist = playlists[0]   # el video original (entra por A)
    plays = []
    for pl in playlists:
        for l in ins(pl['id'], 0):
            if boxes()[l['source'][0]]['maxclass'] == 'toggle' and l['source'][0] not in plays:
                plays.append(l['source'][0])
    xfade = next((l['source'][0] for l in ins(mix['id'], 2)
                  if boxes()[l['source'][0]]['maxclass'] == 'flonum'), None)
    if not xfade and xfade_prev and xfade_prev[0] in boxes():
        xfade = xfade_prev[0]
        link(xfade, 0, mix['id'], 2)
    if not xfade or not plays:
        sys.exit('No encontré el número del crossfade o el toggle de play')
    play = plays[0]

    # Clips: solo el nombre del archivo (los videos van junto al patch) y volumen en 0.
    for pl in playlists:
        for clip in pl.get('data', {}).get('clips', []):
            if clip.get('filename'):
                clip['absolutepath'] = clip['filename']
            clip.setdefault('content_state', {})['vol'] = 0
    p['dependency_cache'] = [d for d in p.get('dependency_cache', [])
                             if not d.get('name', '').lower().endswith(('.mov', '.mp4'))]
    by_var = {b.get('varname'): b['id'] for b in boxes().values() if b.get('varname')}

    def target(t):
        """(id, entrada) de un destino de la config."""
        if t[0] == 'xfade':
            return xfade, 0
        if t[0] == 'var':
            if t[1] not in by_var:
                sys.exit(f'No encontré {t[1]} en el patch')
            return by_var[t[1]], 0
        m = by_name(t[1])
        if not m:
            sys.exit(f'No encontré {t[1]} en el patch')
        return m['id'], (m['numinlets'] - 1 if t[2] == 'ultima' else t[2])

    used = {target(t[2])[0] for t in cfg['templates']}
    used |= {target(t)[0] for t in cfg['escenas'][0]}
    used |= {target(t)[0] for t, _ in cfg['al_abrir']}
    used |= {xfade} | set(plays)

    # Controles que no llegan a ningún lado (dial → número → nada, toggles sueltos).
    while True:
        dead = {b['id'] for b in boxes().values()
                if b['maxclass'] in ('dial', 'flonum', 'toggle') and b['id'] not in used and not outs(b['id'])}
        if not dead:
            break
        drop(dead)

    # ---------------- 2. cadena de video ----------------
    chain = [by_name(n) for n in cfg['post']]
    if any(m is None for m in chain):
        sys.exit('Falta algún módulo de templates: ' + ', '.join(cfg['post']))
    if chain:
        # la salida de video va a ser el final de la cadena
        p['lines'] = [l for l in p['lines']
                      if not (l['patchline']['destination'][0] == proj['id'] and l['patchline']['destination'][1] == 0)]
        prev = mix['id']
        for m in chain:
            p['lines'] = [l for l in p['lines']
                          if not (l['patchline']['destination'][0] == m['id'] and l['patchline']['destination'][1] == 0)]
            link(prev, 0, m['id'], 0)
            prev = m['id']
        link(prev, 0, proj['id'], 0)
    if cfg['mix_b_desde_video'] and not ins(mix['id'], 1):
        link(playlist['id'], 0, mix['id'], 1)

    # Ramas muertas: módulos cuyo video ya no llega a la salida.
    def feeds_output(bid):
        stack, seen = [bid], set()
        while stack:
            cur = stack.pop()
            if cur == proj['id']:
                return True
            if cur in seen:
                continue
            seen.add(cur)
            stack += [l['destination'][0] for l in outs(cur) if l['source'][1] == 0
                      and boxes()[l['destination'][0]]['maxclass'] == 'bpatcher']
        return False

    keep = {mix['id'], proj['id']} | {m['id'] for m in chain} | used
    muertos = {b['id']: b['name'] for b in boxes().values()
               if b['maxclass'] == 'bpatcher' and b['id'] not in keep and not feeds_output(b['id'])}
    drop(set(muertos))
    while True:
        dead = {b['id'] for b in boxes().values()
                if b['maxclass'] in ('dial', 'flonum', 'toggle') and b['id'] not in used and not outs(b['id'])}
        if not dead:
            break
        drop(dead)
    quitados = sorted({n.replace('.maxpat', '') for n in list(sobrantes.values()) + list(muertos.values())})

    # ---------------- 3. bloques (vista de cables) ----------------
    B = boxes()
    X = max(b['patching_rect'][0] + b['patching_rect'][2] for b in B.values()) + 80
    counter = [3000]

    def new(cls, x, y, w, text=None, ni=1, no=1, outlettype=None, h=22, **kw):
        counter[0] += 1
        bid = f'obj-{counter[0]}'
        b = {'id': bid, 'maxclass': cls, 'numinlets': ni, 'numoutlets': no,
             'patching_rect': [X + x, y, w, h], 'varname': f'{TAG}{kw.pop("tag", counter[0])}'}
        if text is not None:
            b['text'] = text
        if outlettype is not None:
            b['outlettype'] = outlettype
        b.update(kw)
        p['boxes'].append({'box': b})
        return bid

    def comment(x, y, w, text, **kw):
        return new('comment', x, y, w, text, ni=1, no=0, h=20, **kw)

    def recv(x, y, name, w=110):
        return new('newobj', x, y, w, f'r {name}', no=1, outlettype=[''])

    pr = new('newobj', 420, 40, 140, f'print GRID-{up}', ni=1, no=0)

    def printed(src, label, x, y):
        pp = new('newobj', x, y, 120, f'prepend {label}', no=1, outlettype=[''])
        link(src, 0, pp, 0)
        link(pp, 0, pr, 0)

    # THE GRID: bloqueo y arranque.
    Y = 40
    comment(0, Y, 400, f'THE GRID · {up} — abre también grid-router.maxpat')
    rl = recv(0, Y + 30, f'grid.lock.{col}', 130)
    eq = new('newobj', 0, Y + 60, 40, '== 0', ni=2, no=1, outlettype=['int'])
    link(rl, 0, eq, 0)
    for pid in plays:
        link(eq, 0, pid, 0)
    printed(rl, 'bloqueo', 140, Y + 30)
    comment(270, Y + 30, 300, 'bloqueo 1 → pausa los videos · 0 → los reanuda')
    lb = new('newobj', 0, Y + 100, 60, 'loadbang', no=1, outlettype=['bang'])
    dl = new('newobj', 0, Y + 130, 80, 'delay 1000', ni=2, no=1, outlettype=['bang'])
    t = new('newobj', 0, Y + 160, 60, 't b b', no=2, outlettype=['bang', 'bang'])
    m1 = new('message', 0, Y + 190, 30, '1', ni=2, no=1, outlettype=[''])
    link(lb, 0, dl, 0)
    link(dl, 0, t, 0)
    link(t, 0, m1, 0)
    for pid in plays:
        link(m1, 0, pid, 0)
    comment(90, Y + 130, 400, 'al abrir: play de todos los videos (1 s después)')
    for i, (tg, val) in enumerate(cfg['al_abrir']):
        mb = new('message', 60 + i * 50, Y + 190, 30, val, ni=2, no=1, outlettype=[''])
        link(t, 1, mb, 0)
        tid, tin = target(tg)
        link(mb, 0, tid, tin)
        comment(60 + i * 50, Y + 215, 300, f'y {boxes()[tid].get("varname", "")} = {val}')

    # TEMPLATES: cada disparo → su abstracción → su módulo.
    Y = 300
    comment(0, Y, 640, f'TEMPLATES · {up} — "entra y sale" (grid.hold / grid.strobe → on/off del módulo) '
                       'y "golpe y regreso" (grid.env → crossfade / tono)')
    comment(0, Y + 18, 640, 'Ajusta compases o pico editando el texto del objeto. La intensidad de cada efecto '
                            'se define en el panel de su módulo (en reposo está apagado).')
    receivers = {}
    for i, (rname, tmpl, tg, label) in enumerate(cfg['templates']):
        y = Y + 50 + i * 55
        if rname not in receivers:
            receivers[rname] = recv(0, y, rname)
            printed(receivers[rname], rname.split('.')[0] == 'live' and 'destello' or f'celda{rname[-1]}', 470, y)
        e = new('newobj', 120, y + 26, 130, tmpl, ni=1, no=1, outlettype=[''])
        link(receivers[rname], 0, e, 0)
        tid, tin = target(tg)
        link(e, 0, tid, tin)
        dest = boxes()[tid]
        where = (LABEL.get(dest.get('name'), dest.get('name', '')) or dest.get('varname') or 'crossfade')
        if tg[0] == 'xfade':
            where = 'crossfade (número → mixfadr entrada 3)'
        elif tg[0] == 'mod':
            where = f'{where} entrada {tin + 1}' + (' = on/off' if tg[2] == 'ultima' else (' = tono' if tin == 1 else ''))
        elif tg[0] == 'var':
            where = f'{tg[1]}'
        comment(260, y + 26, 560, f'{label}  →  {where}')

    # ABLETON: perillas y escenas.
    Y = Y + 70 + len(cfg['templates']) * 55
    comment(0, Y, 640, f'ABLETON · {up} — abre también ableton-bridge.maxpat (el flash de tarola está en TEMPLATES)')
    rk1 = recv(0, Y + 30, 'live.knob.1', 100)
    link(rk1, 0, xfade, 0)
    comment(110, Y + 30, 400, 'perilla 1 (0..1) → crossfade A↔B')
    # LFO: número del crossfade (base) + vaivén suave → mixfadr entrada 3.
    # Si la suma pasa de 1 rebota hacia abajo, así nunca se queda pegado.
    bars, depth = cfg['lfo']
    p['lines'] = [l for l in p['lines']
                  if not (l['patchline']['source'][0] == xfade and l['patchline']['destination'] == [mix['id'], 2])]
    lfo = new('bpatcher', 330, Y + 30, 210, None, ni=3, no=1, outlettype=[''], h=54,
              name='grid.lfo.maxpat', args=[bars, depth], embed=0, offset=[0.0, 0.0],
              bgmode=0, border=0, clickthrough=0, enablehscroll=0, enablevscroll=0, lockeddragscroll=0,
              lockedsize=0, viewvisibility=1)
    pk = new('newobj', 330, Y + 100, 70, 'pak 0. 0.', ni=2, no=1, outlettype=[''], tag='xfade_in')
    sm = new('newobj', 330, Y + 128, 200, 'expr 1. - abs(1. - ($f1 + $f2))', ni=2, no=1, outlettype=[''])
    cl = new('newobj', 330, Y + 156, 70, 'clip 0. 1.', ni=3, no=1, outlettype=[''])
    link(xfade, 0, pk, 0)
    link(lfo, 0, pk, 1)
    link(pk, 0, sm, 0)
    link(sm, 0, cl, 0)
    link(cl, 0, mix['id'], 2)
    comment(410, Y + 100, 330, 'crossfade = base + LFO (rebota en 1) → mixfadr')
    rk2 = recv(0, Y + 62, 'live.knob.2', 100)
    k2 = new('newobj', 110, Y + 62, 50, '* 0.5', ni=2, no=1, outlettype=['float'])
    link(rk2, 0, k2, 0)
    link(k2, 0, lfo, 2)
    comment(0, Y + 88, 320, f'perilla 2 → profundidad del LFO (0..0.5) · '
                            f'inicial: {bars} compases, {depth}')
    for i, k in enumerate((3, 4)):
        rk = recv(i * 120, Y + 120, f'live.knob.{k}', 100)
        fk = new('flonum', i * 120, Y + 148, 60, ni=1, no=2, outlettype=['', 'bang'], parameter_enable=0)
        link(rk, 0, fk, 0)
    comment(0, Y + 174, 640, 'perillas 3-4 (0..1): conecta cada número al parámetro de Vizzie que quieras '
                             '(pasa el mouse por la entrada para ver su nombre)')
    Y += 60
    targets, setups = cfg['escenas']
    rs = recv(0, Y + 150, 'live.scene', 90)
    ss = new('newobj', 0, Y + 180, 90, 'sel 1 2 3 4', ni=5, no=5, outlettype=['bang'] * 5)
    fmt = ' '.join('0.' if t[0] == 'xfade' else '0' for t in targets)
    up_ = new('newobj', 0, Y + 240, 110, f'unpack {fmt}', ni=1, no=len(targets),
              outlettype=['float' if t[0] == 'xfade' else 'int' for t in targets])
    link(rs, 0, ss, 0)
    printed(rs, 'escena', 470, Y + 150)
    for i, (msg, label) in enumerate(setups):
        mb = new('message', i * 70, Y + 210, 60, msg, ni=2, no=1, outlettype=[''])
        link(ss, i, mb, 0)
        link(mb, 0, up_, 0)
        comment(300, Y + 180 + i * 18, 340, label)
    for i, tg in enumerate(targets):
        tid, tin = target(tg)
        link(up_, i, tid, tin)

    # ---------------- 4. vista de presentación ----------------
    B = boxes()
    for b in B.values():  # solo entra a la presentación lo que se acomoda abajo
        b.pop('presentation', None)
        b.pop('presentation_rect', None)
    post_ids = [m['id'] for m in chain]
    base_mods = [b for b in B.values() if b['maxclass'] == 'bpatcher' and b['id'] not in post_ids
                 and b['id'] not in (mix['id'], proj['id']) and not generated(b)]
    # orden de cadena: primero lo que llega a la entrada A del mixfadr, luego B;
    # dentro de cada cadena, en el orden en que pasa el video
    def chain_key(b):
        depth, cur, seen = 0, b['id'], set()
        while cur not in seen:
            seen.add(cur)
            nxt = [l['destination'] for l in outs(cur) if l['source'][1] == 0
                   and boxes()[l['destination'][0]]['maxclass'] == 'bpatcher']
            if not nxt:
                return (9, depth)
            if any(d[0] == mix['id'] for d in nxt):
                return (min(d[1] for d in nxt if d[0] == mix['id']), -depth)
            cur = nxt[0][0]
            depth += 1
        return (9, depth)
    base_mods.sort(key=chain_key)
    toggles = [B[by_var[v]] for v in ('toggle[4]', 'toggle[5]', 'toggle[3]') if v in by_var and by_var[v] in B]
    toggles = [t for t in toggles if t['id'] not in plays]
    dial = B.get(by_var.get('dial[1]'))
    template_label = {}
    for rname, _, tg, label in cfg['templates']:
        if tg[0] == 'mod':
            template_label.setdefault(tg[1], label.split(':')[0])

    def show(bid, x, y):
        b = boxes()[bid]
        w, h = b['patching_rect'][2], b['patching_rect'][3]
        b['presentation'] = 1
        b['presentation_rect'] = [x, y, w, h]
        return w, h

    def label(x, y, w, text, bold=False):
        kw = {'presentation': 1, 'presentation_rect': [x, y, w, 20]}
        if bold:
            kw['fontface'] = 1
        return new('comment', 0, 1500 + counter[0] % 50 * 20, w, text, ni=1, no=0, h=20, **kw)

    y = 10
    label(10, y, 500, f'{up} · bob rebel music — The Grid ({col})', bold=True)
    y += 28
    label(10, y, 400, 'VIDEOS (play)', bold=True)
    y += 22
    for pl in playlists:
        tg = next((l['source'][0] for l in ins(pl['id'], 0) if l['source'][0] in plays), None)
        if tg and not boxes()[tg].get('presentation'):
            show(tg, 10, y + 2)
        w, h = show(pl['id'], 50, y)
        label(60 + w, y + 4, 260, 'video original (A)' if pl['id'] == playlist['id'] else 'video nuevo (B)')
        y += max(h, 28) + 6
    y += 14

    label(10, y, 500, 'BASE — cadena A y cadena B (entran al MIXFADR principal)', bold=True)
    y += 22
    tags = {b['id']: template_label.get(b.get('name'), '') for b in base_mods}
    if any(tags.values()):
        y += 20   # fila de etiquetas arriba de los módulos
    x = 10
    row_h = 0
    for b in base_mods:
        if tags[b['id']]:
            label(x, y - 20, b['patching_rect'][2], tags[b['id']])
        w, h = show(b['id'], x, y)
        x += w + 12
        row_h = max(row_h, h)
    x = max(x, 10)
    for i, tg in enumerate(toggles):
        show(tg['id'], x, y + i * 36)
        label(x + 30, y + i * 36 + 2, 170, cfg['etiquetas'].get(tg.get('varname'), tg.get('varname', '')))
    y += max(row_h, len(toggles) * 36) + 20

    label(10, y, 400, 'MEZCLA PRINCIPAL', bold=True)
    y += 22
    w, h = show(mix['id'], 10, y)
    if dial:
        show(dial['id'], 10 + w + 12, y + 10)
        label(10 + w + 60, y + 18, 140, cfg['etiquetas'].get('dial[1]', ''))
    label(10 + w + 12, y + 66, 260, 'vaivén del crossfade (perilla 2 = prof.)')
    show(lfo, 10 + w + 12, y + 86)
    y += max(h, 140) + 20

    if chain:
        label(10, y, 700, 'TEMPLATES (apagados en reposo; los prende The Grid o Ableton)', bold=True)
        y += 22
        x = 10
        row_h = 0
        for m in chain:
            label(x, y, m['patching_rect'][2], template_label.get(m['name'], LABEL.get(m['name'], '')))
            w, h = show(m['id'], x, y + 20)
            x += w + 12
            row_h = max(row_h, h + 20)
        y += row_h + 20

    label(10, y, 400, 'SALIDA', bold=True)
    show(proj['id'], 10, y + 22)

    p['openinpresentation'] = 1
    json.dump(doc, open(dst, 'w', encoding='utf-8'), indent='\t', ensure_ascii=False)
    print(f'{dst}: {len(p["boxes"])} cajas, {len(p["lines"])} conexiones · quitados: {", ".join(quitados) or "–"}')


if __name__ == '__main__':
    main()
