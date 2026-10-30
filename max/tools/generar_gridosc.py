#!/usr/bin/env python3
"""Genera el dispositivo de Max for Live GridOSC (Max MIDI Effect para Live 12).

Salidas:
  max/ableton/GridOSC.maxpat  patch fuente (abre en vista de cables, para que
                              Cmd+A copie todo si se arma a mano)
  max/ableton/GridOSC.amxd    dispositivo listo para arrastrar a una pista MIDI

Qué hace el dispositivo:
  - deja pasar el MIDI al instrumento
  - notas → OSC a la Mac mini (:9200): modo "golpes" /live/hit nota vel,
    modo "escenas" /live/scene n (C1 = 1, C#1 = 2, ...)
  - CC → /live/cc num val; 4 perillas automatizables → /live/knob/1..4 (0..1)
  - compás de Live → /show/bar n al Grid Server (Linux Mint :9100) y la
    duración del compás en ms → /live/barms a la Mac mini (para que las
    envolventes de los visuales caigan al tempo de Live)
  - las IPs de la Mac mini y la Linux Mint se editan en la cara del
    dispositivo (4 casillas cada una) y se guardan con el set de Live

Uso: python3 max/tools/generar_gridosc.py
"""
import json
import os
import struct

OUT = os.path.join(os.path.dirname(__file__), '..', 'ableton')


class Patch:
    def __init__(self):
        self.boxes, self.lines, self.n = [], [], 0

    def box(self, cls, rect, text=None, ni=1, no=1, ot=None, pres=None, **kw):
        self.n += 1
        bid = f'obj-{self.n}'
        b = {'id': bid, 'maxclass': cls, 'numinlets': ni, 'numoutlets': no, 'patching_rect': rect}
        if text is not None:
            b['text'] = text
        if ot is not None:
            b['outlettype'] = ot
        if pres is not None:
            b['presentation'] = 1
            b['presentation_rect'] = pres
        b.update(kw)
        self.boxes.append({'box': b})
        return bid

    def obj(self, x, y, w, text, ni=1, no=1, ot=None, **kw):
        return self.box('newobj', [x, y, w, 22], text, ni, no, ot if ot is not None else [''] * no, **kw)

    def com(self, x, y, w, text, pres=None, **kw):
        return self.box('comment', [x, y, w, 20], text, 1, 0, pres=pres, **kw)

    def wire(self, a, ao, b, bi):
        self.lines.append({'patchline': {'source': [a, ao], 'destination': [b, bi]}})


def param(longname, shortname, ptype, **extra):
    v = {'parameter_longname': longname, 'parameter_shortname': shortname, 'parameter_type': ptype}
    v.update(extra)
    return {'saved_attribute_attributes': {'valueof': v}, 'parameter_enable': 1, 'varname': longname}


