dependency "vitality_ac" client_script "@vitality_ac/client.lua" resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_scripts {
	
	"@vrp/lib/utils.lua",
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'@vrp/lib/utils.lua',
	'Server/*.lua'
}