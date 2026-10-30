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
   80,
   1420,
   540
  ],
  "openinpresentation": 0,
  "default_fontsize": 12.0,
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-c1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      15,
      900,
      20
     ],
     "text": "1) ENTRADA: el Grid Server manda el contrato OSC aquí. Abre SOLO este patch con udpreceive 9000 (uno por Max)."
    }
   },
   {
    "box": {
     "id": "obj-c1b",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      35,
      900,
      20
     ],
     "text": "En tus patches de color usa [r grid.visual.1] ... [r grid.vote.3] (reciben 1) y [r grid.lock.visual|fx|vote] (reciben 1 o 0)."
    }
   },
   {
    "box": {
     "id": "obj-rx",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      65,
      110,
      22
     ],
     "text": "udpreceive 9000",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-prx",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      160,
      65,
      70,
      22
     ],
     "text": "print GRID"
    }
   },
   {
    "box": {
     "id": "obj-rt",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 13,
     "patching_rect": [
      20,
      105,
      1180,
      22
     ],
     "text": "route /grid/visual/1 /grid/visual/2 /grid/visual/3 /grid/fx/1 /grid/fx/2 /grid/fx/3 /grid/vote/1 /grid/vote/2 /grid/vote/3 /grid/lock/visual /grid/lock/fx /grid/lock/vote",
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-s0",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      150,
      94,
      22
     ],
     "text": "s grid.visual.1"
    }
   },
   {
    "box": {
     "id": "obj-s1",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      118,
      150,
      94,
      22
     ],
     "text": "s grid.visual.2"
    }
   },
   {
    "box": {
     "id": "obj-s2",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      216,
      150,
      94,
      22
     ],
     "text": "s grid.visual.3"
    }
   },
   {
    "box": {
     "id": "obj-s3",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      314,
      150,
      94,
      22
     ],
     "text": "s grid.fx.1"
    }
   },
   {
    "box": {
     "id": "obj-s4",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      412,
      150,
      94,
      22
     ],
     "text": "s grid.fx.2"
    }
   },
   {
    "box": {
     "id": "obj-s5",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      510,
      150,
      94,
      22
     ],
     "text": "s grid.fx.3"
    }
   },
   {
    "box": {
     "id": "obj-s6",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      608,
      150,
      94,
      22
     ],
     "text": "s grid.vote.1"
    }
   },
   {
    "box": {
     "id": "obj-s7",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      706,
      150,
      94,
      22
     ],
     "text": "s grid.vote.2"
    }
   },
   {
    "box": {
     "id": "obj-s8",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      804,
      150,
      94,
      22
     ],
     "text": "s grid.vote.3"
    }
   },
   {
    "box": {
     "id": "obj-s9",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      902,
      150,
      94,
      22
     ],
     "text": "s grid.lock.visual"
    }
   },
   {
    "box": {
     "id": "obj-s10",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1000,
      150,
      94,
      22
     ],
     "text": "s grid.lock.fx"
    }
   },
   {
    "box": {
     "id": "obj-s11",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1098,
      150,
      94,
      22
     ],
     "text": "s grid.lock.vote"
    }
   },
   {
    "box": {
     "id": "obj-unk",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1196,
      150,
      120,
      22
     ],
     "text": "print GRID-DESCONOCIDO"
    }
   },
   {
    "box": {
     "id": "obj-c2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      205,
      600,
      20
     ],
     "text": "2) COMPÁS: Max marca el compás y lo manda al Grid Server (/show/bar <n>)"
    }
   },
   {
    "box": {
     "id": "obj-c3",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      225,
      600,
      20
     ],
     "text": "Cambia la IP del mensaje 'host' por la de la Linux Mint y dale clic una vez"
    }
   },
   {
    "box": {
     "id": "obj-lm",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      260,
      255,
      80,
      22
     ],
     "text": "loadmess 120",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-bpm",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      260,
      285,
      60,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-tmp",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      260,
      315,
      65,
      22
     ],
     "text": "tempo $1",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-ctb",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      325,
      285,
      120,
      20
     ],
     "text": "BPM"
    }
   },
   {
    "box": {
     "id": "obj-tog",
     "maxclass": "toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      255,
      24,
      24
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "obj-ctg",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      50,
      257,
      180,
      20
     ],
     "text": "play / stop"
    }
   },
   {
    "box": {
     "id": "obj-met",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      315,
      140,
      22
     ],
     "text": "metro 1n @quantize 1n",
     "outlettype": [
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-tr",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 9,
     "patching_rect": [
      20,
      355,
      260,
      22
     ],
     "text": "transport",
     "outlettype": [
      "int",
      "int",
      "float",
      "float",
      "float",
      "",
      "int",
      "float",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-pre",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      395,
      110,
      22
     ],
     "text": "prepend /show/bar",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-host",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      395,
      150,
      22
     ],
     "text": "host 192.168.1.10",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-tx",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      435,
      170,
      22
     ],
     "text": "udpsend 192.168.1.10 9100"
    }
   },
   {
    "box": {
     "id": "obj-pbar",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      475,
      70,
      22
     ],
     "text": "print BAR"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-rx",
      0
     ],
     "destination": [
      "obj-prx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rx",
      0
     ],
     "destination": [
      "obj-rt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      0
     ],
     "destination": [
      "obj-s0",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      1
     ],
     "destination": [
      "obj-s1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      2
     ],
     "destination": [
      "obj-s2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      3
     ],
     "destination": [
      "obj-s3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      4
     ],
     "destination": [
      "obj-s4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      5
     ],
     "destination": [
      "obj-s5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      6
     ],
     "destination": [
      "obj-s6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      7
     ],
     "destination": [
      "obj-s7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      8
     ],
     "destination": [
      "obj-s8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      9
     ],
     "destination": [
      "obj-s9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      10
     ],
     "destination": [
      "obj-s10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      11
     ],
     "destination": [
      "obj-s11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-rt",
      12
     ],
     "destination": [
      "obj-unk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-lm",
      0
     ],
     "destination": [
      "obj-bpm",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-bpm",
      0
     ],
     "destination": [
      "obj-tmp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-tmp",
      0
     ],
     "destination": [
      "obj-tr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-tog",
      0
     ],
     "destination": [
      "obj-met",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-tog",
      0
     ],
     "destination": [
      "obj-tr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-met",
      0
     ],
     "destination": [
      "obj-tr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-tr",
      0
     ],
     "destination": [
      "obj-pre",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-pre",
      0
     ],
     "destination": [
      "obj-tx",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-pre",
      0
     ],
     "destination": [
      "obj-pbar",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-host",
      0
     ],
     "destination": [
      "obj-tx",
      0
     ]
    }
   }
  ]
 }
}