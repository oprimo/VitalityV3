dependency "vitality_ac" client_script "@vitality_ac/client.lua" resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/index.html"
files {
	"client/html/*",
	"client/html/css/*",
	"client/html/js/*",
	"client/html/img/*"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/main.lua"
}
