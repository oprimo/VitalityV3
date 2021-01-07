local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
func = {}
Tunnel.bindInterface("vitality_cashregister",func)
src = Tunnel.getInterface("vitality_cashregister")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookregistradora = "https://discord.com/api/webhooks/784773991419740201/7oGmDwKrI4EUEP9zCNP6hMuFv-4gCp9w6erSBQLAmiHfQf5h267M-qGWW1tXTC3QlX5g"
local webhookcancelregistradora = "https://discordapp.com/api/webhooks/788931006215880746/AW0AhLjY75ish9YjUXAhrhXCtgoAeauPv0A5ZRvN5wF5nQABWrdqTuo3BzuYWPWSdazp"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkRobbery(id,x,y,z,head)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local policia = vRP.getUsersByPermission("dpla.permissao")
		if #policia >= 1 then
			if timers[id] == 0 or not timers[id] then
				timers[id] = 600
				TriggerClientEvent('iniciandoregistradora',source,head,x,y,z)
				vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
				local random = math.random(100)
				if random >= 10 then
					TriggerClientEvent("Notify",source,"aviso", "Aviso","A policia foi acionada.",8000)
					TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
					vRPclient.setStandBY(source,parseInt(60))
					for l,w in pairs(policia) do
						local player = vRP.getUserSource(parseInt(w))
						if player then
							async(function()
								local ids = idgens:gen()
								vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
								blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
								TriggerClientEvent('chatMessage',player,"911",{64,64,255},"O roubo começou na ^1Caixa Registradora^0, dirija-se até o local e intercepte o assaltante.")
								SetTimeout(20000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
							end)
						end
					end
				end
				SendWebhookMessage(webhookregistradora,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				SetTimeout(10000,function()
					if src.InAndamento(source) then
						vRP.giveInventoryItem(user_id,"dinheirosujo",math.random(1500,2300))
						src.CancelarRoubo(source)
					else
						timers[id] = 300
						SendWebhookMessage(webhookcancelregistradora,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." Cancelou o ROUBO"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						TriggerClientEvent('Notify',source,"negado", "Negado", "O Roubo foi cancelado! E você não receberá nada!")
					end
				end)
			else
				TriggerClientEvent("Notify",source,"aviso", "Aviso","A registradora está vazia, aguarde <b>"..timers[id].." segundos</b> até que tenha dinheiro novamente.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Aviso","Número insuficiente de policiais no momento.",8000)
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return not (vRP.hasPermission(user_id,"dpla.permissao") or vRP.hasPermission(user_id,"paramedico.permissao") or vRP.hasPermission(user_id,"paisanapolicia.permissao") or vRP.hasPermission(user_id,"paisanaparamedico.permissao"))
end