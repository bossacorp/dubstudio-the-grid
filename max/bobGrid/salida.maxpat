{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 5,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60,
   60,
   760,
   480
  ],
  "default_fontsize": 12.0,
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      20,
      420,
      560,
      22
     ],
     "text": "jit.world thegrid @size 1920 1080 @fps 30 @sync 0 @enable 1 @erase_color 0 0 0 1 @fsmenubar 0",
     "outlettype": [
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
      260,
      560,
      22
     ],
     "text": "jit.gl.node thegrid @name escena @capture 1 @adapt 0 @dim 1920 1080 @erase_color 0 0 0 1",
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      15,
      640,
      20
     ],
     "text": "THE GRID · SALIDA — una sola ventana para los 3 colores. Abre SOLO este patch (más grid-router y ableton-bridge), NO los de color por separado."
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      35,
      640,
      20
     ],
     "text": "Cada patch de color manda su imagen con [s thegrid.salida.<color>]. Ventana: Esc / doble clic = pantalla completa."
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      720,
      100,
      300,
      20
     ],
     "text": "Los 3 colores (doble clic = abrir sus controles):"
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 0,
     "patching_rect": [
      720,
      125,
      200,
      22
     ],
     "text": "green-bob-rebel-music",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      930,
      125,
      80,
      20
     ],
     "text": "verde"
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 0,
     "patching_rect": [
      720,
      155,
      200,
      22
     ],
     "text": "yellow-bob-rebel-music",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      930,
      155,
      80,
      20
     ],
     "text": "amarillo"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "numinlets": 0,
     "numoutlets": 0,
     "patching_rect": [
      720,
      185,
      200,
      22
     ],
     "text": "red-bob-rebel-music",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      930,
      185,
      80,
      20
     ],
     "text": "rojo"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      70,
      640,
      20
     ],
     "text": "Lado a lado: verde | amarillo | rojo. Para mover una franja edita @position / @scale de su videoplane."
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      100,
      190,
      22
     ],
     "text": "r thegrid.salida.verde",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      140,
      200,
      22
     ],
     "text": "jit.gl.videoplane escena @transform_reset 0 @position -0.98184 0. 0. @scale 0.49092 0.82843 1. @depth_enable 0",
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      230,
      100,
      190,
      22
     ],
     "text": "r thegrid.salida.amarillo",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      230,
      140,
      200,
      22
     ],
     "text": "jit.gl.videoplane escena @transform_reset 0 @position 0.00000 0. 0. @scale 0.49092 0.82843 1. @depth_enable 0",
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      440,
      100,
      190,
      22
     ],
     "text": "r thegrid.salida.rojo",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      440,
      140,
      200,
      22
     ],
     "text": "jit.gl.videoplane escena @transform_reset 0 @position 0.98184 0. 0. @scale 0.49092 0.82843 1. @depth_enable 0",
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      330,
      300,
      22
     ],
     "text": "jit.gl.videoplane thegrid @transform_reset 2 @depth_enable 0",
     "outlettype": [
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      340,
      330,
      260,
      22
     ],
     "text": "jit.gl.syphonserver thegrid @servername \"The Grid\"",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "jit.fpsgui",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      620,
      330,
      80,
      36
     ],
     "outlettype": [
      "",
      ""
     ],
     "mode": 0,
     "presentation": 1,
     "presentation_rect": [
      20,
      60,
      80,
      36
     ]
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      340,
      360,
      360,
      20
     ],
     "text": "OBS: fuente \"Syphon Client\" → servidor \"The Grid\" (Max)"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      620,
      300,
      200,
      20
     ],
     "text": "fps de la salida (meta: 30)"
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      720,
      300,
      300,
      20
     ],
     "text": "THE GRID · SALIDA",
     "fontface": 1,
     "presentation": 1,
     "presentation_rect": [
      20,
      20,
      300,
      20
     ]
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      720,
      320,
      300,
      20
     ],
     "text": "fps (meta: 30) · Syphon: \"The Grid\"",
     "presentation": 1,
     "presentation_rect": [
      110,
      68,
      300,
      20
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-15",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   }
  ]
 }
}