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
					"data": {
						"clips": [
							{
								"absolutepath": "redBobVideo.mov",
								"filename": "redBobVideo.mov",
								"filekind": "moviefile",
								"id": "u828004931",
								"loop": 0,
								"content_state": {}
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
						316.0,
						310.0,
						150.0,
						30.0
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
						510.0,
						300.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						605.0,
						160.5,
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
					"varname": "toggle[2]"
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
					"varname": "redProjectr",
					"viewvisibility": 1
				}
			},
			{
				"box": {
					"id": "obj-3001",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1290.6666901111603,
						340,
						130,
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
						890.6666901111603,
						40,
						560,
						20
					],
					"varname": "thegrid_3002",
					"text": "THE GRID · ROJO — entradas desde grid-router.maxpat (abrirlo también)"
				}
			},
			{
				"box": {
					"id": "obj-3003",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						60,
						560,
						20
					],
					"varname": "thegrid_3003",
					"text": "Celda 1: efectos A · Celda 2: efectos B · Celda 3: crossfade A↔B · Bloqueo: pausa"
				}
			},
			{
				"box": {
					"id": "obj-3004",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						100,
						110,
						22
					],
					"varname": "thegrid_3004",
					"text": "r grid.vote.1",
					"outlettype": [
						""
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
						890.6666901111603,
						130,
						40,
						22
					],
					"varname": "thegrid_3005",
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3006",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						100,
						110,
						22
					],
					"varname": "thegrid_3006",
					"text": "prepend celda1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3007",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						100,
						300,
						20
					],
					"varname": "thegrid_3007",
					"text": "prende/apaga efectos A (fractalizr → foggr)"
				}
			},
			{
				"box": {
					"id": "obj-3008",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						160,
						110,
						22
					],
					"varname": "thegrid_3008",
					"text": "r grid.vote.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3009",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						190,
						40,
						22
					],
					"varname": "thegrid_3009",
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3010",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						160,
						110,
						22
					],
					"varname": "thegrid_3010",
					"text": "prepend celda2",
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
						1140.6666901111603,
						160,
						300,
						20
					],
					"varname": "thegrid_3011",
					"text": "prende/apaga efectos B (interpol8r → delayr)"
				}
			},
			{
				"box": {
					"id": "obj-3012",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						220,
						110,
						22
					],
					"varname": "thegrid_3012",
					"text": "r grid.vote.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3013",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						250,
						40,
						22
					],
					"varname": "thegrid_3013",
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3014",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						220,
						110,
						22
					],
					"varname": "thegrid_3014",
					"text": "prepend celda3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3015",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1140.6666901111603,
						220,
						300,
						20
					],
					"varname": "thegrid_3015",
					"text": "salta el crossfade: A (0.) ↔ B (1.)"
				}
			},
			{
				"box": {
					"id": "obj-3016",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						950.6666901111603,
						250,
						24,
						24
					],
					"varname": "thegrid_3016",
					"outlettype": [
						"int"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3017",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						980.6666901111603,
						252,
						60,
						20
					],
					"varname": "thegrid_3017",
					"text": "A / B"
				}
			},
			{
				"box": {
					"id": "obj-3018",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 3,
					"patching_rect": [
						890.6666901111603,
						285,
						70,
						22
					],
					"varname": "thegrid_3018",
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
					"id": "obj-3019",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						315,
						30,
						22
					],
					"varname": "thegrid_3019",
					"text": "0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3020",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						930.6666901111603,
						315,
						30,
						22
					],
					"varname": "thegrid_3020",
					"text": "1.",
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
						890.6666901111603,
						370,
						130,
						22
					],
					"varname": "thegrid_3021",
					"text": "r grid.lock.vote",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3022",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						400,
						40,
						22
					],
					"varname": "thegrid_3022",
					"text": "== 0",
					"outlettype": [
						"int"
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
						1030.6666901111603,
						370,
						110,
						22
					],
					"varname": "thegrid_3023",
					"text": "prepend bloqueo",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3024",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1150.6666901111603,
						370,
						300,
						20
					],
					"varname": "thegrid_3024",
					"text": "bloqueo 1 → pausa el video · 0 → lo reanuda"
				}
			},
			{
				"box": {
					"id": "obj-3025",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						450,
						60,
						22
					],
					"varname": "thegrid_3025",
					"text": "loadbang",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3026",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						480,
						80,
						22
					],
					"varname": "thegrid_3026",
					"text": "delay 1000",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3027",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						510,
						30,
						22
					],
					"varname": "thegrid_3027",
					"text": "1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3028",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						980.6666901111603,
						480,
						300,
						20
					],
					"varname": "thegrid_3028",
					"text": "al abrir el patch: play del video (1 s después)"
				}
			},
			{
				"box": {
					"id": "obj-3029",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						560,
						560,
						20
					],
					"varname": "thegrid_3029",
					"text": "ABLETON · ROJO — entradas desde ableton-bridge.maxpat (abrirlo también)"
				}
			},
			{
				"box": {
					"id": "obj-3030",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						590,
						90,
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
						890.6666901111603,
						620,
						40,
						22
					],
					"varname": "thegrid_3031",
					"text": "t b",
					"outlettype": [
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "obj-3032",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						650,
						80,
						22
					],
					"varname": "thegrid_3032",
					"text": "1., 0. 250",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3033",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 2,
					"patching_rect": [
						890.6666901111603,
						680,
						80,
						22
					],
					"varname": "thegrid_3033",
					"text": "line 0. 20",
					"outlettype": [
						"",
						"bang"
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
						990.6666901111603,
						590,
						450,
						20
					],
					"varname": "thegrid_3034",
					"text": "tarola → destello: el crossfade salta a B y regresa en 250 ms"
				}
			},
			{
				"box": {
					"id": "obj-3035",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						620,
						110,
						22
					],
					"varname": "thegrid_3035",
					"text": "prepend destello",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3036",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						730,
						100,
						22
					],
					"varname": "thegrid_3036",
					"text": "r live.knob.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3037",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.6666901111603,
						730,
						440,
						20
					],
					"varname": "thegrid_3037",
					"text": "perilla 1 (0..1) → crossfade A↔B"
				}
			},
			{
				"box": {
					"id": "obj-3038",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						765,
						100,
						22
					],
					"varname": "thegrid_3038",
					"text": "r live.knob.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3039",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						890.6666901111603,
						795,
						60,
						22
					],
					"varname": "thegrid_3039",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3040",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1010.6666901111603,
						765,
						100,
						22
					],
					"varname": "thegrid_3040",
					"text": "r live.knob.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3041",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1010.6666901111603,
						795,
						60,
						22
					],
					"varname": "thegrid_3041",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3042",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1130.6666901111603,
						765,
						100,
						22
					],
					"varname": "thegrid_3042",
					"text": "r live.knob.4",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3043",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1130.6666901111603,
						795,
						60,
						22
					],
					"varname": "thegrid_3043",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3044",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						890.6666901111603,
						822,
						560,
						20
					],
					"varname": "thegrid_3044",
					"text": "perillas 2-4 (0..1): conecta cada número al parámetro de Vizzie que quieras"
				}
			},
			{
				"box": {
					"id": "obj-3045",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						860,
						90,
						22
					],
					"varname": "thegrid_3045",
					"text": "r live.scene",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3046",
					"maxclass": "newobj",
					"numinlets": 5,
					"numoutlets": 5,
					"patching_rect": [
						890.6666901111603,
						890,
						90,
						22
					],
					"varname": "thegrid_3046",
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
					"id": "obj-3047",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						890.6666901111603,
						960,
						110,
						22
					],
					"varname": "thegrid_3047",
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
					"id": "obj-3048",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						920,
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
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						960.6666901111603,
						920,
						60,
						22
					],
					"varname": "thegrid_3049",
					"text": "0 1 1.",
					"outlettype": [
						""
					]
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
						920,
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
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1100.6666901111603,
						920,
						60,
						22
					],
					"varname": "thegrid_3051",
					"text": "0 0 0.",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3052",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						860,
						260,
						20
					],
					"varname": "thegrid_3052",
					"text": "escena → [efectos A, efectos B, crossfade]"
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
						880,
						260,
						20
					],
					"varname": "thegrid_3053",
					"text": "escena 1: solo A"
				}
			},
			{
				"box": {
					"id": "obj-3054",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						898,
						260,
						20
					],
					"varname": "thegrid_3054",
					"text": "escena 2: solo B"
				}
			},
			{
				"box": {
					"id": "obj-3055",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						916,
						260,
						20
					],
					"varname": "thegrid_3055",
					"text": "escena 3: A+B mezclados"
				}
			},
			{
				"box": {
					"id": "obj-3056",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1190.6666901111603,
						934,
						260,
						20
					],
					"varname": "thegrid_3056",
					"text": "escena 4: limpio"
				}
			},
			{
				"box": {
					"id": "obj-3057",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1020.6666901111603,
						860,
						100,
						22
					],
					"varname": "thegrid_3057",
					"text": "prepend escena",
					"outlettype": [
						""
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
						960,
						600,
						20
					],
					"varname": "thegrid_3058",
					"text": "ENVOLVENTES · ROJO — templates de golpe y regreso (al tempo de Ableton)"
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
						980,
						600,
						20
					],
					"varname": "thegrid_3059",
					"text": "Conecta cada número a la entrada del parámetro de Vizzie (pasa el mouse por la entrada"
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
						998,
						600,
						20
					],
					"varname": "thegrid_3060",
					"text": "para ver su nombre). Para otro rango usa [scale 0. 1. mín máx]. Ajusta pico/base/compases"
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
						1016,
						600,
						20
					],
					"varname": "thegrid_3061",
					"text": "editando el texto del objeto: grid.env <pico> <base> <compases> · grid.strobe <por-compás> <compases>"
				}
			},
			{
				"box": {
					"id": "obj-3062",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1050,
						110,
						22
					],
					"varname": "thegrid_3062",
					"text": "r grid.vote.1",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3063",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1078,
						130,
						22
					],
					"varname": "thegrid_3063",
					"text": "grid.env 1. 0. 16",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3064",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1030.6666901111603,
						1078,
						60,
						22
					],
					"varname": "thegrid_3064",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3065",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.6666901111603,
						1078,
						420,
						20
					],
					"varname": "thegrid_3065",
					"text": "→ Raíces: calidez + niebla suave (se desvanece en 16 compases)"
				}
			},
			{
				"box": {
					"id": "obj-3066",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1110,
						110,
						22
					],
					"varname": "thegrid_3066",
					"text": "r grid.vote.2",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3067",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1138,
						130,
						22
					],
					"varname": "thegrid_3067",
					"text": "grid.strobe 1 16",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3068",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1030.6666901111603,
						1138,
						60,
						22
					],
					"varname": "thegrid_3068",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3069",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.6666901111603,
						1138,
						420,
						20
					],
					"varname": "thegrid_3069",
					"text": "→ Steppers: pixelado/posterizado con cortes cada compás"
				}
			},
			{
				"box": {
					"id": "obj-3070",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1170,
						110,
						22
					],
					"varname": "thegrid_3070",
					"text": "r grid.vote.3",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3071",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1198,
						130,
						22
					],
					"varname": "thegrid_3071",
					"text": "grid.env 1. 0. 16",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3072",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1030.6666901111603,
						1198,
						60,
						22
					],
					"varname": "thegrid_3072",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3073",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.6666901111603,
						1198,
						420,
						20
					],
					"varname": "thegrid_3073",
					"text": "→ Cósmico: fractal + caleidoscopio (se desvanece en 16 compases)"
				}
			},
			{
				"box": {
					"id": "obj-3074",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1230,
						110,
						22
					],
					"varname": "thegrid_3074",
					"text": "r live.flash",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3075",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						890.6666901111603,
						1258,
						130,
						22
					],
					"varname": "thegrid_3075",
					"text": "grid.env 1. 0. 0.25",
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "obj-3076",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1030.6666901111603,
						1258,
						60,
						22
					],
					"varname": "thegrid_3076",
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-3077",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.6666901111603,
						1258,
						420,
						20
					],
					"varname": "thegrid_3077",
					"text": "→ Flash de tarola: brillo (un cuarto de compás)"
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
						"obj-15",
						0
					],
					"order": 0,
					"source": [
						"obj-31",
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
					"order": 1,
					"source": [
						"obj-31",
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
						"obj-3004",
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
						"obj-3004",
						0
					],
					"destination": [
						"obj-3006",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3006",
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
						"obj-3005",
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
						"obj-3008",
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
						"obj-3001",
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
						"obj-16",
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
						"obj-3013",
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
						"obj-3014",
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
						"obj-3001",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3013",
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
						"obj-3019",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3018",
						1
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
						"obj-3019",
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
						"obj-27",
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
						"obj-24",
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
						"obj-3025",
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
						"obj-24",
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
						"obj-3033",
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
						"obj-3030",
						0
					],
					"destination": [
						"obj-3035",
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
						"obj-3001",
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
						"obj-27",
						0
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
						"obj-3040",
						0
					],
					"destination": [
						"obj-3041",
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
						"obj-3046",
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
						"obj-3047",
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
						"obj-3049",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3049",
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
						"obj-3046",
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
						"obj-3047",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3046",
						3
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
						"obj-3051",
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
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3047",
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
						"obj-3047",
						2
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
						"obj-3045",
						0
					],
					"destination": [
						"obj-3057",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3057",
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
						"obj-3062",
						0
					],
					"destination": [
						"obj-3063",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3063",
						0
					],
					"destination": [
						"obj-3064",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3066",
						0
					],
					"destination": [
						"obj-3067",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3067",
						0
					],
					"destination": [
						"obj-3068",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3070",
						0
					],
					"destination": [
						"obj-3071",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3071",
						0
					],
					"destination": [
						"obj-3072",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3074",
						0
					],
					"destination": [
						"obj-3075",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3075",
						0
					],
					"destination": [
						"obj-3076",
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
				"name": "jit.gl.textureset.js",
				"bootpath": "~/Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/javascript/render",
				"patcherrelativepath": "../../../../Library/Application Support/Cycling '74/Max 8/Examples/jitter-examples/javascript/render",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "redBobVideo.mov",
				"bootpath": "~/Documents/max-visuals/grid-max/bobGrid",
				"patcherrelativepath": ".",
				"type": "MooV",
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