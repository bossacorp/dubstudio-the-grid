{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 5,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   100,
   100,
   520,
   470
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
      420,
      20
     ],
     "text": "1) TOQUES: el Grid Server manda /grid/<columna>/<celda> 1 a este puerto"
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
      45,
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
      20,
      85,
      70,
      22
     ],
     "text": "print GRID"
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
      135,
      460,
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
      160,
      460,
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
      190,
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
      220,
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
      250,
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
      220,
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
      190,
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
      192,
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
      250,
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
      290,
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
      330,
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
      330,
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
      370,
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
      410,
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