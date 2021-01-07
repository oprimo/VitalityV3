dependency "vitality_ac" client_script "@vitality_ac/client.lua" resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"nui/index.html",
	"nui/inicio.html",
	"nui/motos.html",
	"nui/import.html",
	"nui/exclusive.html",
	"nui/possuidos.html",
	"nui/jquery.js",
	"nui/css.css",
	"nui/images/background.png"
}