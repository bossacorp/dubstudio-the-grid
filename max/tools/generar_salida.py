#!/usr/bin/env python3
"""Genera max/bobGrid/salida.maxpat: UNA sola ventana para los 3 colores.

Antes cada patch de color tenía su PROJECTR (su propia ventana y su propio
ciclo de dibujo) y se frenaban entre sí: 1 solo = 30-35 fps, los 3 = 12.
Ahora cada patch manda su imagen con [s thegrid.salida.<color>] y aquí:

  [r thegrid.salida.verde|amarillo|rojo] → jit.gl.videoplane (lado a lado)
      → jit.gl.node escena (@capture 1, 1920×1080)
      → videoplane a pantalla completa en jit.world thegrid (30 fps fijos)
      → jit.gl.syphonserver "The Grid" (OBS: fuente Syphon Client)

Si el paquete Syphon no está instalado, su caja sale punteada y todo lo demás
funciona igual (OBS captura la ventana).

Los módulos de Vizzie y los jit.playlist de los 3 patches se dibujan en el
único contexto que existe (jit.world thegrid): abre salida.maxpat PRIMERO.

Uso: python3 max/tools/generar_salida.py
"""
import math

from generar_abstracciones import Patch

COLORES = ('verde', 'amarillo', 'rojo')
W, H = 1920, 1080
# Cámara por omisión de Jitter: en z=2, lente de 45°. A z=0 se ve de
# -alto..alto en y, y de -ancho..ancho en x (proporción 16:9).
ALTO = 2 * math.tan(math.radians(45 / 2))
ANCHO = ALTO * W / H


def main():
    p = Patch()
    p.com(20, 15, 640, 'THE GRID · SALIDA — una sola ventana para los 3 colores (ábrela ANTES que los patches de color)')
    p.com(20, 35, 640, 'Cada patch de color manda su imagen con [s thegrid.salida.<color>]. Ventana: Esc / doble clic = pantalla completa.')

    p.obj(20, 420, 560, f'jit.world thegrid @size {W} {H} @fps 30 @sync 0 @enable 1 '
                        '@erase_color 0 0 0 1 @fsmenubar 0', ni=1, no=3)
    node = p.obj(20, 260, 560, f'jit.gl.node thegrid @name escena @capture 1 @adapt 0 @dim {W} {H} '
                               '@erase_color 0 0 0 1', ni=1, no=2)
    p.com(20, 70, 640, 'Lado a lado: verde | amarillo | rojo. Para mover una franja edita @position / @scale de su videoplane.')
    franja = ANCHO * 2 / 3
    for i, color in enumerate(COLORES):
        x = 20 + i * 210
        r = p.obj(x, 100, 190, f'r thegrid.salida.{color}')
        cx = -ANCHO + franja * (i + 0.5)
        vp = p.obj(x, 140, 200, f'jit.gl.videoplane escena @transform_reset 0 @position {cx:.5f} 0. 0. '
                                f'@scale {franja / 2:.5f} {ALTO:.5f} 1. @depth_enable 0', ni=2, no=2)
        p.wire(r, 0, vp, 0)

    # La escena (textura 1920×1080) → ventana, Syphon y medidor de fps.
    pantalla = p.obj(20, 330, 300, 'jit.gl.videoplane thegrid @transform_reset 2 @depth_enable 0', ni=2, no=2)
    syphon = p.obj(340, 330, 260, 'jit.gl.syphonserver thegrid @servername "The Grid"', ni=1, no=1)
    fps = p.box('jit.fpsgui', [620, 330, 80, 36], ni=1, no=2, ot=['', ''], mode=0,
                presentation=1, presentation_rect=[20, 60, 80, 36])
    p.wire(node, 0, pantalla, 0)
    p.wire(node, 0, syphon, 0)
    p.wire(node, 0, fps, 0)
    p.com(340, 360, 360, 'OBS: fuente "Syphon Client" → servidor "The Grid" (Max)')
    p.com(620, 300, 200, 'fps de la salida (meta: 30)')

    p.box('comment', [720, 300, 300, 20], 'THE GRID · SALIDA', 1, 0, fontface=1,
          presentation=1, presentation_rect=[20, 20, 300, 20])
    p.box('comment', [720, 320, 300, 20], 'fps (meta: 30) · Syphon: "The Grid"', 1, 0,
          presentation=1, presentation_rect=[110, 68, 300, 20])
    p.save('salida.maxpat', rect=[60, 60, 760, 480])


if __name__ == '__main__':
    main()
