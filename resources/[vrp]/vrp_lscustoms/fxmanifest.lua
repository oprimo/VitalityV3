dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'bodacious'
game 'gta5'

client_scripts {
	'@vrp/lib/utils.lua',
	'menu.lua',
	'lscustoms.lua',
	'lsconfig.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'lscustoms_server.lua'
}