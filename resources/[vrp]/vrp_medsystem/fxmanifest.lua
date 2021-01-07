dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'bodacious'
game 'gta5'

client_scripts {
	'@vrp/lib/utils.lua',
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}
