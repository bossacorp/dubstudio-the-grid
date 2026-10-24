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
   100,
   100,
   760,
   690
  ],
  "openinpresentation": 1,
  "default_fontsize": 12.0,
  "gridsize": [
   15.0,
   15.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      10,
      240,
      20
     ],
     "text": "THE GRID · OSC",
     "presentation": 1,
     "presentation_rect": [
      4,
      2,
      120,
      20
     ]
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      60,
      50,
      22
     ],
     "text": "midiin",
     "outlettype": [
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      95,
      55,
      22
     ],
     "text": "midiout",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      90,
      60,
      300,
      20
     ],
     "text": "el MIDI sigue pasando al instrumento"
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 8,
     "patching_rect": [
      20,
      140,
      80,
      22
     ],
     "text": "midiparse",
     "outlettype": [
      "",
      "",
      "",
      "int",
      "int",
      "",
      "int",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
      175,
      70,
      22
     ],
     "text": "unpack 0 0",
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      205,
      70,
      22
     ],
     "text": "stripnote",
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      235,
      70,
      22
     ],
     "text": "pack 0 0",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      200,
      175,
      90,
      15
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_enum": [
        "golpes",
        "escenas"
       ],
       "parameter_longname": "Modo notas",
       "parameter_shortname": "Notas",
       "parameter_type": 2,
       "parameter_mmax": 1
      }
     },
     "varname": "Modo notas",
     "presentation": 1,
     "presentation_rect": [
      4,
      24,
      70,
      15
     ]
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      300,
      172,
      300,
      20
     ],
     "text": "golpes: nota → /live/hit · escenas: nota → /live/scene (C1 = 1)",
     "presentation": 1,
     "presentation_rect": [
      78,
      22,
      90,
      30
     ]
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      200,
      205,
      40,
      22
     ],
     "text": "+ 1",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      270,
      60,
      22
     ],
     "text": "gate 2",
     "outlettype": [
      "",
      ""
     ]
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
      305,
      110,
      22
     ],
     "text": "prepend /live/hit",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      150,
      305,
      80,
      22
     ],
     "text": "unpack 0 0",
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      150,
      335,
      50,
      22
     ],
     "text": "- 35",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      150,
      365,
      120,
      22
     ],
     "text": "prepend /live/scene",
     "outlettype": [
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
      300,
      140,
      110,
      22
     ],
     "text": "prepend /live/cc",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      440,
      60,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Perilla 1",
       "parameter_shortname": "P1",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_unitstyle": 1
      }
     },
     "varname": "Perilla 1",
     "presentation": 1,
     "presentation_rect": [
      176,
      4,
      44,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      440,
      120,
      110,
      22
     ],
     "text": "prepend /live/knob/1",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      500,
      60,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Perilla 2",
       "parameter_shortname": "P2",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_unitstyle": 1
      }
     },
     "varname": "Perilla 2",
     "presentation": 1,
     "presentation_rect": [
      222,
      4,
      44,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      500,
      120,
      110,
      22
     ],
     "text": "prepend /live/knob/2",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      560,
      60,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Perilla 3",
       "parameter_shortname": "P3",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_unitstyle": 1
      }
     },
     "varname": "Perilla 3",
     "presentation": 1,
     "presentation_rect": [
      268,
      4,
      44,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      560,
      120,
      110,
      22
     ],
     "text": "prepend /live/knob/3",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      620,
      60,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Perilla 4",
       "parameter_shortname": "P4",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1.0,
       "parameter_unitstyle": 1
      }
     },
     "varname": "Perilla 4",
     "presentation": 1,
     "presentation_rect": [
      314,
      4,
      44,
      48
     ]
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      620,
      120,
      110,
      22
     ],
     "text": "prepend /live/knob/4",
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      410,
      520,
      20
     ],
     "text": "Cambia la IP por la de la MAC MINI (doble clic en el objeto, edita y Enter):"
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      435,
      170,
      22
     ],
     "text": "udpsend 192.168.1.20 9200",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      220,
      435,
      90,
      22
     ],
     "text": "print GridOSC",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "live.toggle",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      490,
      20,
      20
     ],
     "outlettype": [
      "int"
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Enviar compás",
       "parameter_shortname": "Compás",
       "parameter_type": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1,
       "parameter_initial_enable": 1,
       "parameter_initial": [
        1
       ]
      }
     },
     "varname": "Enviar compás",
     "presentation": 1,
     "presentation_rect": [
      4,
      44,
      16,
      16
     ]
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      45,
      490,
      300,
      20
     ],
     "text": "enviar compás a The Grid (Ableton manda el tempo)",
     "presentation": 1,
     "presentation_rect": [
      22,
      42,
      80,
      30
     ]
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      520,
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
     "id": "obj-32",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 9,
     "patching_rect": [
      20,
      550,
      80,
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
     "id": "obj-33",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      580,
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
     "id": "obj-34",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      610,
      520,
      20
     ],
     "text": "Cambia la IP por la de la LINUX MINT (puerto 9100 = OSC_IN_PORT del Grid Server):"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      635,
      170,
      22
     ],
     "text": "udpsend 192.168.1.10 9100",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      220,
      635,
      90,
      22
     ],
     "text": "print GridOSC",
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      300,
      490,
      100,
      22
     ],
     "text": "live.thisdevice",
     "outlettype": [
      "bang",
      "int",
      "int"
     ]
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-3",
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
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      0
     ],
     "destination": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      1
     ],
     "destination": [
      "obj-7",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      1
     ],
     "destination": [
      "obj-8",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-12",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      1
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
      "obj-14",
      0
     ],
     "destination": [
      "obj-15",
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
      "obj-5",
      2
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
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
      "obj-20",
      0
     ],
     "destination": [
      "obj-21",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
      0
     ],
     "destination": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
     ],
     "destination": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-27",
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
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-19",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-25",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-28",
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
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      0
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-32",
      0
     ],
     "destination": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
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
      "obj-37",
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
      "obj-37",
      0
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   }
  ],
  "devicewidth": 380.0
 }
}