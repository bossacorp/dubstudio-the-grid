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
					"bgcolor": [
						0.607843137254902,
						0.031372549019608,
						0.031372549019608,
						1.0
					],
					"id": "obj-14",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						511.0,
						186.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[1]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[5]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[1]",
					"presentation": 1,
					"presentation_rect": [
						10,
						98.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"data": {
						"clips": [
							{
								"absolutepath": "Donitas5.mp4",
								"filename": "Donitas5.mp4",
								"filekind": "moviefile",
								"id": "u343006047",
								"loop": 1,
								"content_state": {
									"vol": 0,
									"loop": 1
								}
							}
						]
					},
					"drawto": "",
					"id": "obj-6",
					"loop": 1,
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
						507.0,
						266.0,
						150.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						50,
						96.0,
						150.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Kaleidoscope-like video image folding ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-17",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.kaleidr.maxpat",
					"numinlets": 5,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						607.0,
						542.0,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "kaleidr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						620.0,
						188.0,
						188.0,
						130.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Pixilate a video ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-1",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.pixl8r.maxpat",
					"numinlets": 3,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						637.0,
						377.0,
						128.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "pixl8r",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						480.0,
						188.0,
						128.0,
						130.0
					]
				}
			},
			{
				"box": {
					"data": {
						"clips": [
							{
								"absolutepath": "redBobVideo.mov",
								"filename": "redBobVideo.mov",
								"filekind": "moviefile",
								"id": "u828004931",
								"loop": 1,
								"content_state": {
									"loop": 1,
									"vol": 0
								}
							}
						]
					},
					"drawto": "",
					"id": "obj-31",
					"loop": 1,
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
						137.0,
						308.0,
						150.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						50,
						60,
						150.0,
						30.0
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
						820.0,
						188.0,
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
						820.0,
						224.0,
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
						370.0,
						40.0,
						40.0
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
					"id": "obj-24",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						141.0,
						235.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[5]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[5]",
							"parameter_type": 2
						}
					},
					"varname": "toggle[2]",
					"presentation": 1,
					"presentation_rect": [
						10,
						62,
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
						113.75438596491227,
						545.3333495855331,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "foggr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						280.0,
						188.0,
						188.0,
						130.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Create video \"meta images\"## ",
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
					"id": "obj-3",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.fractalizr.maxpat",
					"numinlets": 5,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						113.75438596491227,
						399.2127659574468,
						258.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "fractalizr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						188.0,
						258.0,
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
						360.0,
						168.0,
						130.0
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
						283.0,
						878.0,
						168.0,
						108.0
					],
					"prototypename": "pixl",
					"varname": "redProjectr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						542.0,
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
						1295.0,
						40,
						140,
						22
					],
					"varname": "thegrid_3001",
					"text": "print GRID-ROJO"
				}
			},
			{
				"box": {
					"id": "obj-3002",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						40,
						400,
						20
					],
					"varname": "thegrid_3002",
					"text": "THE GRID · ROJO — abre también grid-router.maxpat"
				}
			},
			{
				"box": {
					"id": "obj-3003",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						70,
						130,
						22
					],
					"varname": "thegrid_3003",
					"text": "r grid.lock.vote",
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
						875.0,
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
						1015.0,
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
						1145.0,
						70,
						300,
						20
					],
					"varname": "thegrid_3006",
					"text": "bloqueo 1 → pausa los videos · 0 → los reanuda"
				}
			},
			{
				"box": {
					"id": "obj-3007",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
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
						875.0,
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
						875.0,
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
						875.0,
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
						965.0,
						170,
						400,
						20
					],
					"varname": "thegrid_3011",
					"text": "al abrir: play de todos los videos (1 s después)"
				}
			},
			{
				"box": {
					"id": "obj-3012",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						935.0,
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
						935.0,
						255,
						300,
						20
					],
					"varname": "thegrid_3013",
					"text": "y toggle[4] = 1"
				}
			},
			{
				"box": {
					"id": "obj-3014",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						300,
						640,
						20
					],
					"varname": "thegrid_3014",
					"text": "TEMPLATES · ROJO — \"entra y sale\" (grid.hold / grid.strobe → on/off del módulo) y \"golpe y regreso\" (grid.env → crossfade / tono)"
				}
			},
			{
				"box": {
					"id": "obj-3015",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
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
						875.0,
						350,
						110,
						22
					],
					"varname": "thegrid_3016",
					"text": "r grid.vote.1",
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
						1345.0,
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
						995.0,
						376,
						130,
						22
					],
					"varname": "thegrid_3018",
					"text": "grid.env 0. 0.5 16",
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
						1135.0,
						376,
						560,
						20
					],
					"varname": "thegrid_3019",
					"text": "ganó 1 · Raíces: salta a A (fractal + niebla) y vuelve a la mezcla en 16 compases  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3020",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						405,
						110,
						22
					],
					"varname": "thegrid_3020",
					"text": "r grid.vote.2",
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
						1345.0,
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
						995.0,
						431,
						130,
						22
					],
					"varname": "thegrid_3022",
					"text": "grid.strobe 1 16",
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
						1135.0,
						431,
						560,
						20
					],
					"varname": "thegrid_3023",
					"text": "ganó 2 · Steppers: PIXL8R (en B) corta cada compás durante 16 compases  →  PIXL8R entrada 3 = on/off"
				}
			},
			{
				"box": {
					"id": "obj-3024",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						460,
						110,
						22
					],
					"varname": "thegrid_3024",
					"text": "r grid.vote.3",
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
						1345.0,
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
						995.0,
						486,
						130,
						22
					],
					"varname": "thegrid_3026",
					"text": "grid.hold 16",
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
						1135.0,
						486,
						560,
						20
					],
					"varname": "thegrid_3027",
					"text": "ganó 3 · Cósmico: KALEIDR (en B) 16 compases…  →  KALEIDR entrada 5 = on/off"
				}
			},
			{
				"box": {
					"id": "obj-3028",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						995.0,
						541,
						130,
						22
					],
					"varname": "thegrid_3028",
					"text": "grid.env 1. 0.5 16",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3029",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1135.0,
						541,
						560,
						20
					],
					"varname": "thegrid_3029",
					"text": "…con el crossfade en B, que regresa a la mezcla en 16 compases  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3030",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						570,
						110,
						22
					],
					"varname": "thegrid_3030",
					"text": "r live.flash",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3031",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1345.0,
						570,
						120,
						22
					],
					"varname": "thegrid_3031",
					"text": "prepend destello",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3032",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						995.0,
						596,
						130,
						22
					],
					"varname": "thegrid_3032",
					"text": "grid.env 0. 0.5 0.25",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3033",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1135.0,
						596,
						560,
						20
					],
					"varname": "thegrid_3033",
					"text": "tarola · Flash: pulso del crossfade a A, ¼ de compás  →  crossfade (número → mixfadr entrada 3)"
				}
			},
			{
				"box": {
					"id": "obj-3034",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						645,
						640,
						20
					],
					"varname": "thegrid_3034",
					"text": "ABLETON · ROJO — abre también ableton-bridge.maxpat (el flash de tarola está en TEMPLATES)"
				}
			},
			{
				"box": {
					"id": "obj-3035",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						675,
						100,
						22
					],
					"varname": "thegrid_3035",
					"text": "r live.knob.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3036",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						985.0,
						675,
						400,
						20
					],
					"varname": "thegrid_3036",
					"text": "perilla 1 (0..1) → crossfade A↔B"
				}
			},
			{
				"box": {
					"id": "obj-3037",
					"maxclass": "bpatcher",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						1205.0,
						675,
						210,
						54
					],
					"varname": "thegrid_3037",
					"outlettype": [
						""
					],
					"name": "grid.lfo.maxpat",
					"args": [
						16,
						0.2
					],
					"embed": 0,
					"offset": [
						0.0,
						0.0
					],
					"bgmode": 0,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						190.0,
						446.0,
						210,
						54
					]
				}
			},
			{
				"box": {
					"id": "obj-3038",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1205.0,
						745,
						70,
						22
					],
					"varname": "thegrid_xfade_in",
					"text": "pak 0. 0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3039",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1205.0,
						773,
						200,
						22
					],
					"varname": "thegrid_3039",
					"text": "expr 1. - abs(1. - ($f1 + $f2))",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3040",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 1,
					"patching_rect": [
						1205.0,
						801,
						70,
						22
					],
					"varname": "thegrid_3040",
					"text": "clip 0. 1.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3041",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1285.0,
						745,
						330,
						20
					],
					"varname": "thegrid_3041",
					"text": "crossfade = base + LFO (rebota en 1) → mixfadr"
				}
			},
			{
				"box": {
					"id": "obj-3042",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						707,
						100,
						22
					],
					"varname": "thegrid_3042",
					"text": "r live.knob.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3043",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						985.0,
						707,
						50,
						22
					],
					"varname": "thegrid_3043",
					"text": "* 0.5",
					"outlettype": [
						"float"
					]
				}
			},
			{
				"box": {
					"id": "obj-3044",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						733,
						320,
						20
					],
					"varname": "thegrid_3044",
					"text": "perilla 2 → profundidad del LFO (0..0.5) · inicial: 16 compases, 0.2"
				}
			},
			{
				"box": {
					"id": "obj-3045",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						765,
						100,
						22
					],
					"varname": "thegrid_3045",
					"text": "r live.knob.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3046",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						875.0,
						793,
						60,
						22
					],
					"varname": "thegrid_3046",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3047",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						995.0,
						765,
						100,
						22
					],
					"varname": "thegrid_3047",
					"text": "r live.knob.4",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3048",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						995.0,
						793,
						60,
						22
					],
					"varname": "thegrid_3048",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3049",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						819,
						640,
						20
					],
					"varname": "thegrid_3049",
					"text": "perillas 3-4 (0..1): conecta cada número al parámetro de Vizzie que quieras (pasa el mouse por la entrada para ver su nombre)"
				}
			},
			{
				"box": {
					"id": "obj-3050",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						855,
						90,
						22
					],
					"varname": "thegrid_3050",
					"text": "r live.scene",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3051",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 5,
					"patching_rect": [
						875.0,
						885,
						90,
						22
					],
					"varname": "thegrid_3051",
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
					"id": "obj-3052",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						875.0,
						945,
						110,
						22
					],
					"varname": "thegrid_3052",
					"text": "unpack 0 0.",
					"outlettype": [
						"int",
						"float"
					]
				}
			},
			{
				"box": {
					"id": "obj-3053",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1345.0,
						855,
						120,
						22
					],
					"varname": "thegrid_3053",
					"text": "prepend escena",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3054",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						875.0,
						915,
						60,
						22
					],
					"varname": "thegrid_3054",
					"text": "1 0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3055",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1175.0,
						885,
						340,
						20
					],
					"varname": "thegrid_3055",
					"text": "escena 1: original con fractal + niebla (A)"
				}
			},
			{
				"box": {
					"id": "obj-3056",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						945.0,
						915,
						60,
						22
					],
					"varname": "thegrid_3056",
					"text": "1 1.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3057",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1175.0,
						903,
						340,
						20
					],
					"varname": "thegrid_3057",
					"text": "escena 2: videos nuevos (B)"
				}
			},
			{
				"box": {
					"id": "obj-3058",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1015.0,
						915,
						60,
						22
					],
					"varname": "thegrid_3058",
					"text": "1 0.5",
					"outlettype": [
						""
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
						1175.0,
						921,
						340,
						20
					],
					"varname": "thegrid_3059",
					"text": "escena 3: mezcla A + B"
				}
			},
			{
				"box": {
					"id": "obj-3060",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1085.0,
						915,
						60,
						22
					],
					"varname": "thegrid_3060",
					"text": "0 0.5",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3061",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1175.0,
						939,
						340,
						20
					],
					"varname": "thegrid_3061",
					"text": "escena 4: mezcla, fractal apagado"
				}
			},
			{
				"box": {
					"id": "obj-3062",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1720,
						500,
						20
					],
					"varname": "thegrid_3062",
					"text": "ROJO · bob rebel music — The Grid (vote)",
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
					"id": "obj-3063",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1740,
						400,
						20
					],
					"varname": "thegrid_3063",
					"text": "VIDEOS (play)",
					"presentation": 1,
					"presentation_rect": [
						10,
						38,
						400,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3064",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1760,
						260,
						20
					],
					"varname": "thegrid_3064",
					"text": "video original (A)",
					"presentation": 1,
					"presentation_rect": [
						210.0,
						64,
						260,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3065",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1780,
						260,
						20
					],
					"varname": "thegrid_3065",
					"text": "video nuevo (B)",
					"presentation": 1,
					"presentation_rect": [
						210.0,
						100.0,
						260,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3066",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1800,
						500,
						20
					],
					"varname": "thegrid_3066",
					"text": "BASE — cadena A y cadena B (entran al MIXFADR principal)",
					"presentation": 1,
					"presentation_rect": [
						10,
						146.0,
						500,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3067",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1820,
						128.0,
						20
					],
					"varname": "thegrid_3067",
					"text": "ganó 2 · Steppers",
					"presentation": 1,
					"presentation_rect": [
						480.0,
						168.0,
						128.0,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3068",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1840,
						188.0,
						20
					],
					"varname": "thegrid_3068",
					"text": "ganó 3 · Cósmico",
					"presentation": 1,
					"presentation_rect": [
						620.0,
						168.0,
						188.0,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3069",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1860,
						170,
						20
					],
					"varname": "thegrid_3069",
					"text": "fractal + niebla on/off",
					"presentation": 1,
					"presentation_rect": [
						850.0,
						190.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3070",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1880,
						170,
						20
					],
					"varname": "thegrid_3070",
					"text": "mezcla on/off",
					"presentation": 1,
					"presentation_rect": [
						850.0,
						226.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3071",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1900,
						400,
						20
					],
					"varname": "thegrid_3071",
					"text": "MEZCLA PRINCIPAL",
					"presentation": 1,
					"presentation_rect": [
						10,
						338.0,
						400,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3072",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1920,
						140,
						20
					],
					"varname": "thegrid_3072",
					"text": "crossfade A↔B",
					"presentation": 1,
					"presentation_rect": [
						238.0,
						378.0,
						140,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3073",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1940,
						260,
						20
					],
					"varname": "thegrid_3073",
					"text": "vaivén del crossfade (perilla 2 = prof.)",
					"presentation": 1,
					"presentation_rect": [
						190.0,
						426.0,
						260,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3074",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						875.0,
						1960,
						400,
						20
					],
					"varname": "thegrid_3074",
					"text": "SALIDA",
					"presentation": 1,
					"presentation_rect": [
						10,
						520.0,
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
						"obj-17",
						0
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
						"obj-3",
						4
					],
					"order": 0,
					"source": [
						"obj-12",
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
					"order": 1,
					"source": [
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-6",
						0
					],
					"source": [
						"obj-14",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-11",
						1
					],
					"source": [
						"obj-17",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-31",
						0
					],
					"source": [
						"obj-24",
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
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-3",
						0
					],
					"source": [
						"obj-31",
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
					"source": [
						"obj-6",
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
						"obj-11",
						0
					],
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
						"obj-24",
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
						"obj-14",
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
						"obj-24",
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
						"obj-14",
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
						"obj-12",
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
						"obj-1",
						2
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
						"obj-17",
						4
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
						"obj-3028",
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
						"obj-27",
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
						"obj-3031",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3031",
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
						"obj-3030",
						0
					],
					"destination": [
						"obj-3032",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3032",
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
						"obj-27",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-27",
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
						"obj-3037",
						0
					],
					"destination": [
						"obj-3038",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3038",
						0
					],
					"destination": [
						"obj-3039",
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
						"obj-3040",
						0
					],
					"destination": [
						"obj-11",
						2
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
						"obj-3043",
						0
					],
					"destination": [
						"obj-3037",
						2
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
						"obj-3046",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3047",
						0
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
						"obj-3050",
						0
					],
					"destination": [
						"obj-3051",
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
						"obj-3053",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3053",
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
						"obj-3051",
						0
					],
					"destination": [
						"obj-3054",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3054",
						0
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
						"obj-3051",
						1
					],
					"destination": [
						"obj-3056",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3056",
						0
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
						"obj-3051",
						2
					],
					"destination": [
						"obj-3058",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3058",
						0
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
						"obj-3051",
						3
					],
					"destination": [
						"obj-3060",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3060",
						0
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
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3052",
						1
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
			"obj-14": [
				"toggle[1]",
				"toggle[5]",
				0
			],
			"obj-17::obj-17": [
				"range[1]",
				"range",
				0
			],
			"obj-17::obj-24": [
				"Y offset",
				"Y offset",
				0
			],
			"obj-17::obj-41": [
				"pictctrl[6]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-47": [
				"pictctrl[5]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-51": [
				"pictctrl[9]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-53": [
				"pictctrl[8]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-54": [
				"Bound mode",
				"Bound mode",
				0
			],
			"obj-17::obj-56::obj-23": [
				"gswitch2[17]",
				"gswitch2",
				0
			],
			"obj-17::obj-68": [
				"X offset",
				"X offset",
				0
			],
			"obj-17::obj-94": [
				"Interp mode[1]",
				"Interp mode",
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
			"obj-1::obj-24": [
				"Crossfade[2]",
				"range",
				0
			],
			"obj-1::obj-33": [
				"pictctrl[67]",
				"pictctrl[1]",
				0
			],
			"obj-1::obj-37": [
				"Vertical[1]",
				"Vertical",
				0
			],
			"obj-1::obj-39": [
				"pictctrl[68]",
				"pictctrl[1]",
				0
			],
			"obj-1::obj-56::obj-23": [
				"gswitch2[11]",
				"gswitch2",
				0
			],
			"obj-1::obj-68": [
				"Horizontal[1]",
				"Horizontal",
				0
			],
			"obj-24": [
				"toggle[5]",
				"toggle[5]",
				0
			],
			"obj-28": [
				"dial[1]",
				"dial",
				0
			],
			"obj-3::obj-16": [
				"Horizontal",
				"Horizontal",
				0
			],
			"obj-3::obj-17": [
				"Vertical",
				"Vertical",
				0
			],
			"obj-3::obj-2": [
				"range[27]",
				"range",
				0
			],
			"obj-3::obj-41": [
				"pictctrl[213]",
				"pictctrl[1]",
				0
			],
			"obj-3::obj-47": [
				"pictctrl[212]",
				"pictctrl[1]",
				0
			],
			"obj-3::obj-51": [
				"pictctrl[211]",
				"pictctrl[1]",
				0
			],
			"obj-3::obj-53": [
				"pictctrl[214]",
				"pictctrl[1]",
				0
			],
			"obj-3::obj-54": [
				"Tint mode",
				"Tint mode",
				0
			],
			"obj-3::obj-56::obj-23": [
				"gswitch2[16]",
				"gswitch2",
				0
			],
			"obj-3::obj-94": [
				"Interp mode",
				"Interp mode",
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
				"obj-17::obj-47": {
					"parameter_longname": "pictctrl[5]"
				},
				"obj-17::obj-51": {
					"parameter_longname": "pictctrl[9]"
				},
				"obj-17::obj-94": {
					"parameter_longname": "Interp mode[1]"
				},
				"obj-1::obj-24": {
					"parameter_longname": "Crossfade[2]"
				},
				"obj-1::obj-37": {
					"parameter_longname": "Vertical[1]"
				},
				"obj-1::obj-68": {
					"parameter_longname": "Horizontal[1]"
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
				"name": "data-handler.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "eclipse.genjit",
				"bootpath": "~/Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"patcherrelativepath": "../../../../Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/gen",
				"type": "gJIT",
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
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 4",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.hold.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 4",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.lfo.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 4",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.strobe.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 4",
				"patcherrelativepath": ".",
				"type": "JSON",
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
				"name": "vz.foggr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.fractalizr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.kaleidr.maxpat",
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
				"name": "vz.pixl8r.maxpat",
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
			}
		],
		"autosave": 0
	}
}