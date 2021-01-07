dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'bodacious'
game 'gta5'

author 'Primo'

ui_page 'nui/royale.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server.lua'
}

files {
	'nui/royale.html',
	'nui/royale.js',
    'nui/royale.css',
	'nui/imagens/*'
}