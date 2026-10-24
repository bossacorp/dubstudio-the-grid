#!/usr/bin/env python3
"""Agrega a un patch de color (Vizzie) los bloques "THE GRID" y "ABLETON".

No toca nada de lo existente: solo agrega objetos y cables a la derecha.
Si el patch ya tenía bloques de una corrida anterior, los quita primero, así
se puede volver a correr sobre una versión nueva del patch.

Uso:
  python3 max/tools/agregar_bloques.py ENTRADA.maxpat SALIDA.maxpat COLOR

COLOR: verde | amarillo | rojo

Supone los controles que tienen los patches de bobGrid:
  toggle[4]  efectos A (fractalizr → foggr) on/off
  toggle[5]  efectos B (interpol8r → delayr) on/off
  flonum 0..1 que entra al crossfade del mixfadr (inlet 2)
  toggle que entra al jit.playlist (play)
"""
import json
import sys

COLORS = {
    'verde': 'visual',
    'amarillo': 'fx',
    'rojo': 'vote',
}
TAG = 'thegrid_'  # varname de todo lo que agrega este script


def find_controls(boxes, lines):
    """Ubica los controles por su función, no por id."""
    by_id = {b['id']: b for b in boxes}
    by_var = {b.get('varname'): b for b in boxes if b.get('varname')}
    out = {}
    for name, var in (('chain_a', 'toggle[4]'), ('chain_b', 'toggle[5]')):
        if var not in by_var:
            sys.exit(f'No encontré {var} ({name}) en el patch')
        out[name] = by_var[var]['id']

    def dest(src_id):
        return [(l['patchline']['destination'][0], l['patchline']['destination'][1])
                for l in lines if l['patchline']['source'][0] == src_id]

    for b in boxes:
        if b['maxclass'] == 'flonum':
            for d, inlet in dest(b['id']):
                if by_id.get(d, {}).get('name') == 'vz.mixfadr.maxpat' and inlet == 2:
                    out['xfade'] = b['id']
        if b['maxclass'] == 'toggle':
            for d, _ in dest(b['id']):
                if by_id.get(d, {}).get('maxclass') == 'jit.playlist':
                    out['play'] = b['id']
        if b.get('name') == 'vz.projectr.maxpat':
            out['projectr'] = b['id']
    for need in ('xfade', 'play'):
        if need not in out:
            sys.exit(f'No encontré el control "{need}" en el patch')
    return out


