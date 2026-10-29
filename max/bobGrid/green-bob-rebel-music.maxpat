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
						0.211764705882353,
						0.474509803921569,
						0.141176470588235,
						1.0
					],
					"id": "obj-20",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						456.0,
						119.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[9]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[3]",
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
					"annotation": "## Smoothly crossfade between two videos and composite them ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-18",
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
						469.0,
						282.0,
						168.0,
						130.0
					],
					"varname": "mixfadr[1]",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						480.0,
						224.0,
						168.0,
						130.0
					]
				}
			},
			{
				"box": {
					"data": {
						"clips": [
							{
								"absolutepath": "Donitas2.mp4",
								"filename": "Donitas2.mp4",
								"filekind": "moviefile",
								"id": "u978005500",
								"loop": 1,
								"content_state": {
									"loop": 1,
									"vol": 0
								}
							}
						]
					},
					"drawto": "",
					"id": "obj-13",
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
						637.0,
						200.0,
						150.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						50,
						132.0,
						150.0,
						30.0
					]
				}
			},
			{
				"box": {
					"data": {
						"clips": [
							{
								"absolutepath": "Donitas1.mp4",
								"filename": "Donitas1.mp4",
								"filekind": "moviefile",
								"id": "u277005552",
								"loop": 1,
								"content_state": {
									"loop": 1,
									"vol": 0
								}
							}
						]
					},
					"drawto": "",
					"id": "obj-5",
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
						443.0,
						200.0,
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
					"annotation": "## Zoom/pan/rotate/offset a video ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-6",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.trans4mr.maxpat",
					"numinlets": 7,
					"numoutlets": 1,
					"offset": [
						0.0,
						0.0
					],
					"outlettype": [
						"jit_gl_texture"
					],
					"patching_rect": [
						584.0,
						905.0,
						270.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "trans4mr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						410.0,
						588.0,
						270.0,
						130.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Change a video's hue/saturation/lightness ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-35",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.husalir.maxpat",
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
						683.0,
						1062.0,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "husalir",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						210.0,
						588.0,
						188.0,
						130.0
					]
				}
			},
			{
				"box": {
					"annotation": "## Procedurally colorize a video image ##",
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-4",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.colorizr.maxpat",
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
						521.0,
						1068.0,
						138.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "freezr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						692.0,
						588.0,
						138.0,
						130.0
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
						262.0,
						1074.0,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "kaleidr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						588.0,
						188.0,
						130.0
					]
				}
			},
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
						924.0,
						224.0,
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
						1124.0,
						260.0,
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
						1124.0,
						224.0,
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
						1124.0,
						296.0,
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
						406.0,
						40.0,
						40.0
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
					"id": "obj-21",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						113.75438596491227,
						305.0,
						24.0,
						24.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle[3]",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle[3]",
							"parameter_type": 2
						}
					},
					"varname": "toggle",
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
					"annotation": "## Resample and interpolate a video ##",
					"bgcolor": [
						0.607843137254902,
						0.031372549019608,
						0.031372549019608,
						1.0
					],
					"bgmode": 1,
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"id": "obj-15",
					"lockeddragscroll": 0,
					"lockedsize": 0,
					"maxclass": "bpatcher",
					"name": "vz.interpol8r.maxpat",
					"numinlets": 6,
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
						432.00001287460327,
						252.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "interpol8r",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						660.0,
						224.0,
						252.0,
						130.0
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
						224.0,
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
						224.0,
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
						396.0,
						168.0,
						130.0
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
					"data": {
						"clips": [
							{
								"absolutepath": "greenBobVideo.mov",
								"filename": "greenBobVideo.mov",
								"filekind": "moviefile",
								"id": "u465007734",
								"loop": 1,
								"content_state": {
									"loop": 1,
									"vol": 0
								}
							}
						]
					},
					"drawto": "",
					"id": "obj-8",
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
						113.75438596491227,
						354.40425531914894,
						258.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						50,
						60,
						258.0,
						30.0
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
					"varname": "greenProjectr",
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						10,
						760.0,
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
						1371.0,
						40,
						140,
						22
					],
					"varname": "thegrid_3001",
					"text": "print GRID-VERDE"
				}
			},
			{
				"box": {
					"id": "obj-3002",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						40,
						400,
						20
					],
					"varname": "thegrid_3002",
					"text": "THE GRID · VERDE — abre también grid-router.maxpat"
				}
			},
			{
				"box": {
					"id": "obj-3003",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						70,
						130,
						22
					],
					"varname": "thegrid_3003",
					"text": "r grid.lock.visual",
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
						951.0,
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
						1091.0,
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
						1221.0,
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
						951.0,
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
						951.0,
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
						951.0,
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
						951.0,
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
						1041.0,
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
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						300,
						640,
						20
					],
					"varname": "thegrid_3012",
					"text": "TEMPLATES · VERDE — \"entra y sale\" (grid.hold / grid.strobe → on/off del módulo) y \"golpe y regreso\" (grid.env → crossfade / tono)"
				}
			},
			{
				"box": {
					"id": "obj-3013",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						318,
						640,
						20
					],
					"varname": "thegrid_3013",
					"text": "Ajusta compases o pico editando el texto del objeto. La intensidad de cada efecto se define en el panel de su módulo (en reposo está apagado)."
				}
			},
			{
				"box": {
					"id": "obj-3014",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						350,
						110,
						22
					],
					"varname": "thegrid_3014",
					"text": "r grid.visual.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3015",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1421.0,
						350,
						120,
						22
					],
					"varname": "thegrid_3015",
					"text": "prepend celda1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3016",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1071.0,
						376,
						130,
						22
					],
					"varname": "thegrid_3016",
					"text": "grid.hold 1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3017",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1211.0,
						376,
						560,
						20
					],
					"varname": "thegrid_3017",
					"text": "celda 1 · Caleidoscopio: KALEIDR entra 1 compás  →  KALEIDR entrada 5 = on/off"
				}
			},
			{
				"box": {
					"id": "obj-3018",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						405,
						110,
						22
					],
					"varname": "thegrid_3018",
					"text": "r grid.visual.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3019",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1421.0,
						405,
						120,
						22
					],
					"varname": "thegrid_3019",
					"text": "prepend celda2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3020",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1071.0,
						431,
						130,
						22
					],
					"varname": "thegrid_3020",
					"text": "grid.env 1. 0. 2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3021",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1211.0,
						431,
						560,
						20
					],
					"varname": "thegrid_3021",
					"text": "celda 2 · Giro de color: el tono (HUSALIR) da la vuelta y regresa en 2 compases  →  HUSALIR entrada 2 = tono"
				}
			},
			{
				"box": {
					"id": "obj-3022",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						460,
						110,
						22
					],
					"varname": "thegrid_3022",
					"text": "r grid.visual.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3023",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1421.0,
						460,
						120,
						22
					],
					"varname": "thegrid_3023",
					"text": "prepend celda3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3024",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1071.0,
						486,
						130,
						22
					],
					"varname": "thegrid_3024",
					"text": "grid.hold 1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3025",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1211.0,
						486,
						560,
						20
					],
					"varname": "thegrid_3025",
					"text": "celda 3 · Espejo + zoom: TRANS4MR entra 1 compás  →  TRANS4MR entrada 7 = on/off"
				}
			},
			{
				"box": {
					"id": "obj-3026",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						515,
						110,
						22
					],
					"varname": "thegrid_3026",
					"text": "r live.flash",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3027",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1421.0,
						515,
						120,
						22
					],
					"varname": "thegrid_3027",
					"text": "prepend destello",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3028",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1071.0,
						541,
						130,
						22
					],
					"varname": "thegrid_3028",
					"text": "grid.hold 0.25",
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
						1211.0,
						541,
						560,
						20
					],
					"varname": "thegrid_3029",
					"text": "tarola · Flash: COLORIZR entra ¼ de compás  →  COLORIZR entrada 4 = on/off"
				}
			},
			{
				"box": {
					"id": "obj-3030",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						590,
						640,
						20
					],
					"varname": "thegrid_3030",
					"text": "ABLETON · VERDE — abre también ableton-bridge.maxpat (el flash de tarola está en TEMPLATES)"
				}
			},
			{
				"box": {
					"id": "obj-3031",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						620,
						100,
						22
					],
					"varname": "thegrid_3031",
					"text": "r live.knob.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3032",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1061.0,
						620,
						400,
						20
					],
					"varname": "thegrid_3032",
					"text": "perilla 1 (0..1) → crossfade A↔B"
				}
			},
			{
				"box": {
					"id": "obj-3033",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						652,
						100,
						22
					],
					"varname": "thegrid_3033",
					"text": "r live.knob.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3034",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1281.0,
						740,
						60,
						22
					],
					"varname": "thegrid_3034",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3035",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1281.0,
						652,
						70,
						22
					],
					"varname": "thegrid_3035",
					"text": "loadmess 1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3036",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1281.0,
						680,
						24,
						24
					],
					"varname": "thegrid_3036",
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"presentation": 1,
					"presentation_rect": [
						190.0,
						466.0,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-3037",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1281.0,
						710,
						90,
						22
					],
					"varname": "thegrid_3037",
					"text": "grid.lfo 8",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3038",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						680,
						320,
						20
					],
					"varname": "thegrid_3038",
					"text": "perilla 2 → cruce de los videos nuevos; \"cruce auto\" (grid.lfo) lo mueve solo cada 8 compases"
				}
			},
			{
				"box": {
					"id": "obj-3039",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						710,
						100,
						22
					],
					"varname": "thegrid_3039",
					"text": "r live.knob.3",
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
						951.0,
						738,
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
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1071.0,
						710,
						100,
						22
					],
					"varname": "thegrid_3041",
					"text": "r live.knob.4",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3042",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1071.0,
						738,
						60,
						22
					],
					"varname": "thegrid_3042",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3043",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						764,
						640,
						20
					],
					"varname": "thegrid_3043",
					"text": "perillas 3-4 (0..1): conecta cada número al parámetro de Vizzie que quieras (pasa el mouse por la entrada para ver su nombre)"
				}
			},
			{
				"box": {
					"id": "obj-3044",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						800,
						90,
						22
					],
					"varname": "thegrid_3044",
					"text": "r live.scene",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3045",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 5,
					"patching_rect": [
						951.0,
						830,
						90,
						22
					],
					"varname": "thegrid_3045",
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
					"id": "obj-3046",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						951.0,
						890,
						110,
						22
					],
					"varname": "thegrid_3046",
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
					"id": "obj-3047",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1421.0,
						800,
						120,
						22
					],
					"varname": "thegrid_3047",
					"text": "prepend escena",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3048",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						951.0,
						860,
						60,
						22
					],
					"varname": "thegrid_3048",
					"text": "1 0 0.",
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
						1251.0,
						830,
						340,
						20
					],
					"varname": "thegrid_3049",
					"text": "escena 1: solo A (fractal + niebla)"
				}
			},
			{
				"box": {
					"id": "obj-3050",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1021.0,
						860,
						60,
						22
					],
					"varname": "thegrid_3050",
					"text": "0 1 1.",
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
						1251.0,
						848,
						340,
						20
					],
					"varname": "thegrid_3051",
					"text": "escena 2: solo B (interpol8r + delay)"
				}
			},
			{
				"box": {
					"id": "obj-3052",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1091.0,
						860,
						60,
						22
					],
					"varname": "thegrid_3052",
					"text": "1 1 0.5",
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
						1251.0,
						866,
						340,
						20
					],
					"varname": "thegrid_3053",
					"text": "escena 3: A + B mezclados"
				}
			},
			{
				"box": {
					"id": "obj-3054",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1161.0,
						860,
						60,
						22
					],
					"varname": "thegrid_3054",
					"text": "0 0 0.",
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
						1251.0,
						884,
						340,
						20
					],
					"varname": "thegrid_3055",
					"text": "escena 4: limpio"
				}
			},
			{
				"box": {
					"id": "obj-3056",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1600,
						500,
						20
					],
					"varname": "thegrid_3056",
					"text": "VERDE · bob rebel music — The Grid (visual)",
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
					"id": "obj-3057",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1620,
						400,
						20
					],
					"varname": "thegrid_3057",
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
					"id": "obj-3058",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1640,
						260,
						20
					],
					"varname": "thegrid_3058",
					"text": "video original",
					"presentation": 1,
					"presentation_rect": [
						318.0,
						64,
						260,
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
						951.0,
						1660,
						260,
						20
					],
					"varname": "thegrid_3059",
					"text": "video nuevo (cruce)",
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
					"id": "obj-3060",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1680,
						260,
						20
					],
					"varname": "thegrid_3060",
					"text": "video nuevo (cruce)",
					"presentation": 1,
					"presentation_rect": [
						210.0,
						136.0,
						260,
						20
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
						951.0,
						1700,
						500,
						20
					],
					"varname": "thegrid_3061",
					"text": "BASE — cadena A y cadena B (entran al MIXFADR principal)",
					"presentation": 1,
					"presentation_rect": [
						10,
						182.0,
						500,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3062",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1720,
						168.0,
						20
					],
					"varname": "thegrid_3062",
					"text": "cruce de videos nuevos",
					"presentation": 1,
					"presentation_rect": [
						480.0,
						204.0,
						168.0,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3063",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1740,
						170,
						20
					],
					"varname": "thegrid_3063",
					"text": "efectos A on/off",
					"presentation": 1,
					"presentation_rect": [
						1154.0,
						226.0,
						170,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3064",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1760,
						170,
						20
					],
					"varname": "thegrid_3064",
					"text": "efectos B on/off",
					"presentation": 1,
					"presentation_rect": [
						1154.0,
						262.0,
						170,
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
						951.0,
						1780,
						170,
						20
					],
					"varname": "thegrid_3065",
					"text": "mezcla on/off",
					"presentation": 1,
					"presentation_rect": [
						1154.0,
						298.0,
						170,
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
						951.0,
						1800,
						400,
						20
					],
					"varname": "thegrid_3066",
					"text": "MEZCLA PRINCIPAL",
					"presentation": 1,
					"presentation_rect": [
						10,
						374.0,
						400,
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
						951.0,
						1820,
						140,
						20
					],
					"varname": "thegrid_3067",
					"text": "crossfade A↔B",
					"presentation": 1,
					"presentation_rect": [
						238.0,
						414.0,
						140,
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
						951.0,
						1840,
						260,
						20
					],
					"varname": "thegrid_3068",
					"text": "cruce auto de videos nuevos (8 compases)",
					"presentation": 1,
					"presentation_rect": [
						220.0,
						468.0,
						260,
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
						951.0,
						1860,
						700,
						20
					],
					"varname": "thegrid_3069",
					"text": "TEMPLATES (apagados en reposo; los prende The Grid o Ableton)",
					"presentation": 1,
					"presentation_rect": [
						10,
						546.0,
						700,
						20
					],
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-3070",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1880,
						188.0,
						20
					],
					"varname": "thegrid_3070",
					"text": "celda 1 · Caleidoscopio",
					"presentation": 1,
					"presentation_rect": [
						10,
						568.0,
						188.0,
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
						951.0,
						1900,
						188.0,
						20
					],
					"varname": "thegrid_3071",
					"text": "celda 2 · Giro de color",
					"presentation": 1,
					"presentation_rect": [
						210.0,
						568.0,
						188.0,
						20
					]
				}
			},
			{
				"box": {
					"id": "obj-3072",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						951.0,
						1920,
						270.0,
						20
					],
					"varname": "thegrid_3072",
					"text": "celda 3 · Espejo + zoom",
					"presentation": 1,
					"presentation_rect": [
						410.0,
						568.0,
						270.0,
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
						951.0,
						1940,
						138.0,
						20
					],
					"varname": "thegrid_3073",
					"text": "tarola · Flash",
					"presentation": 1,
					"presentation_rect": [
						692.0,
						568.0,
						138.0,
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
						951.0,
						1960,
						400,
						20
					],
					"varname": "thegrid_3074",
					"text": "SALIDA",
					"presentation": 1,
					"presentation_rect": [
						10,
						738.0,
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
						"obj-18",
						1
					],
					"source": [
						"obj-13",
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
						"obj-15",
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
					"order": 1,
					"source": [
						"obj-16",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-15",
						5
					],
					"order": 0,
					"source": [
						"obj-16",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-15",
						0
					],
					"source": [
						"obj-18",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-13",
						0
					],
					"order": 0,
					"source": [
						"obj-20",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-5",
						0
					],
					"order": 1,
					"source": [
						"obj-20",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-8",
						0
					],
					"source": [
						"obj-21",
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
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-18",
						0
					],
					"source": [
						"obj-5",
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
						"obj-3",
						0
					],
					"source": [
						"obj-8",
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
						"obj-11",
						0
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
						"obj-17",
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
						"obj-35",
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
						"obj-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
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
						"obj-21",
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
						"obj-20",
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
						"obj-21",
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
						"obj-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3014",
						0
					],
					"destination": [
						"obj-3015",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3015",
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
						"obj-3014",
						0
					],
					"destination": [
						"obj-3016",
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
						"obj-17",
						4
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
						"obj-3019",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3019",
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
						"obj-3018",
						0
					],
					"destination": [
						"obj-3020",
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
						"obj-35",
						1
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
						"obj-3023",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3023",
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
						"obj-3022",
						0
					],
					"destination": [
						"obj-3024",
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
						"obj-6",
						6
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
						"obj-3027",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3027",
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
						"obj-3026",
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
						"obj-4",
						3
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
						"obj-27",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3034",
						0
					],
					"destination": [
						"obj-18",
						2
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
						"obj-3036",
						0
					],
					"destination": [
						"obj-3037",
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
						"obj-3034",
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
						"obj-3034",
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
						"obj-3041",
						0
					],
					"destination": [
						"obj-3042",
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
						"obj-3045",
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
						"obj-3047",
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
						"obj-3001",
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
						"obj-3046",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3045",
						1
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
						"obj-3046",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3045",
						2
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
						"obj-3046",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3045",
						3
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
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3046",
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
						"obj-3046",
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
			"obj-15::obj-17": [
				"range[8]",
				"range",
				0
			],
			"obj-15::obj-24": [
				"Vertical[1]",
				"Vertical",
				0
			],
			"obj-15::obj-41": [
				"pictctrl[6]",
				"pictctrl[1]",
				0
			],
			"obj-15::obj-44": [
				"Scale",
				"Scale",
				0
			],
			"obj-15::obj-47": [
				"pictctrl[22]",
				"pictctrl[1]",
				0
			],
			"obj-15::obj-50": [
				"pictctrl[8]",
				"pictctrl[1]",
				0
			],
			"obj-15::obj-51": [
				"pictctrl[5]",
				"pictctrl[1]",
				0
			],
			"obj-15::obj-53": [
				"pictctrl[21]",
				"pictctrl[1]",
				0
			],
			"obj-15::obj-54": [
				"Bound",
				"Bound",
				0
			],
			"obj-15::obj-56::obj-23": [
				"gswitch2[17]",
				"gswitch2",
				0
			],
			"obj-15::obj-68": [
				"Horizontal[1]",
				"Horizontal",
				0
			],
			"obj-15::obj-94": [
				"Interpolation",
				"Interpolation",
				0
			],
			"obj-16": [
				"toggle[8]",
				"toggle[3]",
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
				"pictctrl[9]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-47": [
				"pictctrl[10]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-51": [
				"pictctrl[36]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-53": [
				"pictctrl[37]",
				"pictctrl[1]",
				0
			],
			"obj-17::obj-54": [
				"Bound mode",
				"Bound mode",
				0
			],
			"obj-17::obj-56::obj-23": [
				"gswitch2[18]",
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
			"obj-18::obj-17::obj-23": [
				"gswitch2[7]",
				"gswitch2",
				0
			],
			"obj-18::obj-21": [
				"range[7]",
				"range",
				0
			],
			"obj-18::obj-24": [
				"pictctrl[12]",
				"pictctrl[1]",
				0
			],
			"obj-18::obj-26": [
				"Crossfade[3]",
				"Crossfade",
				0
			],
			"obj-18::obj-39": [
				"Operator mode[1]",
				"Operator mode",
				0
			],
			"obj-18::obj-51": [
				"pictctrl[11]",
				"pictctrl[1]",
				0
			],
			"obj-18::obj-56::obj-23": [
				"gswitch2[6]",
				"gswitch2",
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
			"obj-20": [
				"toggle[9]",
				"toggle[3]",
				0
			],
			"obj-21": [
				"toggle[3]",
				"toggle[3]",
				0
			],
			"obj-28": [
				"dial[1]",
				"dial",
				0
			],
			"obj-35::obj-104": [
				"pictctrl[92]",
				"pictctrl[1]",
				0
			],
			"obj-35::obj-119": [
				"Hue",
				"Hue",
				0
			],
			"obj-35::obj-127": [
				"Saturation",
				"Saturation",
				0
			],
			"obj-35::obj-142": [
				"Luminance",
				"Luminance",
				0
			],
			"obj-35::obj-147": [
				"pictctrl[91]",
				"pictctrl[1]",
				0
			],
			"obj-35::obj-148": [
				"pictctrl[90]",
				"pictctrl[1]",
				0
			],
			"obj-35::obj-56::obj-23": [
				"gswitch2[20]",
				"gswitch2",
				0
			],
			"obj-35::obj-6": [
				"range[17]",
				"range",
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
			"obj-4::obj-104": [
				"pictctrl[23]",
				"pictctrl[1]",
				0
			],
			"obj-4::obj-121": [
				"Invert",
				"Invert",
				0
			],
			"obj-4::obj-128": [
				"range[24]",
				"range",
				0
			],
			"obj-4::obj-24": [
				"Color plane",
				"Color plane",
				0
			],
			"obj-4::obj-25": [
				"Color palette",
				"Color palette",
				0
			],
			"obj-4::obj-26": [
				"pictctrl[38]",
				"pictctrl[1]",
				0
			],
			"obj-4::obj-56::obj-23": [
				"gswitch2[19]",
				"gswitch2",
				0
			],
			"obj-4::obj-6": [
				"range[2]",
				"range",
				0
			],
			"obj-6::obj-104": [
				"pictctrl[67]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-119": [
				"Zoom[1]",
				"Zoom",
				0
			],
			"obj-6::obj-120": [
				"Zoom range[1]",
				"Zoom range",
				1
			],
			"obj-6::obj-121": [
				"zoom[13]",
				"Zoom",
				0
			],
			"obj-6::obj-3": [
				"range[13]",
				"range",
				0
			],
			"obj-6::obj-37": [
				"Y offset[1]",
				"Y offset",
				0
			],
			"obj-6::obj-41": [
				"pictctrl[68]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-53": [
				"pictctrl[70]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-56::obj-23": [
				"gswitch2[4]",
				"gswitch2",
				0
			],
			"obj-6::obj-64": [
				"Mode[1]",
				"Mode",
				0
			],
			"obj-6::obj-65": [
				"pictctrl[84]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-66": [
				"pictctrl[83]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-68": [
				"X offset[1]",
				"X offset",
				0
			],
			"obj-6::obj-91": [
				"pictctrl[69]",
				"pictctrl[1]",
				0
			],
			"obj-6::obj-92": [
				"Rotation",
				"Rotation",
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
				"obj-15::obj-24": {
					"parameter_longname": "Vertical[1]"
				},
				"obj-15::obj-47": {
					"parameter_longname": "pictctrl[22]"
				},
				"obj-15::obj-53": {
					"parameter_longname": "pictctrl[21]"
				},
				"obj-15::obj-68": {
					"parameter_longname": "Horizontal[1]"
				},
				"obj-17::obj-41": {
					"parameter_longname": "pictctrl[9]"
				},
				"obj-17::obj-47": {
					"parameter_longname": "pictctrl[10]"
				},
				"obj-17::obj-51": {
					"parameter_longname": "pictctrl[36]"
				},
				"obj-17::obj-53": {
					"parameter_longname": "pictctrl[37]"
				},
				"obj-17::obj-94": {
					"parameter_longname": "Interp mode[1]"
				},
				"obj-18::obj-24": {
					"parameter_longname": "pictctrl[12]"
				},
				"obj-18::obj-26": {
					"parameter_longname": "Crossfade[3]"
				},
				"obj-18::obj-39": {
					"parameter_longname": "Operator mode[1]"
				},
				"obj-18::obj-51": {
					"parameter_longname": "pictctrl[11]"
				},
				"obj-1::obj-20": {
					"parameter_longname": "pictctrl[97]"
				},
				"obj-1::obj-24": {
					"parameter_longname": "Crossfade[2]"
				},
				"obj-1::obj-48": {
					"parameter_longname": "pictctrl[86]"
				},
				"obj-4::obj-104": {
					"parameter_longname": "pictctrl[23]"
				},
				"obj-4::obj-26": {
					"parameter_longname": "pictctrl[38]"
				},
				"obj-6::obj-119": {
					"parameter_longname": "Zoom[1]"
				},
				"obj-6::obj-37": {
					"parameter_longname": "Y offset[1]"
				},
				"obj-6::obj-64": {
					"parameter_longname": "Mode[1]"
				},
				"obj-6::obj-68": {
					"parameter_longname": "X offset[1]"
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
				"name": "colorizer.genjit",
				"bootpath": "C74:/packages/Vizzie/patchers/gen",
				"type": "gJIT",
				"implicit": 1
			},
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
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 3",
				"patcherrelativepath": ".",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "grid.hold.maxpat",
				"bootpath": "~/Documents/max-visuals/grid-max/thegrid-max 3",
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
				"name": "lo_hi_UI_control.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers/utils",
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
				"name": "vz.colorizr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
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
				"name": "vz.fractalizr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.husalir.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.interpol8r.maxpat",
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
				"name": "vz.projectr.maxpat",
				"bootpath": "C74:/packages/Vizzie/patchers",
				"type": "JSON",
				"implicit": 1
			},
			{
				"name": "vz.trans4mr.maxpat",
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