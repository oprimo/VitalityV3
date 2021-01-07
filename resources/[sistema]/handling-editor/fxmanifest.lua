dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'bodacious'
game 'gta5'

files {
	'HandlingInfo.xml',
	'HandlingPresets.xml',
	'VehiclesPermissions.xml',
	'config.ini'
}
client_script {
	--'@MenuAPI/MenuAPI.net.dll',
	'MenuAPI.net.dll',
	'System.Xml.Mono.net.dll',
	'HandlingEditor.Client.net.dll'
}