def main():
    if len(sys.argv) != 4 or sys.argv[3] not in COLORS:
        sys.exit(__doc__)
    src, dst, color = sys.argv[1:]
    col = COLORS[color]
    doc = json.load(open(src, encoding='utf-8'))
    p = doc['patcher']

    # Quita bloques de corridas anteriores (con varname thegrid_, o ids 2001+
    # de la primera versión, que no llevaba varname).
    def generated(b):
        if str(b.get('varname', '')).startswith(TAG):
            return True
        num = b['id'].split('-')[-1]
        return num.isdigit() and 2001 <= int(num) <= 3999
    gen_ids = {x['box']['id'] for x in p['boxes'] if generated(x['box'])}
    p['boxes'] = [x for x in p['boxes'] if x['box']['id'] not in gen_ids]
    p['lines'] = [l for l in p['lines']
                  if l['patchline']['source'][0] not in gen_ids
                  and l['patchline']['destination'][0] not in gen_ids]

    boxes = [x['box'] for x in p['boxes']]
    ctl = find_controls(boxes, p['lines'])
    X = max(b['patching_rect'][0] + b['patching_rect'][2] for b in boxes) + 80
    counter = [3000]

    def new(cls, x, y, w, text=None, ni=1, no=1, outlettype=None, h=22, **kw):
        counter[0] += 1
        bid = f'obj-{counter[0]}'
        b = {'id': bid, 'maxclass': cls, 'numinlets': ni, 'numoutlets': no,
             'patching_rect': [X + x, y, w, h], 'varname': f'{TAG}{counter[0]}'}
        if text is not None:
            b['text'] = text
        if outlettype is not None:
            b['outlettype'] = outlettype
        b.update(kw)
        p['boxes'].append({'box': b})
        return bid

    def wire(a, ao, b, bi):
        p['lines'].append({'patchline': {'source': [a, ao], 'destination': [b, bi]}})

    def comment(x, y, w, text):
        return new('comment', x, y, w, text, ni=1, no=0, h=20)

    up = color.upper()
    pr = new('newobj', 400, 340, 130, f'print GRID-{up}', ni=1, no=0)

    # ------------------------------ THE GRID ------------------------------
    Y = 40
    comment(0, Y, 560, f'THE GRID · {up} — entradas desde grid-router.maxpat (abrirlo también)')
    comment(0, Y + 20, 560, 'Celda 1: efectos A · Celda 2: efectos B · Celda 3: crossfade A↔B · Bloqueo: pausa')

    def cell(k, y, label, target):
        r = new('newobj', 0, y, 110, f'r grid.{col}.{k}', no=1, outlettype=[''])
        t = new('newobj', 0, y + 30, 40, 't b', no=1, outlettype=['bang'])
        pp = new('newobj', 130, y, 110, f'prepend celda{k}', no=1, outlettype=[''])
        comment(250, y, 300, label)
        wire(r, 0, t, 0); wire(r, 0, pp, 0); wire(pp, 0, pr, 0)
        if target:
            wire(t, 0, target, 0)
        return t

    cell(1, Y + 60, 'prende/apaga efectos A (fractalizr → foggr)', ctl['chain_a'])
    cell(2, Y + 120, 'prende/apaga efectos B (interpol8r → delayr)', ctl['chain_b'])
    t3 = cell(3, Y + 180, 'salta el crossfade: A (0.) ↔ B (1.)', None)
    ab = new('toggle', 60, Y + 210, 24, ni=1, no=1, outlettype=['int'], parameter_enable=0, h=24)
    comment(90, Y + 212, 60, 'A / B')
    sel = new('newobj', 0, Y + 245, 70, 'sel 0 1', ni=3, no=3, outlettype=['bang', 'bang', ''])
    m0 = new('message', 0, Y + 275, 30, '0.', ni=2, no=1, outlettype=[''])
    m1 = new('message', 40, Y + 275, 30, '1.', ni=2, no=1, outlettype=[''])
    wire(t3, 0, ab, 0); wire(ab, 0, sel, 0); wire(sel, 0, m0, 0); wire(sel, 1, m1, 0)
    wire(m0, 0, ctl['xfade'], 0); wire(m1, 0, ctl['xfade'], 0)

    rl = new('newobj', 0, Y + 330, 130, f'r grid.lock.{col}', no=1, outlettype=[''])
    eq = new('newobj', 0, Y + 360, 40, '== 0', ni=2, no=1, outlettype=['int'])
    pl = new('newobj', 140, Y + 330, 110, 'prepend bloqueo', no=1, outlettype=[''])
    comment(260, Y + 330, 300, 'bloqueo 1 → pausa el video · 0 → lo reanuda')
    wire(rl, 0, eq, 0); wire(eq, 0, ctl['play'], 0); wire(rl, 0, pl, 0); wire(pl, 0, pr, 0)

    lb = new('newobj', 0, Y + 410, 60, 'loadbang', no=1, outlettype=['bang'])
    dl = new('newobj', 0, Y + 440, 80, 'delay 1000', ni=2, no=1, outlettype=['bang'])
    m = new('message', 0, Y + 470, 30, '1', ni=2, no=1, outlettype=[''])
    comment(90, Y + 440, 300, 'al abrir el patch: play del video (1 s después)')
    wire(lb, 0, dl, 0); wire(dl, 0, m, 0); wire(m, 0, ctl['play'], 0)

    # ------------------------------ ABLETON ------------------------------
    Y = 560
    comment(0, Y, 560, f'ABLETON · {up} — entradas desde ableton-bridge.maxpat (abrirlo también)')

    # Destello: tarolas (live.flash) → pulso del crossfade y regreso.
    rf = new('newobj', 0, Y + 30, 90, 'r live.flash', no=1, outlettype=[''])
    tf = new('newobj', 0, Y + 60, 40, 't b', no=1, outlettype=['bang'])
    mf = new('message', 0, Y + 90, 80, '1., 0. 250', ni=2, no=1, outlettype=[''])
    ln = new('newobj', 0, Y + 120, 80, 'line 0. 20', ni=3, no=2, outlettype=['', 'bang'])
    comment(100, Y + 30, 450, 'tarola → destello: el crossfade salta a B y regresa en 250 ms')
    wire(rf, 0, tf, 0); wire(tf, 0, mf, 0); wire(mf, 0, ln, 0); wire(ln, 0, ctl['xfade'], 0)
    pf = new('newobj', 130, Y + 60, 110, 'prepend destello', no=1, outlettype=[''])
    wire(rf, 0, pf, 0); wire(pf, 0, pr, 0)

    # Perillas (automatizables en Live): 1 → crossfade; 2-4 → libres.
    rk1 = new('newobj', 0, Y + 170, 100, 'r live.knob.1', no=1, outlettype=[''])
    comment(110, Y + 170, 440, 'perilla 1 (0..1) → crossfade A↔B')
    wire(rk1, 0, ctl['xfade'], 0)
    for i, k in enumerate((2, 3, 4)):
        x = i * 120
        rk = new('newobj', x, Y + 205, 100, f'r live.knob.{k}', no=1, outlettype=[''])
        fk = new('flonum', x, Y + 235, 60, ni=1, no=2, outlettype=['', 'bang'], parameter_enable=0)
        wire(rk, 0, fk, 0)
    comment(0, Y + 262, 560, 'perillas 2-4 (0..1): conecta cada número al parámetro de Vizzie que quieras')

    # Escenas de Live → setups del patch.
    rs = new('newobj', 0, Y + 300, 90, 'r live.scene', no=1, outlettype=[''])
    ss = new('newobj', 0, Y + 330, 90, 'sel 1 2 3 4', ni=5, no=5, outlettype=['bang'] * 5)
    setups = [('1 0 0.', 'escena 1: solo A'), ('0 1 1.', 'escena 2: solo B'),
              ('1 1 0.5', 'escena 3: A+B mezclados'), ('0 0 0.', 'escena 4: limpio')]
    up_ = new('newobj', 0, Y + 400, 110, 'unpack 0 0 0.', ni=1, no=3, outlettype=['int', 'int', 'float'])
    for i, (msg, label) in enumerate(setups):
        mb = new('message', i * 70, Y + 360, 60, msg, ni=2, no=1, outlettype=[''])
        wire(ss, i, mb, 0); wire(mb, 0, up_, 0)
    comment(300, Y + 300, 260, 'escena → [efectos A, efectos B, crossfade]')
    for i, (_, label) in enumerate(setups):
        comment(300, Y + 320 + i * 18, 260, label)
    wire(rs, 0, ss, 0)
    wire(up_, 0, ctl['chain_a'], 0); wire(up_, 1, ctl['chain_b'], 0); wire(up_, 2, ctl['xfade'], 0)
    ps = new('newobj', 130, Y + 300, 100, 'prepend escena', no=1, outlettype=[''])
    wire(rs, 0, ps, 0); wire(ps, 0, pr, 0)

    # Nombre del projectr según el color (venía copiado como greenProjectr).
    english = {'verde': 'green', 'amarillo': 'yellow', 'rojo': 'red'}[color]
    for x in p['boxes']:
        if x['box']['id'] == ctl.get('projectr'):
            x['box']['varname'] = f'{english}Projectr'

    json.dump(doc, open(dst, 'w', encoding='utf-8'), indent='\t', ensure_ascii=False)
    print(f'{dst}: {len(p["boxes"])} cajas, {len(p["lines"])} conexiones')


if __name__ == '__main__':
    main()
