#!/usr/bin/env python3
"""Genera las abstracciones de Max que usan los templates de efectos.

  grid.env <pico> <base> <compases>
      Golpe y regreso: al recibir un bang salta a <pico> y regresa a <base>
      en <compases> (acepta fracciones: 0.25 = un cuarto de compás). Al abrir
      el patch se queda en <base>. Ej: [grid.env 0.9 0. 2]

  grid.strobe <por-compás> <compases>
      Estrobo: al recibir un bang alterna 1/0 <por-compás> veces por compás
      durante <compases> y termina en 0. Ej: [grid.strobe 8 1]

  grid.lfo <compases> <profundidad>   (se usa como bpatcher: trae su panel)
      Movimiento suave para SUMAR a un valor (no lo reemplaza): curva
      senoidal de 0 a <profundidad> y de regreso, un ciclo cada <compases>.
      Panel: on/off (al apagar se desvanece en ½ s), compases y profundidad.
      Entradas: 1) on/off  2) compases  3) profundidad. Salida: 0..profundidad.
      Ej: bpatcher grid.lfo.maxpat con args 8 0.15.

  grid.hold <compases>
      Entra y sale: al recibir un bang saca 1 (prende un módulo) y a los
      <compases> saca 0 (lo apaga). Otro bang antes de tiempo reinicia la
      cuenta. Al abrir el patch saca 0 (módulo apagado). Ej: [grid.hold 2]

La duración del compás llega de Ableton por [r live.barms] (ms); mientras no
llegue se usa 2000 ms (120 BPM, 4/4).

Se escriben en max/bobGrid/ (deben estar en la misma carpeta que los patches
de color, o en la ruta de búsqueda de Max).

Uso: python3 max/tools/generar_abstracciones.py
"""
import json
import os

OUT = os.path.join(os.path.dirname(__file__), '..', 'bobGrid')


class Patch:
    def __init__(self):
        self.boxes, self.lines, self.n = [], [], 0

    def box(self, cls, rect, text=None, ni=1, no=1, ot=None, **kw):
        self.n += 1
        bid = f'obj-{self.n}'
        b = {'id': bid, 'maxclass': cls, 'numinlets': ni, 'numoutlets': no, 'patching_rect': rect}
        if text is not None:
            b['text'] = text
        if ot is not None:
            b['outlettype'] = ot
        b.update(kw)
        self.boxes.append({'box': b})
        return bid

    def obj(self, x, y, w, text, ni=1, no=1, ot=None, **kw):
        return self.box('newobj', [x, y, w, 22], text, ni, no, ot if ot is not None else [''] * no, **kw)

    def msg(self, x, y, w, text):
        return self.box('message', [x, y, w, 22], text, 2, 1, [''])

    def com(self, x, y, w, text):
        return self.box('comment', [x, y, w, 20], text, 1, 0)

    def wire(self, a, ao, b, bi):
        self.lines.append({'patchline': {'source': [a, ao], 'destination': [b, bi]}})

    def save(self, name, **extra):
        doc = {'patcher': {
            'fileversion': 1,
            'appversion': {'major': 8, 'minor': 6, 'revision': 5, 'architecture': 'x64', 'modernui': 1},
            'classnamespace': 'box', 'rect': [100, 100, 560, 420], 'default_fontsize': 12.0,
            'gridsize': [15.0, 15.0], 'boxes': self.boxes, 'lines': self.lines,
        }}
        doc['patcher'].update(extra)
        path = os.path.join(OUT, name)
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(doc, f, indent=1, ensure_ascii=False)
        print(f'{path}: {len(self.boxes)} cajas, {len(self.lines)} conexiones')


def bar_ms(p, x, y, expr):
    """[loadmess 2000.] y [r live.barms] → [expr ...]: ms derivados del compás."""
    lm = p.obj(x, y, 90, 'loadmess 2000.', no=1)
    rb = p.obj(x + 100, y, 90, 'r live.barms', no=1)
    ex = p.obj(x, y + 30, 150, expr, no=1)
    p.wire(lm, 0, ex, 0)
    p.wire(rb, 0, ex, 0)
    return ex, (lm, rb)


def grid_env():
    p = Patch()
    p.com(20, 10, 520, 'grid.env <pico> <base> <compases> — golpe y regreso al tempo de Ableton')
    inl = p.box('inlet', [20, 40, 30, 30], None, 0, 1, [''], comment='bang: dispara')
    tb = p.obj(20, 80, 40, 't b', ot=['bang'])
    ms = p.obj(20, 170, 50, 'f', ni=2, no=1, ot=['float'])
    ex, _ = bar_ms(p, 200, 80, 'expr $f1 * #3')
    msg = p.msg(20, 200, 90, '#1, #2 $1')
    ln = p.obj(20, 230, 80, 'line 0. 20', ni=3, no=2, ot=['', 'bang'])
    out = p.box('outlet', [20, 270, 30, 30], None, 1, 0, comment='valor (de pico a base)')
    base = p.obj(130, 200, 70, 'loadmess #2', no=1)
    p.com(210, 200, 300, '← al abrir el patch se queda en la base')
    p.wire(inl, 0, tb, 0); p.wire(tb, 0, ms, 0); p.wire(ex, 0, ms, 1)
    p.wire(ms, 0, msg, 0); p.wire(msg, 0, ln, 0); p.wire(base, 0, ln, 0); p.wire(ln, 0, out, 0)
    p.save('grid.env.maxpat')


