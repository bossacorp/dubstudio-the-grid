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
		"openinpresentation": 0,
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
					"viewvisibility": 1
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
					"presentation": 1,
					"presentation_rect": [
						605.0,
						458.5,
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
					"varname": "toggle[5]"
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
					"presentation": 1,
					"presentation_rect": [
						358.0,
						455.5,
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
					"varname": "toggle[4]"
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
					"presentation": 1,
					"presentation_rect": [
						71.0,
						455.0,
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
					"varname": "toggle[3]"
				}
			},
			{
				"box": {
					"format": 6,
					"id": "obj-29",
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
						701.0,
						810.0,
						50.0,
						22.0
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
					"floatoutput": 1,
					"id": "obj-30",
					"maxclass": "dial",
					"mult": 0.01,
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						683.0,
						736.0,
						40.0,
						40.0
					],
					"presentation": 1,
					"presentation_rect": [
						597.0,
						379.5,
						40.0,
						40.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "dial[2]",
							"parameter_mmax": 100.0,
							"parameter_modmode": 3,
							"parameter_shortname": "dial",
							"parameter_type": 0
						}
					},
					"size": 100.0,
					"varname": "dial[2]"
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
					"presentation": 1,
					"presentation_rect": [
						63.0,
						394.0,
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
					"varname": "dial[1]"
				}
			},
			{
				"box": {
					"format": 6,
					"id": "obj-26",
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
						422.0,
						796.0,
						50.0,
						22.0
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
					"floatoutput": 1,
					"id": "obj-18",
					"maxclass": "dial",
					"mult": 0.01,
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"parameter_enable": 1,
					"patching_rect": [
						422.0,
						731.0,
						40.0,
						40.0
					],
					"presentation": 1,
					"presentation_rect": [
						350.0,
						386.5,
						40.0,
						40.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "dial",
							"parameter_mmax": 100.0,
							"parameter_modmode": 3,
							"parameter_shortname": "dial",
							"parameter_type": 0
						}
					},
					"size": 100.0,
					"varname": "dial"
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
					"presentation": 1,
					"presentation_rect": [
						23.0,
						162.0,
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
					"varname": "toggle"
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
					"presentation": 1,
					"presentation_rect": [
						647.0,
						209.5,
						252.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "interpol8r",
					"viewvisibility": 1
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
					"presentation": 1,
					"presentation_rect": [
						395.0,
						211.5,
						188.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "foggr",
					"viewvisibility": 1
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
					"presentation": 1,
					"presentation_rect": [
						63.0,
						211.0,
						258.0,
						130.0
					],
					"prototypename": "pixl",
					"varname": "fractalizr",
					"viewvisibility": 1
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
					"presentation": 1,
					"presentation_rect": [
						108.0,
						378.0,
						168.0,
						130.0
					],
					"varname": "mixfadr",
					"viewvisibility": 1
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
								"loop": 0,
								"content_state": {}
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
						63.0,
						159.0,
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
					"viewvisibility": 1
				}
			},
			{
				"box": {
					"id": "obj-2001",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						40,
						520,
						20
					],
					"text": "THE GRID · VERDE — entradas desde grid-router.maxpat (abrirlo también)"
				}
			},
			{
				"box": {
					"id": "obj-2002",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						60,
						520,
						20
					],
					"text": "Celda 1: efectos A · Celda 2: efectos B · Celda 3: crossfade A↔B · Bloqueo: pausa"
				}
			},
			{
				"box": {
					"id": "obj-2003",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1290.6666901111603,
						340,
						120,
						22
					],
					"text": "print GRID-VERDE"
				}
			},
			{
				"box": {
					"id": "obj-2004",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						100,
						110,
						22
					],
					"text": "r grid.visual.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2005",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						130,
						40,
						22
					],
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-2006",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						100,
						110,
						22
					],
					"text": "prepend celda1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2007",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						100,
						260,
						20
					],
					"text": "prende/apaga efectos A (fractalizr → foggr)"
				}
			},
			{
				"box": {
					"id": "obj-2008",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						160,
						110,
						22
					],
					"text": "r grid.visual.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2009",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						190,
						40,
						22
					],
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-2010",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						160,
						110,
						22
					],
					"text": "prepend celda2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2011",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						160,
						260,
						20
					],
					"text": "prende/apaga efectos B (interpol8r → delayr)"
				}
			},
			{
				"box": {
					"id": "obj-2012",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						220,
						110,
						22
					],
					"text": "r grid.visual.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2013",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						250,
						40,
						22
					],
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-2014",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						220,
						110,
						22
					],
					"text": "prepend celda3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2015",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						220,
						260,
						20
					],
					"text": "salta el crossfade: A (0.) ↔ B (1.)"
				}
			},
			{
				"box": {
					"id": "obj-2016",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950.6666901111603,
						250,
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
					"id": "obj-2017",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						980.6666901111603,
						252,
						60,
						20
					],
					"text": "A / B"
				}
			},
			{
				"box": {
					"id": "obj-2018",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 3,
					"patching_rect": [
						890.6666901111603,
						285,
						70,
						22
					],
					"text": "sel 0 1",
					"outlettype": [
						"bang",
						"bang",
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2019",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						315,
						30,
						22
					],
					"text": "0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2020",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						930.6666901111603,
						315,
						30,
						22
					],
					"text": "1.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2021",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						370,
						130,
						22
					],
					"text": "r grid.lock.visual",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2022",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						400,
						40,
						22
					],
					"text": "== 0",
					"outlettype": [
						"int"
					]
				}
			},
			{
				"box": {
					"id": "obj-2023",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						370,
						110,
						22
					],
					"text": "prepend bloqueo",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2024",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						370,
						260,
						20
					],
					"text": "bloqueo 1 → pausa el video · 0 → lo reanuda"
				}
			},
			{
				"box": {
					"id": "obj-2025",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						450,
						60,
						22
					],
					"text": "loadbang",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-2026",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						480,
						80,
						22
					],
					"text": "delay 1000",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-2027",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						510,
						30,
						22
					],
					"text": "1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-2028",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						980.6666901111603,
						480,
						300,
						20
					],
					"text": "al abrir el patch: play del video (1 s después)"
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
						"obj-26",
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
						"obj-29",
						0
					],
					"source": [
						"obj-30",
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
						"obj-15",
						0
					],
					"order": 1,
					"source": [
						"obj-8",
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
					"order": 0,
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
						"obj-2004",
						0
					],
					"destination": [
						"obj-2005",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2004",
						0
					],
					"destination": [
						"obj-2006",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2006",
						0
					],
					"destination": [
						"obj-2003",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2005",
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
						"obj-2008",
						0
					],
					"destination": [
						"obj-2009",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2008",
						0
					],
					"destination": [
						"obj-2010",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2010",
						0
					],
					"destination": [
						"obj-2003",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2009",
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
						"obj-2012",
						0
					],
					"destination": [
						"obj-2013",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2012",
						0
					],
					"destination": [
						"obj-2014",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2014",
						0
					],
					"destination": [
						"obj-2003",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2013",
						0
					],
					"destination": [
						"obj-2016",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2016",
						0
					],
					"destination": [
						"obj-2018",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2018",
						0
					],
					"destination": [
						"obj-2019",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2018",
						1
					],
					"destination": [
						"obj-2020",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2019",
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
						"obj-2020",
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
						"obj-2021",
						0
					],
					"destination": [
						"obj-2022",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2022",
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
						"obj-2021",
						0
					],
					"destination": [
						"obj-2023",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2023",
						0
					],
					"destination": [
						"obj-2003",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2025",
						0
					],
					"destination": [
						"obj-2026",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2026",
						0
					],
					"destination": [
						"obj-2027",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2027",
						0
					],
					"destination": [
						"obj-21",
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
			"obj-18": [
				"dial",
				"dial",
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
			"obj-30": [
				"dial[2]",
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
				"name": "greenBobVideo.mov",
				"bootpath": "~/Documents/max-visuals/grid-max/bobGrid",
				"patcherrelativepath": ".",
				"type": "MooV",
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
				"name": "vz.fractalizr.maxpat",
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