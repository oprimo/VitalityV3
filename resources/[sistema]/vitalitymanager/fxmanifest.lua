dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'bodacious'
game 'gta5'

client_scripts {
    'vitalitymanager_shared.lua',
    'vitalitymanager_client.lua'
}

server_scripts {
    'vitalitymanager_shared.lua',
    'vitalitymanager_server.lua'
}


server_export 'getCurrentGameType'
server_export 'getCurrentMap'
server_export 'changeGameType'
server_export 'changeMap'
server_export 'doesMapSupportGameType'
server_export 'getMaps'
server_export 'roundEnded'