def grid_strobe():
    p = Patch()
    p.com(20, 10, 520, 'grid.strobe <por-compás> <compases> — alterna 1/0 y termina en 0')
    inl = p.box('inlet', [20, 40, 30, 30], None, 0, 1, [''], comment='bang: dispara')
    t3 = p.obj(20, 80, 60, 't b b b', no=3, ot=['bang', 'bang', 'bang'])
    rate, sources = bar_ms(p, 240, 40, 'expr $f1 / #1')
    dur = p.obj(400, 70, 120, 'expr $f1 * #2', no=1)
    for src in sources:  # la misma duración de compás alimenta ambos expr
        p.wire(src, 0, dur, 0)
    on = p.msg(140, 120, 30, '1')
    setz = p.msg(200, 120, 50, 'set 0')
    met = p.obj(140, 160, 60, 'metro 250', ni=2, no=1, ot=['bang'])
    tog = p.box('toggle', [140, 200, 24, 24], None, 1, 1, ['int'], parameter_enable=0)
    dl = p.obj(20, 160, 80, 'delay 2000', ni=2, no=1, ot=['bang'])
    zero = p.msg(20, 200, 30, '0')
    out = p.box('outlet', [140, 260, 30, 30], None, 1, 0, comment='1 / 0')
    p.wire(inl, 0, t3, 0)
    p.wire(t3, 2, setz, 0); p.wire(setz, 0, tog, 0)      # primero: toggle en 0 sin salida
    p.wire(t3, 1, on, 0); p.wire(on, 0, met, 0)          # luego: arranca el metro
    p.wire(t3, 0, dl, 0)                                 # y la cuenta para parar
    p.wire(rate, 0, met, 1); p.wire(dur, 0, dl, 1)
    p.wire(met, 0, tog, 0); p.wire(tog, 0, out, 0)
    p.wire(dl, 0, zero, 0)
    p.wire(zero, 0, met, 0)    # para el metro
    p.wire(zero, 0, tog, 0)    # y deja el toggle en 0 (sale 0)
    p.save('grid.strobe.maxpat')