def build():
    d = Patch()
    d.com(20, 10, 300, 'THE GRID · OSC', pres=[4, 2, 110, 20], fontface=1)

    # MIDI: pasa al instrumento y se analiza.
    mi = d.obj(20, 60, 50, 'midiin', no=1, ot=['int'])
    mo = d.obj(20, 95, 55, 'midiout', no=0)
    d.wire(mi, 0, mo, 0)
    d.com(90, 60, 300, 'el MIDI sigue pasando al instrumento')
    mp = d.obj(20, 140, 80, 'midiparse', no=8, ot=['', '', '', 'int', 'int', '', 'int', ''])
    d.wire(mi, 0, mp, 0)

    # Notas → golpes o escenas.
    un = d.obj(20, 175, 70, 'unpack 0 0', no=2, ot=['int', 'int'])
    sn = d.obj(20, 205, 70, 'stripnote', ni=2, no=2, ot=['int', 'int'])
    pk = d.obj(20, 235, 70, 'pack 0 0', ni=2, no=1)
    d.wire(mp, 0, un, 0); d.wire(un, 0, sn, 0); d.wire(un, 1, sn, 1)
    d.wire(sn, 0, pk, 0); d.wire(sn, 1, pk, 1)
    mode = d.box('live.menu', [200, 175, 90, 15], None, 1, 3, ['', '', ''], pres=[4, 24, 70, 15],
                 **param('Modo notas', 'Notas', 2, parameter_enum=['golpes', 'escenas'], parameter_mmax=1))
    d.com(300, 172, 300, 'golpes: nota → /live/hit · escenas: nota → /live/scene (C1 = 1, C#1 = 2…)',
          pres=[78, 20, 96, 30], fontsize=9.0)
    plus = d.obj(200, 205, 40, '+ 1', ni=2)
    g2 = d.obj(20, 270, 60, 'gate 2', ni=2, no=2)
    d.wire(mode, 0, plus, 0); d.wire(plus, 0, g2, 0); d.wire(pk, 0, g2, 1)
    ph = d.obj(20, 305, 110, 'prepend /live/hit')
    ut = d.obj(150, 305, 80, 'unpack 0 0', no=2, ot=['int', 'int'])
    mn = d.obj(150, 335, 50, '- 35', ni=2)
    psn = d.obj(150, 365, 120, 'prepend /live/scene')
    d.wire(g2, 0, ph, 0); d.wire(g2, 1, ut, 0); d.wire(ut, 0, mn, 0); d.wire(mn, 0, psn, 0)

    # CC.
    pcc = d.obj(300, 140, 110, 'prepend /live/cc')
    d.wire(mp, 2, pcc, 0)

    # Perillas automatizables.
    dials = []
    for i in range(4):
        dl = d.box('live.dial', [440 + i * 60, 60, 44, 48], None, 1, 2, ['', 'float'],
                   pres=[180 + i * 48, 2, 44, 48],
                   **param(f'Perilla {i + 1}', f'P{i + 1}', 0, parameter_mmin=0.0, parameter_mmax=1.0,
                           parameter_unitstyle=1))
        pp = d.obj(440 + i * 60, 120, 110, f'prepend /live/knob/{i + 1}')
        d.wire(dl, 0, pp, 0)
        dials.append(dl)
        dials.append(pp)

    # IP editable en la cara del dispositivo: 4 casillas → "host a.b.c.d".
    def ip_row(y_patch, y_pres, label, default, longprefix):
        d.com(20, y_patch, 120, label, pres=[4, y_pres - 2, 62, 18], fontsize=10.0)
        pak = d.obj(160, y_patch + 30, 90, 'pak 0 0 0 0', ni=4, no=1)
        boxes = []
        for i, val in enumerate(default):
            nb = d.box('live.numbox', [160 + i * 45, y_patch, 40, 15], None, 1, 2, ['', 'float'],
                       pres=[66 + i * 28, y_pres, 26, 15],
                       **param(f'{longprefix} {i + 1}', f'{longprefix[:3]}{i + 1}', 1,
                               parameter_mmin=0.0, parameter_mmax=255.0,
                               parameter_initial_enable=1, parameter_initial=[val]))
            d.wire(nb, 0, pak, i)
            boxes.append(nb)
        sp = d.obj(160, y_patch + 60, 150, 'sprintf %ld.%ld.%ld.%ld', ni=4, no=1)
        hp = d.obj(160, y_patch + 90, 90, 'prepend host')
        d.wire(pak, 0, sp, 0); d.wire(sp, 0, hp, 0)
        return boxes, hp

    mac_boxes, mac_host = ip_row(410, 82, 'Mac mini :9200', [192, 168, 1, 20], 'IP Mac mini')
    tx = d.obj(20, 535, 170, 'udpsend 192.168.1.20 9200', no=0)
    d.wire(mac_host, 0, tx, 0)
    for b in (ph, psn, pcc):
        d.wire(b, 0, tx, 0)
    for b in dials[1::2]:
        d.wire(b, 0, tx, 0)
    pl = d.obj(220, 535, 90, 'print GridOSC', no=0)
    for b in (ph, psn, pcc):
        d.wire(b, 0, pl, 0)

    # Compás → Grid Server.
    ct = d.box('live.toggle', [20, 590, 20, 20], None, 1, 1, ['int'], pres=[4, 46, 16, 16],
               **param('Enviar compás', 'Compás', 2, parameter_enum=['off', 'on'], parameter_mmax=1,
                       parameter_initial_enable=1, parameter_initial=[1]))
    d.com(45, 590, 300, 'enviar compás a The Grid (Ableton manda el tempo)', pres=[22, 44, 54, 18],
          fontsize=10.0)
    me = d.obj(20, 620, 140, 'metro 1n @quantize 1n', ni=2, ot=['bang'])
    tr = d.obj(20, 650, 80, 'transport', ni=2, no=9, ot=['int', 'int', 'float', 'float', 'float', '', 'int', 'float', ''])
    pb = d.obj(20, 680, 110, 'prepend /show/bar')
    mint_boxes, mint_host = ip_row(720, 102, 'Linux Mint :9100', [192, 168, 1, 10], 'IP Linux Mint')
    tb = d.obj(20, 845, 170, 'udpsend 192.168.1.10 9100', no=0)
    pb2 = d.obj(220, 845, 90, 'print GridOSC', no=0)
    d.wire(ct, 0, me, 0); d.wire(me, 0, tr, 0); d.wire(tr, 0, pb, 0)

    # Duración del compás (ms) según tempo y compás de Live. transport saca
    # de derecha a izquierda: primero el compás (4 4), al final el tempo.
    ts = d.obj(200, 680, 70, 'unpack 4 4', no=2, ot=['int', 'int'])
    ex = d.obj(200, 710, 230, 'expr 60000. / $f1 * $i2 * 4. / $i3', ni=3, no=1)
    chg = d.obj(200, 740, 60, 'change 0.', ni=2, no=3, ot=['', 'int', 'int'])
    pms = d.obj(200, 770, 120, 'prepend /live/barms')
    d.wire(tr, 5, ts, 0); d.wire(ts, 0, ex, 1); d.wire(ts, 1, ex, 2)
    d.wire(tr, 4, ex, 0); d.wire(ex, 0, chg, 0); d.wire(chg, 0, pms, 0)
    d.wire(pb, 0, tb, 0); d.wire(pb, 0, pb2, 0); d.wire(mint_host, 0, tb, 0)
    d.wire(pms, 0, tx, 0); d.wire(pms, 0, pl, 0)

    # Al cargar el dispositivo, cada control manda su valor guardado.
    td = d.obj(500, 590, 100, 'live.thisdevice', no=3, ot=['bang', 'int', 'int'])
    for b in [mode, ct] + dials[0::2] + mac_boxes + mint_boxes:
        d.wire(td, 0, b, 0)

    patcher = {
        'fileversion': 1,
        'appversion': {'major': 8, 'minor': 6, 'revision': 5, 'architecture': 'x64', 'modernui': 1},
        'classnamespace': 'box',
        'rect': [100, 100, 760, 900],
        # Abre en vista de cables (si abriera en presentación, Cmd+A solo
        # copiaría los controles visibles). En Live se muestra la presentación.
        'openinpresentation': 0,
        'default_fontsize': 12.0,
        'gridsize': [15.0, 15.0],
        'boxes': d.boxes,
        'lines': d.lines,
    }
    return {'patcher': patcher}


