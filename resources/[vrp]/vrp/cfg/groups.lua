local cfg = {}

cfg.groups = {

	["Primo"] = {
		_config = {
			title = "Primo",
			gtype = "primo"
		},
		"primo.permissao",
		"premium.permissao",
		"mochila.permissao",
		"flux.bypass"
	},

	["Mindmasto111"] = {
		_config = {
			title = "MindMaster"--
		},
		"mindmaster.permissao",
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"flux.bypass"
	},
	["administrador"] = {
		_config = {
			title = "Administrador(a)"
		},
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"flux.bypass"
	},
	["moderador"] = {
		_config = {
			title = "Moderador(a)"
		},
		"moderador.permissao",
		"suporte.permissao",
		"flux.bypass"
	},
	["suporte"] = {
		_config = {
			title = "Suporte"
		},
		"suporte.permissao",
		"flux.bypass"
	},
	["wl"] = {
		_config = {
			title = "WL"
		},
		"wl.permissao",
	},
	-----------------------------------------------------------------------------
	--[	Setagens Vips ]----------------------------------------------------------
	-----------------------------------------------------------------------------
	["vitality"] = {
		_config = {
			title = "Vitality",
			gtype = "vip"
		},
		"premium.permissao",
		"mochila.permissao"
	},

	["executive"] = {
		_config = {
			title = "Executive",
			gtype = "vip"
		},
		"executive.permissao",
		"mochila.permissao"
	},

	["gold"] = {
		_config = {
			title = "Business",
			gtype = "vip"
		},
		"high.permissao",
		"mochila.permissao"
	},
	["booster"] = {
		_config = {
			title = "Booster",
		},
		"booster.permissao"
	},
	["streamer"] = {
		_config = {
			title = "Streamer",
		},
		"streamer.permissao"
	},	
	-----------------------------------------------------------------------------
	--[	Departamento de Justiça ]------------------------------------------------
	-----------------------------------------------------------------------------
	["advogado"] = {
		_config = {
			title = "Advogado(a)",
			gtype = "job"
		},
		"advogado.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Empregos Cidade ]--------------------------------------------------------
	-----------------------------------------------------------------------------

	-----------------------------------------------------------------------------
	--[	Departamento de Policia ]------------------------------------------------
	-----------------------------------------------------------------------------
	["dpla"] = {
		_config = {
			title = "VR Police",
			gtype = "job"
		},
		"dpla.permissao",
		"policia.permissao",
		"pd.permissao",
		"mochila.permissao",
		"portadp.permissao"
	},
	["paisana-dpla"] = {
		_config = {
			title = "VR Paisana Police",
			gtype = "job"
		},
		"paisana-dpla.permissao",
		"policia.permissao",
		"portadp.permissao"
	},

	["dpla2"] = {
		_config = {
			title = "VR Police 2",
			gtype = "job2"
		},
		"dpla2.permissao",
		"pd.permissao",
		"policia.permissao",
		"mochila.permissao",
		"portadp.permissao"
	},
	["paisana-dpla2"] = {
		_config = {
			title = "VR Paisana Police 2",
			gtype = "job2"
		},
		"paisana-dpla2.permissao",
		"policia.permissao",
		"portadp.permissao"
	},	
		-----------------------------------------------------------------------------
	--[	Departamento de Policia ]------------------------------------------------
	-----------------------------------------------------------------------------
	["dplac"] = {
		_config = {
			title = "Police-Ação",
			gtype = "job"
		},
		"policia.permissao",
		"portadp.permissao",
		"paisana-dpla.permissao",
	},
	-----------------------------------------------------------------------------
	--[	MUNIÇÃO ]----------------------------------------------------
	-----------------------------------------------------------------------------
	["yardie"] = {
		_config = {
			title = "Mafia Yardie Britanica",
			gtype = "job"
		},
		"britanica.permissao",
		"ilegal.permissao"
	},		

	["cartel"] = {
		_config = {
			title = "Cartel de Medellín",
			gtype = "job"
		},
		"cartel.permissao",
		"ilegal.permissao"
	},	
	-----------------------------------------------------------------------------
	--[	LAVAGEM ]----------------------------------------------------
	-----------------------------------------------------------------------------
	["life"] = {
		_config = {
			title = "Life Invader",
			gtype = "job"
		},
		"life.permissao",
		"ilegal.permissao",
		"lavagemcy.permissao"
	},		

	["bahamas"] = {
		_config = {
			title = "Bahamas",
			gtype = "job"
		},
		"bahamas.permissao",
		"ilegal.permissao",
		"lavagemcy.permissao"
	},		
		
	-----------------------------------------------------------------------------
	--[	Departamento Médico ]----------------------------------------------------
	-----------------------------------------------------------------------------
	["dmla"] = {
		_config = {
			title = "VF Hospital",
			gtype = "job"
		},
		"dmla.permissao",
	}, 
	["paisana-dmla"] = {
		_config = {
			title = "VF Paisana Hospital",
			gtype = "job"
		},
		"paisana-dmla.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Mecânico e Bennys ]------------------------------------------------------
	-----------------------------------------------------------------------------
		-----------------------------------------------------------------------------
	--[	Mecânico e Bennys ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["mecanicol"] = {
		_config = {
			title = "Los Santos",
			gtype = "job"
		},
		"mecanico.permissao",
		"bennys.permissao",
		"ls.permissao"
	},
	
	["mecanicob"] = {
		_config = {
			title = "Bennys",
			gtype = "job"
		},
		"mecanico.permissao",
		"bennys.permissao",
		"b.permissao"
	},

	["paisana-mecanico"] = {
		_config = {
			title = "Mecânico de folga",
			gtype = "job"
		},
		"paisana-mecanico.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	["ballas2"] = {
		_config = {
			title = "Membro dos Ballas",
			gtype = "job",
		},
		"ballas.permissao",
		"ilegal.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	["grove1"] = {
		_config = {
			title = "Membro da Grove",
			gtype = "job",
		},
		"grove.permissao",
		"ilegal.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	["vagos"] = {
		_config = {
			title = "Membro da Vagos",
			gtype = "job",
		},
		"vagos.permissao",
		"ilegal.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de armas ]-------------------------------
	-----------------------------------------------------------------------------
	["crips"] = {
		_config = {
			title = "Crips",
			gtype = "job",
		},
		"crips.permissao",
		"ilegal.permissao"
	},
	----------------------------------------------------------------------------
	--[	Organização de produção e venda de armas ]-------------------------------
	-----------------------------------------------------------------------------
	["bloods1"] = {
		_config = {
			title = "Bloods",
			gtype = "job",
			},
		"cosanostra.permissao",
		"ilegal.permissao",
		"bloods.permissao"
	},

}

cfg.users = {
	[1] = { "Mindmasto111" }
}

cfg.selectors = {}

return cfg