dependency "vitality_ac" client_script "@vitality_ac/client.lua" fx_version 'adamant'
game {'gta5'}

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

files {
	"nui/app.js",
	"nui/index.html",
	"nui/style.css"
}

ui_page {
	"nui/index.html"
}