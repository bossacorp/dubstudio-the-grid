#!/usr/bin/env python3
"""Genera las abstracciones de Max que usan los templates de efectos.

  grid.env <pico> <base> <compases>
      Golpe y regreso: al recibir un bang salta a <pico> y regresa a <base>
      en <compases> (acepta fracciones: 0.25 = un cuarto de compás). Al abrir
      el patch se queda en <base>. Ej: [grid.env 0.9 0. 2]

  grid.strobe <por-compás> <compases>
      Estrobo: al recibir un bang alterna 1/0 <por-compás> veces por compás
      durante <compases> y termina en 0. Ej: [grid.strobe 8 1]

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

    def save(self, name):
        doc = {'patcher': {
            'fileversion': 1,
            'appversion': {'major': 8, 'minor': 6, 'revision': 5, 'architecture': 'x64', 'modernui': 1},
            'classnamespace': 'box', 'rect': [100, 100, 560, 420], 'default_fontsize': 12.0,
            'gridsize': [15.0, 15.0], 'boxes': self.boxes, 'lines': self.lines,
        }}
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
