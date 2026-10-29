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
		"openrect": [
			337.0,
			87.0,
			1487.439208984375,
			779.0
		],
		"bglocked": 0,
		"openinpresentation": 1,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"lefttoolbarpinned": 0,
		"toptoolbarpinned": 0,
		"righttoolbarpinned": 0,
		"bottomtoolbarpinned": 0,
		"toolbars_unpinned_last_save": 0,
		"tallnewobj": 0,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 1487.439208984375,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"annotation": "## A video delay line ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-1",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.delayr.maxpat",
					"numinlets": 4,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						464.0,
						580.6666839718819,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "delayr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						210.0,
						121.0,
						188.0,
						130.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.607843137254902,
						0.031372549019608,
						0.031372549019608,
						1.0
					],
					"id": "obj-16",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						786.6666901111603,
						549.3333497047424,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[8]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[3]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[5]",
					"presentation": 1,
					"presentation_rect": [
						410.0,
						157.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.529411764705882,
						0.545098039215686,
						0.156862745098039,
						1.0
					],
					"id": "obj-12",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						392.66667836904526,
						549.3333497047424,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[7]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[3]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[4]",
					"presentation": 1,
					"presentation_rect": [
						410.0,
						121.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.211764705882353,
						0.474509803921569,
						0.141176470588235,
						1.0
					],
					"id": "obj-7",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						366.00001090765,
						736.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[6]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[3]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[3]",
					"presentation": 1,
					"presentation_rect": [
						410.0,
						193.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"format": 6,
					"id": "obj-27",
					"maxclass": "flonum",
					"maximum": 1.0,
					"minimum": 0.0,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						46.66666805744171,
						754.666689157486,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.211764705882353,
						0.474509803921569,
						0.141176470588235,
						1.0
					],
					"floatoutput": 1,
					"id": "obj-28",
					"maxclass": "dial",
					"mult": 0.01,
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						38.00000113248825,
						706.0000210404396,
						40.0,
						40.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "dial[1]",
							"parameter_mmax": 100.0,
							"parameter_modmode": 3,
							"parameter_shortname": "dial",
							"parameter_type": 0
						}
					},
					"size": 100.0,
					"varname": "dial[1]",
					"presentation": 1,
					"presentation_rect": [
						190.0,
						303.0,
						40.0,
						40.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.529411764705882,
						0.545098039215686,
						0.156862745098039,
						1.0
					],
					"id": "obj-23",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						69.0,
						216.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[4]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[4]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[1]",
					"presentation": 1,
					"presentation_rect": [
						10,
						58,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Turn a video into distributed dust ##",
					"bgcolor": [
						0.529411764705882,
						0.545098039215686,
						0.156862745098039,
						1.0
					],
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-9",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.foggr.maxpat",
					"numinlets": 4,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						109.0,
						412.0,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "foggr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						121.0,
						188.0,
						130.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Smoothly crossfade between two videos and composite them ##",
					"bgcolor": [
						0.211764705882353,
						0.474509803921569,
						0.141176470588235,
						1.0
					],
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-11",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.mixfadr.maxpat",
					"numinlets": 4,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						122.00000363588333,
						706.0000210404396,
						168.0,
						130.0
					],
					"varname": "mixfadr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						293.0,
						168.0,
						130.0
					]
				}
			},
			{
				"box": {
					"bgcolor": [
						0.529411764705882,
						0.545098039215686,
						0.156862745098039,
						1.0
					],
					"clipheight": 31.0,
					"data": {
						"clips": [
							{
								"absolutepath": "yellowBobVideo.mov",
								"filename": "yellowBobVideo.mov",
								"filekind": "moviefile",
								"id": "u197007374",
								"loop": 0,
								"content_state": {}
							}
						]
					},
					"drawto": "",
					"id": "obj-4",
					"loop": 3,
					"maxclass": "jit.playlist",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"jit_matrix",
						"",
						"dictionary"
					],
					"output_texture": 0,
					"parameter_enable": 0,
					"patching_rect": [
						98.0,
						289.0,
						188.0,
						31.0
					],
					"presentation": 1,
					"presentation_rect": [
						50,
						56,
						188.0,
						31.0
					]
				}
			},
			{
				"box": {
					"annotation": "## VIZZIE video projector interface ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-19",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.projectr.maxpat",
					"numinlets": 4,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						""
					],
					"patching_rect": [
						122.00000363588333,
						852.6666920781136,
						168.0,
						108.0
					],
					"prototypename": "pixl",
					"varname": "yellowProjectr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						465.0,
						168.0,
						108.0
					]
				}
			},
			{
				"box": {
					"id": "obj-3001",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1310.6666901111603,
						40,
						140,
						22
					],
					"varname": "thegrid_3001",
					"text": "print GRID-AMARILLO"
				}
			},
			{
				"box": {
					"id": "obj-3002",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						40,
						400,
						20
					],
					"varname": "thegrid_3002",
					"text": "THE GRID · AMARILLO — abre también grid-router.maxpat"
				}
			},
			{
				"box": {
					"id": "obj-3003",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						70,
						130,
						22
					],
					"varname": "thegrid_3003",
					"text": "r grid.lock.fx",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3004",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						100,
						40,
						22
					],
					"varname": "thegrid_3004",
					"text": "== 0",
					"outlettype": [
						"int"
					]
				}
			},
			{
				"box": {
					"id": "obj-3005",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1030.6666901111603,
						70,
						120,
						22
					],
					"varname": "thegrid_3005",
					"text": "prepend bloqueo",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3006",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1160.6666901111603,
						70,
						300,
						20
					],
					"varname": "thegrid_3006",
					"text": "bloqueo 1 → pausa el video · 0 → lo reanuda"
				}
			},
			{
				"box": {
					"id": "obj-3007",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						140,
						60,
						22
					],
					"varname": "thegrid_3007",
					"text": "loadbang",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3008",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						170,
						80,
						22
					],
					"varname": "thegrid_3008",
					"text": "delay 1000",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3009",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						890.6666901111603,
						200,
						60,
						22
					],
					"varname": "thegrid_3009",
					"text": "t b b",
					"outlettype": [
						"bang",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3010",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						230,
						30,
						22
					],
					"varname": "thegrid_3010",
					"text": "1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3011",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						980.6666901111603,
						170,
						400,
						20
					],
					"varname": "thegrid_3011",
					"text": "al abrir: play del video (1 s después)"
				}
			},
			{
				"box": {
					"id": "obj-3012",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						950.6666901111603,
						230,
						30,
						22
					],
					"varname": "thegrid_3012",
					"text": "1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3013",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						950.6666901111603,
						255,
						300,
						20
					],
					"varname": "thegrid_3013",
					"text": "y toggle[5] = 1"
				}
			},
			{
				"box": {
					"id": "obj-3014",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						300,
						640,
						20
					],
					"varname": "thegrid_3014",
					"text": "TEMPLATES · AMARILLO — \"entra y sale\" (grid.hold / grid.strobe → on/off del módulo) y \"golpe y regreso\" (grid.env → crossfade / tono)"
				}
			},
			{
				"box": {
					"id": "obj-3015",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						318,
						640,
						20
					],
					"varname": "thegrid_3015",
					"text": "Ajusta compases o pico editando el texto del objeto. La intensidad de cada efecto se define en el panel de su módulo (en reposo está apagado)."
				}
			},
			{
				"box": {
					"id": "obj-3016",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						350,
						110,
						22
					],
					"varname": "thegrid_3016",
					"text": "r grid.fx.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3017",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.6666901111603,
						350,
						120,
						22
					],
					"varname": "thegrid_3017",
					"text": "prepend celda1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3018",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						376,
						130,
						22
					],
					"varname": "thegrid_3018",
					"text": "grid.env 1. 0. 2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3019",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1150.6666901111603,
						376,
						560,
						20
					],
					"varname": "thegrid_3019",
					"text": "celda 1 · Eco dub: crossfade a B (pasa por DELAYR) y regresa en 2 compases  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3020",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						405,
						110,
						22
					],
					"varname": "thegrid_3020",
					"text": "r grid.fx.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3021",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.6666901111603,
						405,
						120,
						22
					],
					"varname": "thegrid_3021",
					"text": "prepend celda2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3022",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						431,
						130,
						22
					],
					"varname": "thegrid_3022",
					"text": "grid.hold 2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3023",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1150.6666901111603,
						431,
						560,
						20
					],
					"varname": "thegrid_3023",
					"text": "celda 2 · Reverb de imagen: FOGGR entra 2 compases  →  toggle[4]"
				}
			},
			{
				"box": {
					"id": "obj-3024",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						460,
						110,
						22
					],
					"varname": "thegrid_3024",
					"text": "r grid.fx.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3025",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.6666901111603,
						460,
						120,
						22
					],
					"varname": "thegrid_3025",
					"text": "prepend celda3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3026",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						486,
						130,
						22
					],
					"varname": "thegrid_3026",
					"text": "grid.strobe 8 1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3027",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1150.6666901111603,
						486,
						560,
						20
					],
					"varname": "thegrid_3027",
					"text": "celda 3 · Sirena: crossfade A/B en corcheas durante 1 compás  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3028",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						515,
						110,
						22
					],
					"varname": "thegrid_3028",
					"text": "r live.flash",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3029",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.6666901111603,
						515,
						120,
						22
					],
					"varname": "thegrid_3029",
					"text": "prepend destello",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3030",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						541,
						130,
						22
					],
					"varname": "thegrid_3030",
					"text": "grid.env 1. 0. 0.25",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3031",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1150.6666901111603,
						541,
						560,
						20
					],
					"varname": "thegrid_3031",
					"text": "tarola · Flash: pulso del crossfade a B, ¼ de compás  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3032",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						590,
						640,
						20
					],
					"varname": "thegrid_3032",
					"text": "ABLETON · AMARILLO — abre también ableton-bridge.maxpat (el flash de tarola está en TEMPLATES)"
				}
			},
			{
				"box": {
					"id": "obj-3033",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						620,
						100,
						22
					],
					"varname": "thegrid_3033",
					"text": "r live.knob.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3034",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.6666901111603,
						620,
						400,
						20
					],
					"varname": "thegrid_3034",
					"text": "perilla 1 (0..1) → crossfade A↔B"
				}
			},
			{
				"box": {
					"id": "obj-3035",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						652,
						100,
						22
					],
					"varname": "thegrid_3035",
					"text": "r live.knob.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3036",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						890.6666901111603,
						680,
						60,
						22
					],
					"varname": "thegrid_3036",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3037",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						652,
						100,
						22
					],
					"varname": "thegrid_3037",
					"text": "r live.knob.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3038",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1010.6666901111603,
						680,
						60,
						22
					],
					"varname": "thegrid_3038",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3039",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1130.6666901111603,
						652,
						100,
						22
					],
					"varname": "thegrid_3039",
					"text": "r live.knob.4",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3040",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1130.6666901111603,
						680,
						60,
						22
					],
					"varname": "thegrid_3040",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3041",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						706,
						640,
						20
					],
					"varname": "thegrid_3041",
					"text": "perillas 2-4 (0..1): conecta cada número al parámetro de Vizzie que quieras (pasa el mouse por la entrada para ver su nombre)"
				}
			},
			{
				"box": {
					"id": "obj-3042",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						740,
						90,
						22
					],
					"varname": "thegrid_3042",
					"text": "r live.scene",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3043",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 5,
					"patching_rect": [
						890.6666901111603,
						770,
						90,
						22
					],
					"varname": "thegrid_3043",
					"text": "sel 1 2 3 4",
					"outlettype": [
						"bang",
						"bang",
						"bang",
						"bang",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3044",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						890.6666901111603,
						830,
						110,
						22
					],
					"varname": "thegrid_3044",
					"text": "unpack 0 0 0.",
					"outlettype": [
						"int",
						"int",
						"float"
					]
				}
			},
			{
				"box": {
					"id": "obj-3045",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.6666901111603,
						740,
						120,
						22
					],
					"varname": "thegrid_3045",
					"text": "prepend escena",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3046",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						800,
						60,
						22
					],
					"varname": "thegrid_3046",
					"text": "1 1 0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3047",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						770,
						340,
						20
					],
					"varname": "thegrid_3047",
					"text": "escena 1: niebla (A)"
				}
			},
			{
				"box": {
					"id": "obj-3048",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						960.6666901111603,
						800,
						60,
						22
					],
					"varname": "thegrid_3048",
					"text": "0 1 1.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3049",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						788,
						340,
						20
					],
					"varname": "thegrid_3049",
					"text": "escena 2: eco (B)"
				}
			},
			{
				"box": {
					"id": "obj-3050",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1030.6666901111603,
						800,
						60,
						22
					],
					"varname": "thegrid_3050",
					"text": "1 1 0.5",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3051",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						806,
						340,
						20
					],
					"varname": "thegrid_3051",
					"text": "escena 3: niebla + eco"
				}
			},
			{
				"box": {
					"id": "obj-3052",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1100.6666901111603,
						800,
						60,
						22
					],
					"varname": "thegrid_3052",
					"text": "0 1 0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3053",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						824,
						340,
						20
					],
					"varname": "thegrid_3053",
					"text": "escena 4: limpio"
				}
			},
			{
				"box": {
					"id": "obj-3054",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1560,
						500,
						20
					],
					"varname": "thegrid_3054",
					"text": "AMARILLO · bob rebel music — The Grid (fx)",
					"presentation": 1,
					"presentation_rect": [
						10,
						10,
						500,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3055",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1580,
						60,
						20
					],
					"varname": "thegrid_3055",
					"text": "play",
					"presentation": 1,
					"presentation_rect": [
						10,
						38,
						60,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3056",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1600,
						500,
						20
					],
					"varname": "thegrid_3056",
					"text": "BASE — cadena A y cadena B (entran al MIXFADR)",
					"presentation": 1,
					"presentation_rect": [
						10,
						99.0,
						500,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3057",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1620,
						170,
						20
					],
					"varname": "thegrid_3057",
					"text": "niebla (FOGGR) on/off",
					"presentation": 1,
					"presentation_rect": [
						440.0,
						123.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3058",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1640,
						170,
						20
					],
					"varname": "thegrid_3058",
					"text": "eco (DELAYR) on/off",
					"presentation": 1,
					"presentation_rect": [
						440.0,
						159.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3059",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1660,
						170,
						20
					],
					"varname": "thegrid_3059",
					"text": "mezcla on/off",
					"presentation": 1,
					"presentation_rect": [
						440.0,
						195.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3060",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1680,
						400,
						20
					],
					"varname": "thegrid_3060",
					"text": "MEZCLA",
					"presentation": 1,
					"presentation_rect": [
						10,
						271.0,
						400,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3061",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1700,
						140,
						20
					],
					"varname": "thegrid_3061",
					"text": "crossfade A↔B",
					"presentation": 1,
					"presentation_rect": [
						238.0,
						311.0,
						140,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3062",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						1720,
						400,
						20
					],
					"varname": "thegrid_3062",
					"text": "SALIDA",
					"presentation": 1,
					"presentation_rect": [
						10,
						443.0,
						400,
						20
					],
					"fontface": 1
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-11",
						1
					],
					"source": [
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-19",
						0
					],
					"source": [
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-9",
						3
					],
					"source": [
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-1",
						3
					],
					"source": [
						"obj-16",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-4",
						0
					],
					"source": [
						"obj-23",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-11",
						2
					],
					"source": [
						"obj-27",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-27",
						0
					],
					"source": [
						"obj-28",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-9",
						0
					],
					"source": [
						"obj-4",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-11",
						3
					],
					"source": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-1",
						0
					],
					"order": 1,
					"source": [
						"obj-9",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-11",
						0
					],
					"order": 0,
					"source": [
						"obj-9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3003",
						0
					],
					"destination": [
						"obj-3004",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3004",
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
						"obj-3003",
						0
					],
					"destination": [
						"obj-3005",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3005",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3007",
						0
					],
					"destination": [
						"obj-3008",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3008",
						0
					],
					"destination": [
						"obj-3009",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3009",
						0
					],
					"destination": [
						"obj-3010",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3010",
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
						"obj-3009",
						1
					],
					"destination": [
						"obj-3012",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3012",
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
						"obj-3016",
						0
					],
					"destination": [
						"obj-3017",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3017",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3016",
						0
					],
					"destination": [
						"obj-3018",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3018",
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
						"obj-3020",
						0
					],
					"destination": [
						"obj-3021",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3021",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3020",
						0
					],
					"destination": [
						"obj-3022",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3022",
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
						"obj-3024",
						0
					],
					"destination": [
						"obj-3025",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3025",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3024",
						0
					],
					"destination": [
						"obj-3026",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3026",
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
						"obj-3028",
						0
					],
					"destination": [
						"obj-3029",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3029",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3028",
						0
					],
					"destination": [
						"obj-3030",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3030",
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
						"obj-3033",
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
						"obj-3035",
						0
					],
					"destination": [
						"obj-3036",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3037",
						0
					],
					"destination": [
						"obj-3038",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3039",
						0
					],
					"destination": [
						"obj-3040",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3042",
						0
					],
					"destination": [
						"obj-3043",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3042",
						0
					],
					"destination": [
						"obj-3045",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3045",
						0
					],
					"destination": [
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3043",
						0
					],
					"destination": [
						"obj-3046",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3046",
						0
					],
					"destination": [
						"obj-3044",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3043",
						1
					],
					"destination": [
						"obj-3048",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3048",
						0
					],
					"destination": [
						"obj-3044",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3043",
						2
					],
					"destination": [
						"obj-3050",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3050",
						0
					],
					"destination": [
						"obj-3044",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3043",
						3
					],
					"destination": [
						"obj-3052",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3052",
						0
					],
					"destination": [
						"obj-3044",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3044",
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
						"obj-3044",
						1
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
						"obj-3044",
						2
					],
					"destination": [
						"obj-27",
						0
					]
				}
			}
		],
		"parameters": {
			"obj-11::obj-17::obj-23": [
				"gswitch2[10]",
				"gswitch2",
				0
			],
			"obj-11::obj-21": [
				"range[19]",
				"range",
				0
			],
			"obj-11::obj-24": [
				"pictctrl[98]",
				"pictctrl[1]",
				0
			],
			"obj-11::obj-26": [
				"Crossfade",
				"Crossfade",
				0
			],
			"obj-11::obj-39": [
				"Operator mode",
				"Operator mode",
				0
			],
			"obj-11::obj-51": [
				"pictctrl[47]",
				"pictctrl[1]",
				0
			],
			"obj-11::obj-56::obj-23": [
				"gswitch2[9]",
				"gswitch2",
				0
			],
			"obj-12": [
				"toggle[7]",
				"toggle[3]",
				0
			],
			"obj-16": [
				"toggle[8]",
				"toggle[3]",
				0
			],
			"obj-19::obj-12": [
				"Fullscreen",
				"Fullscreen",
				0
			],
			"obj-19::obj-16": [
				"Toggle display",
				"Toggle display",
				0
			],
			"obj-19::obj-1::obj-23": [
				"gswitch2[2]",
				"gswitch2",
				0
			],
			"obj-19::obj-2": [
				"pictctrl[2]",
				"pictctrl[1]",
				0
			],
			"obj-19::obj-3": [
				"toggle",
				"toggle",
				0
			],
			"obj-19::obj-41": [
				"pictctrl[7]",
				"pictctrl[1]",
				0
			],
			"obj-19::obj-50": [
				"pictctrl[1]",
				"pictctrl[1]",
				0
			],
			"obj-19::obj-6": [
				"live.toggle[1]",
				"live.toggle",
				0
			],
			"obj-1::obj-10": [
				"Feedback",
				"Feedback",
				0
			],
			"obj-1::obj-20": [
				"pictctrl[97]",
				"pictctrl[1]",
				0
			],
			"obj-1::obj-24": [
				"Crossfade[2]",
				"Crossfade",
				0
			],
			"obj-1::obj-48": [
				"pictctrl[86]",
				"pictctrl[2]",
				0
			],
			"obj-1::obj-53": [
				"pictctrl",
				"pictctrl",
				0
			],
			"obj-1::obj-56::obj-23": [
				"gswitch2[11]",
				"gswitch2",
				0
			],
			"obj-1::obj-7": [
				"range[4]",
				"range",
				0
			],
			"obj-1::obj-9": [
				"Delay",
				"Delay",
				0
			],
			"obj-23": [
				"toggle[4]",
				"toggle[4]",
				0
			],
			"obj-28": [
				"dial[1]",
				"dial",
				0
			],
			"obj-7": [
				"toggle[6]",
				"toggle[3]",
				0
			],
			"obj-9::obj-3": [
				"range[6]",
				"range",
				0
			],
			"obj-9::obj-36": [
				"Probability",
				"Probability",
				0
			],
			"obj-9::obj-37": [
				"X range",
				"X range",
				0
			],
			"obj-9::obj-46": [
				"pictctrl[30]",
				"pictctrl[1]",
				0
			],
			"obj-9::obj-47": [
				"pictctrl[35]",
				"pictctrl[1]",
				0
			],
			"obj-9::obj-48": [
				"pictctrl[20]",
				"pictctrl[1]",
				0
			],
			"obj-9::obj-50": [
				"Y range",
				"Y range",
				0
			],
			"obj-9::obj-56::obj-23": [
				"gswitch2[15]",
				"gswitch2",
				0
			],
			"parameterbanks": {},
			"parameter_overrides": {
				"obj-1::obj-20": {
					"parameter_longname": "pictctrl[97]"
				},
				"obj-1::obj-24": {
					"parameter_longname": "Crossfade[2]"
				},
				"obj-1::obj-48": {
					"parameter_longname": "pictctrl[86]"
				},
				"obj-9::obj-46": {
					"parameter_longname": "pictctrl[30]"
				},
				"obj-9::obj-47": {
					"parameter_longname": "pictctrl[35]"
				},
				"obj-9::obj-48": {
					"parameter_longname": "pictctrl[20]"
				}
			},
			"inherited_shortname": 1
		},
		"parameter_map": {
			"midi": {
				"Mix 1": {
					"srcname": "1.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Mix 2": {
					"srcname": "2.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Mix 3": {
					"srcname": "3.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Mix 4": {
					"srcname": "4.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"button": {
					"srcname": "40.note.10.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"button[1]": {
					"srcname": "48.note.10.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"Tint mode": {
					"srcname": "38.note.10.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"Interpolation": {
					"srcname": "46.note.10.chan.midi",
					"min": 0.0,
					"max": 15.0,
					"flags": 3
				},
				"Bound": {
					"srcname": "44.note.10.chan.midi",
					"min": 0.0,
					"max": 2.0,
					"flags": 3
				},
				"Playback controls": {
					"srcname": "43.note.10.chan.midi",
					"min": 0.0,
					"max": 2.0,
					"flags": 3
				},
				"toggle[3]": {
					"srcname": "1.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"toggle[6]": {
					"srcname": "3.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"Horizontal": {
					"srcname": "20.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Vertical": {
					"srcname": "21.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Interp mode": {
					"srcname": "22.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 3.0,
					"flags": 2
				},
				"dial[1]": {
					"srcname": "16.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"toggle[4]": {
					"srcname": "7.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"toggle[7]": {
					"srcname": "9.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"dial": {
					"srcname": "24.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Crossfade[1]": {
					"srcname": "27.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Probability": {
					"srcname": "28.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"X range": {
					"srcname": "29.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Y range": {
					"srcname": "30.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"toggle[5]": {
					"srcname": "13.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"toggle[8]": {
					"srcname": "15.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"dial[2]": {
					"srcname": "46.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 100.0,
					"flags": 2
				},
				"Crossfade[2]": {
					"srcname": "49.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Horizontal[1]": {
					"srcname": "50.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Scale": {
					"srcname": "52.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"toggle[9]": {
					"srcname": "19.note.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 3
				},
				"Rate": {
					"srcname": "57.ctrl.0.chan.midi",
					"min": 5.0,
					"max": 5000.0,
					"flags": 2
				},
				"Vertical[1]": {
					"srcname": "19.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				},
				"Crossfade": {
					"srcname": "23.ctrl.0.chan.midi",
					"min": 0.0,
					"max": 1.0,
					"flags": 2
				}
			}
		},
		"dependency_cache": [
			{
				"name": "data-handler-L.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "data-handler.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "exact_menu.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.env.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 2",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.strobe.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 2",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "jit.gl.textureset.js",
				"bootpath": "~/Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/javascript/render",
				"patcherrelativepath": "../../../../Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/javascript/render",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "sprinkle.genjit",
				"bootpath": "~/Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"patcherrelativepath": "../../../../Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"type": "gJIT",
				"implicit": 1
			},
			{
				"name": "video-handler.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vizzie-datatexconvert.js",
				"bootpath": "C74:/packages/Vizzie/code",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "vizzie-global.js",
				"bootpath": "C74:/packages/Vizzie/code",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "vz.delayr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.foggr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.mixfadr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.projectr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.randomizr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vzgl-context.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vzgl-disable.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vzgl-object.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vzgl-outputdim.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vzgl-routegl.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "xfade.genjit",
				"bootpath": "~/Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"patcherrelativepath": "../../../../Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"type": "gJIT",
				"implicit": 1
			},
			{
				"name": "yellowBobVideo.mov",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 2",
				"patcherrelativepath": ".",
				"type": "MooV",
				"implicit": 1
			}
		],
		"autosave": 0
	}
}