def write_amxd(doc, path):
    """Dispositivo .amxd: cabecera ampf (tipo mmmm = MIDI effect) + JSON del patch."""
    device = json.loads(json.dumps(doc))
    device['patcher']['openinpresentation'] = 1
    device['patcher']['devicewidth'] = 380.0
    body = json.dumps(device, indent='\t', ensure_ascii=False).encode('utf-8') + b'\n\x00'
    header = (b'ampf' + struct.pack('<I', 4) + b'mmmm'
              + b'meta' + struct.pack('<I', 4) + b'\x00\x00\x00\x00'
              + b'ptch' + struct.pack('<I', len(body)))
    with open(path, 'wb') as f:
        f.write(header + body)


def main():
    os.makedirs(OUT, exist_ok=True)
    doc = build()
    maxpat = os.path.join(OUT, 'GridOSC.maxpat')
    with open(maxpat, 'w', encoding='utf-8') as f:
        json.dump(doc, f, indent=1, ensure_ascii=False)
    amxd = os.path.join(OUT, 'GridOSC.amxd')
    write_amxd(doc, amxd)
    p = doc['patcher']
    print(f'{maxpat}: {len(p["boxes"])} cajas, {len(p["lines"])} conexiones')
    print(f'{amxd}: {os.path.getsize(amxd)} bytes')


if __name__ == '__main__':
    main()