def grid_lfo():
    p = Patch()

    def ui(cls, rect, pres, **kw):
        return p.box(cls, rect, None, 1, kw.pop('no', 1), kw.pop('ot', ['']), presentation=1,
                     presentation_rect=pres, **kw)

    # Panel (lo que se ve en el bpatcher)
    tog = ui('toggle', [20, 120, 22, 22], [4, 4, 20, 20], ot=['int'], parameter_enable=0)
    p.box('comment', [50, 120, 120, 20], 'LFO (suave)', 1, 0, presentation=1, presentation_rect=[28, 4, 120, 20])
    bars = ui('number', [20, 160, 50, 22], [4, 28, 44, 22], no=2, ot=['', 'bang'], minimum=1, maximum=64,
              parameter_enable=0)
    p.box('comment', [75, 160, 70, 20], 'compases', 1, 0, presentation=1, presentation_rect=[50, 29, 64, 20])
    depth = ui('flonum', [160, 160, 50, 22], [116, 28, 48, 22], no=2, ot=['', 'bang'], minimum=0., maximum=1.,
               format=6, parameter_enable=0)
    p.box('comment', [215, 160, 70, 20], 'prof.', 1, 0, presentation=1, presentation_rect=[166, 29, 40, 20])

    # Entradas (en orden de izquierda a derecha) y valores iniciales
    in_on = p.box('inlet', [20, 40, 30, 30], None, 0, 1, [''], comment='1 = on, 0 = off')
    in_bars = p.box('inlet', [200, 40, 30, 30], None, 0, 1, [''], comment='compases por ciclo')
    in_depth = p.box('inlet', [380, 40, 30, 30], None, 0, 1, [''], comment='profundidad 0..1')
    p.wire(in_on, 0, tog, 0); p.wire(in_bars, 0, bars, 0); p.wire(in_depth, 0, depth, 0)
    l_on = p.obj(60, 80, 70, 'loadmess 1', no=1)
    l_bars = p.obj(240, 80, 80, 'loadmess #1', no=1)
    l_depth = p.obj(420, 80, 80, 'loadmess #2', no=1)
    p.wire(l_on, 0, tog, 0); p.wire(l_bars, 0, bars, 0); p.wire(l_depth, 0, depth, 0)

    # Medio ciclo = compases × duración del compás (de Ableton) ÷ 2
    lm = p.obj(320, 200, 90, 'loadmess 2000.', no=1)
    rb = p.obj(420, 200, 90, 'r live.barms', no=1)
    pk = p.obj(20, 240, 90, 'pak 1. 2000.', ni=2, no=1)
    cyc = p.obj(20, 270, 140, 'expr $f1 * $f2 * 0.5', ni=2, no=1)
    floor_ = p.obj(20, 300, 90, 'maximum 100.', ni=2, no=1)
    p.wire(bars, 0, pk, 0); p.wire(lm, 0, pk, 1); p.wire(rb, 0, pk, 1)
    p.wire(pk, 0, cyc, 0); p.wire(cyc, 0, floor_, 0)

    # Fase: rampa 0→1 y 1→0 sin parar (solo rampas, nunca salta); al terminar
    # cada rampa arranca la otra. Los compases nuevos entran en la siguiente.
    start = p.obj(160, 330, 60, 'loadbang', no=1, ot=['bang'])
    dly = p.obj(160, 360, 70, 'delay 100', ni=2, no=1, ot=['bang'])
    again = p.obj(20, 360, 40, 't b', ot=['bang'])
    cnt = p.obj(20, 390, 80, 'counter 0 1', ni=3, no=4, ot=['int', '', '', 'int'])
    sel = p.obj(20, 420, 60, 'sel 0 1', ni=3, no=3, ot=['bang', 'bang', ''])
    f_up = p.obj(20, 450, 60, 'f 8000.', ni=2, no=1, ot=['float'])
    f_dn = p.obj(100, 450, 60, 'f 8000.', ni=2, no=1, ot=['float'])
    up = p.msg(20, 480, 50, '1. $1')
    dn = p.msg(100, 480, 50, '0. $1')
    phase = p.obj(20, 510, 80, 'line 0. 20', ni=3, no=2, ot=['', 'bang'])
    p.wire(floor_, 0, f_up, 1); p.wire(floor_, 0, f_dn, 1)
    p.wire(start, 0, dly, 0); p.wire(dly, 0, again, 0)
    p.wire(again, 0, cnt, 0); p.wire(cnt, 0, sel, 0)
    p.wire(sel, 0, f_up, 0); p.wire(sel, 1, f_dn, 0)
    p.wire(f_up, 0, up, 0); p.wire(f_dn, 0, dn, 0)
    p.wire(up, 0, phase, 0); p.wire(dn, 0, phase, 0)
    p.wire(phase, 1, again, 0)

    # Profundidad efectiva: on × profundidad, suavizada (½ s) para no brincar
    dp = p.obj(260, 420, 70, 'pak 0 0.', ni=2, no=1)
    dmul = p.obj(260, 450, 100, 'expr $f1 * $f2', ni=2, no=1)
    dmsg = p.msg(260, 480, 60, '$1 500')
    dline = p.obj(260, 510, 80, 'line 0. 20', ni=3, no=2, ot=['', 'bang'])
    p.wire(tog, 0, dp, 0); p.wire(depth, 0, dp, 1)
    p.wire(dp, 0, dmul, 0); p.wire(dmul, 0, dmsg, 0); p.wire(dmsg, 0, dline, 0)

    # Salida: curva suave 0 → profundidad → 0 (sin esquinas)
    shape = p.obj(20, 550, 300, 'expr (0.5 - 0.5 * cos($f1 * 3.141593)) * $f2', ni=2, no=1)
    out = p.box('outlet', [20, 590, 30, 30], None, 1, 0, comment='0..profundidad (súmalo a la base)')
    p.wire(phase, 0, shape, 0); p.wire(dline, 0, shape, 1); p.wire(shape, 0, out, 0)
    p.com(20, 10, 540, 'grid.lfo <compases> <profundidad> — movimiento suave para SUMAR a un valor')
    p.save('grid.lfo.maxpat', openinpresentation=1, rect=[100, 100, 600, 640])


def grid_hold():
    p = Patch()
    p.com(20, 10, 520, 'grid.hold <compases> — 1 al disparar, 0 a los N compases')
    inl = p.box('inlet', [20, 40, 30, 30], None, 0, 1, [''], comment='bang: prende')
    t2 = p.obj(20, 80, 50, 't b b', no=2, ot=['bang', 'bang'])
    one = p.msg(80, 120, 30, '1')
    dl = p.obj(20, 160, 80, 'delay 2000', ni=2, no=1, ot=['bang'])
    zero = p.msg(20, 190, 30, '0')
    out = p.box('outlet', [20, 240, 30, 30], None, 1, 0, comment='1 = prendido, 0 = apagado')
    ex, _ = bar_ms(p, 240, 80, 'expr $f1 * #1')
    off = p.obj(130, 190, 70, 'loadmess 0', no=1)
    p.com(210, 190, 300, '← al abrir el patch: apagado')
    p.wire(inl, 0, t2, 0)
    p.wire(t2, 1, one, 0); p.wire(one, 0, out, 0)   # primero prende
    p.wire(t2, 0, dl, 0)                            # luego cuenta (reinicia si ya contaba)
    p.wire(ex, 0, dl, 1); p.wire(dl, 0, zero, 0)
    p.wire(zero, 0, out, 0); p.wire(off, 0, out, 0)
    p.save('grid.hold.maxpat')


if __name__ == '__main__':
    grid_env()
    grid_strobe()
    grid_hold()
    grid_lfo()
