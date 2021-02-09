local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
func = {}
Tunnel.bindInterface("primo_roubos",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookrouboarmas = ""
local webhookalertoupolicia = " "

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMASLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local armalist = {
	[1] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
	[2] = { ['index'] = "dinheirosujo", ['qtd'] = 70000, ['name'] = "Dinheiro Sujo" },
	[3] = { ['index'] = "dinheirosujo", ['qtd'] = 70000, ['name'] = "Dinheiro Sujo" },
	[4] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
	[5] = { ['index'] = "dinheirosujo", ['qtd'] = 70000, ['name'] = "Dinheiro Sujo" },
	[6] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
	[7] = { ['index'] = "dinheirosujo", ['qtd'] = 70000, ['name'] = "Dinheiro Sujo" },
	[8] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
	[9] = { ['index'] = "dinheirosujo", ['qtd'] = 100000, ['name'] = "Dinheiro Sujo" },
	[10] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1, ['name'] = "FN FIVE SEVEN" },
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timers > 0 then
			timers = timers - 1
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkRobberyAmmu(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local policia = vRP.getUsersByPermission("dpla.permissao")
		if #policia >= 2 and not vRPclient.changingClothes(source) then
			if timers == 0 or not timers then
				timers = 900
				TriggerClientEvent('iniciandolojadearmas',source,id,x,y,z)
				--vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
				local random = math.random(100)
				if random >= 5 then
					SendWebhookMessage(webhookalertoupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n[ALERTA]: Polícia acionada"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					TriggerClientEvent("Notify",source,"aviso","Aviso","A policia foi acionada.",8000)
				--	TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
					vRP.searchTimer(user_id,parseInt())
					for l,w in pairs(policia) do
						local player = vRP.getUserSource(parseInt(w))
						if player then
							async(function()
								local ids = idgens:gen()
								vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
								blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
								TriggerClientEvent('chatMessage',player,"190",{64,64,255},"O roubo começou na ^1Loja de armas^0, dirija-se até o local e intercepte o assaltante.")
								SetTimeout(20000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
							end)
						end
					end
				else
					SendWebhookMessage(webhookalertoupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n[ALERTA]: Polícia NÃO foi acionada."..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			else
				TriggerClientEvent("Notify",source,"aviso","Aviso","O seguro ainda não cobriu o último assalto, aguarde <b>"..timers.." segundos</b> até a cobertura.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Aviso","Número insuficiente de policiais no momento.",8000)
		end
	end
end

function func.giveAward()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		local randlist = math.random(100)
		if randlist >= 90 then
			local randitem = math.random(#armalist)
			TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você recebeu <b>"..armalist[randitem].qtd.."</b>x <b>"..armalist[randitem].name.."</b>.",8000)
			SendWebhookMessage(webhookrouboarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n [ROUBOU]: "..armalist[randitem].qtd.." "..armalist[randitem].name.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.giveInventoryItem(user_id,armalist[randitem].index,armalist[randitem].qtd)
		else
			local randmoney = math.random(50000,70000)
			TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você recebeu "..randmoney.."x <b>dinheiro sujo</b>.",8000)
			SendWebhookMessage(webhookrouboarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n [ROUBOU]: "..randmoney.." dinheiro sujo"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vRP.giveInventoryItem(user_id, "dinheirosujo", randmoney)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return not (vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"paramedico.permissao") or vRP.hasPermission(user_id,"paisanapolicia.permissao") or vRP.hasPermission(user_id,"paisanaparamedico.permissao"))
end