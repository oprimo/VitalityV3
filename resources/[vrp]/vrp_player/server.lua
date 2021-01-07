local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local idgens = Tools.newIDGenerator()

src = {}
Tunnel.bindInterface("vrp_player",src)

vDIAGNOSTIC = Tunnel.getInterface("vrp_diagnostic")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ WEBHOOK ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookenviardinheiro = "https://discordapp.com/api/webhooks/788941988598382622/c-Xv1P5kXH2fQAewJeSRhwQAjgnOXINgP9uigmbRntQHdEVaSRhlpqRdWSpPQcAMakWe"
local webhookgarmas = "https://discord.com/api/webhooks/784773079451566101/uNtcshWWcRHeyuiLkLY7ZhU0x4kQBk5GW-5I8QxU00ofdLmHCDi7nOjAWNwmDwfzNowp"
local webhooksaquear = "https://discord.com/api/webhooks/784773346343780402/yplfGuClxl1Q1BX3n8XLwjkLFzkYwoeq0PqHlHrlbtnnQdjgj2rk8hkVhpLEbtGHRCPE"
local webhookroubar = "https://discord.com/api/webhooks/784773641023651851/8h4o-FLuZKVYubuMw8xvIVg8N_3jrN31QJTmryptXoRs9vVxlIxHg13XhHO2a1YcbcW8"
local logAdminItem = "https://discord.com/api/webhooks/793239894373826580/ZnwePSZv9c5jr0TjyDzLf9B2UAZGmRjV0-gBiOQ5FDUO5QhNvceTaRID-7jG0fuKwpof"
local webhookcrash = "https://discord.com/api/webhooks/793239894373826580/ZnwePSZv9c5jr0TjyDzLf9B2UAZGmRjV0-gBiOQ5FDUO5QhNvceTaRID-7jG0fuKwpof"
local webhookadmiro2 = "https://discord.com/api/webhooks/793239894373826580/ZnwePSZv9c5jr0TjyDzLf9B2UAZGmRjV0-gBiOQ5FDUO5QhNvceTaRID-7jG0fuKwpof"


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
--[ CHECK ROUPAS ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"high.permissao") or vRP.hasPermission(user_id,"premium.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
			return false
		end
	end
end

--[[ RegisterCommand('roubar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia > 0 then
			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo?",30) then
				local vida = vRPclient.getHealth(nplayer)
				if vida <= 100 then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											vRP.giveInventoryItem(user_id,k,v.amount)
										end
									else
										TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								end
							else
								TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
						vRPclient.setStandBY(source,parseInt(600))
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"importante","Importante","Roubo concluido com sucesso.")
					end)
				else
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
							end
						else
							TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"aviso","Aviso","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Roubo concluido com sucesso.")
				--	local apreendidos = table.concat(itens_saque, "\n")
					SendWebhookMessage(webhookroubar,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.."\n[SAQUEOU]: "..nuser_id.." "..nidentity.name.." " ..nidentity.firstname .. "\n" .. ndata.inventory ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			else
				TriggerClientEvent("Notify",source,"importante","Aviso","Importante","A pessoa está resistindo ao roubo.")
			end
		else
			TriggerClientEvent("Notify",source,"aviso","aviso","Aviso","Número insuficiente de policiais no momento.")
		end
	end
end)]]


-----------------------------------------------------------------------------------------------------------------------------------------


RegisterCommand('saquear',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		if vRPclient.isInComa(nplayer) then
			local identity_user = vRP.getUserIdentity(user_id)
			local nidentity = vRP.getUserIdentity(nuser_id)
			local policia = vRP.getUsersByPermission("policia.permissao")
			local itens_saque = {}
			if #policia >= 0 then
				local vida = vRPclient.getHealth(nplayer)
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
				TriggerClientEvent("progress",source,5000,"saqueando")
				SetTimeout(5000,function()
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
								--		table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList(k).." [QUANTIDADE]: "..v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								if not vRP.hasPermission(nuser_id,"policia.permissao") then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								--	table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wbody|"..k).." [QUANTIDADE]: "..1)
								else
									-----
								end
							end
						else
							TriggerClientEvent("Notify",source,"negado","Negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									if not vRP.hasPermission(nuser_id,"policia.permissao") then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									--	table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wammo|"..k).." [QTD]: "..v.ammo)
									else
										---
									end
								end
							else
								TriggerClientEvent("Notify",source,"negado","Negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRP.searchAddTime(user_id,600)
					vRPclient._stopAnim(source,false)
					TriggerClientEvent('cancelando',source,false)
					local apreendidos = table.concat(itens_saque, "\n")
					TriggerClientEvent("Notify",source,"importante","Saque concluido com sucesso.")
					SendWebhookMessage(webhooksaquear,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.."\n[SAQUEOU]: "..nuser_id.." "..nidentity.name.." " ..nidentity.firstname .. "\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end)
			else
				TriggerClientEvent("Notify",source,"aviso","Aviso","Número insuficiente de policiais no momento.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Negado","Você só pode saquear quem está em coma.")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
    ["mecanico"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 12,0 },
			["4"] = { 39,0 },
			["5"] = { -1,0 },
			["6"] = { 24,0 },
			["7"] = { 109,0 },
			["8"] = { 89,0 },
			["9"] = { 14,0 },
			["10"] = { -1,0 },
			["11"] = { 66,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 14,0 },
			["4"] = { 38,0 },
			["5"] = { -1,0 },
			["6"] = { 24,0 },
			["7"] = { 2,0 },
			["8"] = { 56,0 },
			["9"] = { 35,0 },
			["10"] = { -1,0 },
			["11"] = { 59,0 }
		}
	},
	["askov"] = {
		[1885233650] = {                                      
			["1"] = { 131,0 },
			["3"] = { 19,0 },
			["4"] = { 54,6 },
			["5"] = { 26,24 },
			["6"] = { 6,4 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["9"] = { 0,0 },
			["10"] = { -1,0 },
			["11"] = { 211,3 },
			["p0"] = { 130,0 },
			["p1"] = { 23,4 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 114,1 },
			["4"] = { 92,20 },
			["5"] = { -1,0 },
			["6"] = { 86,2 },
			["7"] = { -1,0 },
			["8"] = { 54,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 286,0 },
			["p1"] = { 25,0 }
		}
	},
    ["lixeiro"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 17,0 },
			["4"] = { 36,0 },
			["5"] = { -1,0 },
			["6"] = { 27,0 },
			["7"] = { -1,0 },
			["8"] = { 59,0 },
			["10"] = { -1,0 },
			["11"] = { 57,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 18,0 },
			["4"] = { 35,0 },
			["5"] = { -1,0 },
			["6"] = { 26,0 },
			["7"] = { -1,0 },
			["8"] = { 36,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 50,0 }
		}
	},
	["carteiro"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 0,0 },
			["4"] = { 17,10 },
			["5"] = { 40,0 },
			["6"] = { 7,0 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["10"] = { -1,0 },
			["11"] = { 242,3 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 14,0 },
			["4"] = { 14,1 },
			["5"] = { 40,0 },
			["6"] = { 10,1 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 250,3 }
		}
	},
	["askov2"] = {
		[1885233650] = {                                      
			["1"] = { 131,0 },
			["3"] = { 19,0 },
			["4"] = { 54,6 },
			["5"] = { 26,24 },
			["6"] = { 6,4 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["9"] = { 0,0 },
			["10"] = { -1,0 },
			["11"] = { 271,4 },
			["p0"] = { 130,0 },
			["p1"] = { 23,4 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 45,0 },
			["4"] = { 25,10 },
			["5"] = { -1,0 },
			["6"] = { 21,1 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 171,4 },
			["p0"] = { 104,23 },
			["p1"] = { 11,2 }
		}
	},
	["lenhador"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 62,0 },
			["4"] = { 89,23 },
			["5"] = { -1,0 },
			["6"] = { 12,0 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["10"] = { -1,0 },
			["11"] = { 15,0 },
			["p0"] = { 77,13 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 71,0 },
			["4"] = { 92,23 },
			["5"] = { -1,0 },
			["6"] = { 69,0 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 15,0 },
			["p1"] = { 25,0 }
		}
	},
	["taxista"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 11,0 },
			["4"] = { 35,0 },
			["5"] = { -1,0 },
			["6"] = { 10,0 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["10"] = { -1,0 },
			["11"] = { 13,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 0,0 },
			["4"] = { 112,0 },
			["5"] = { -1,0 },
			["6"] = { 6,0 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 27,0 }
		}
	},
	["caminhoneiro"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 0,0 },
			["4"] = { 63,0 },
			["5"] = { -1,0 },
			["6"] = { 27,0 },
			["7"] = { -1,0 },
			["8"] = { 81,0 },
			["10"] = { -1,0 },
			["11"] = { 173,3 },
			["p1"] = { 8,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 14,0 },
			["4"] = { 74,5 },
			["5"] = { -1,0 },
			["6"] = { 9,0 },
			["7"] = { -1,0 },
			["8"] = { 92,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 175,3 },
			["p1"] = { 11,0 }
		}
	},
	["motocross"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 111,0 },
			["4"] = { 67,3 },
			["5"] = { -1,0 },
			["6"] = { 47,3 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["10"] = { -1,0 },
			["11"] = { 152,0 },
			["p1"] = { 25,5 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 128,0 },
			["4"] = { 69,3 },
			["5"] = { -1,0 },
			["6"] = { 48,3 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 149,0 },
			["p1"] = { 27,5 }
		}
	},
	["mergulho"] = {
		[1885233650] = {
			["1"] = { 122,0 },
			["3"] = { 31,0 },
			["4"] = { 94,0 },
			["5"] = { -1,0 },
			["6"] = { 67,0 },
			["7"] = { -1,0 },
			["8"] = { 123,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 243,0 },			
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { 122,0 },
			["3"] = { 18,0 },
			["4"] = { 97,0 },
			["5"] = { -1,0 },
			["6"] = { 70,0 },
			["7"] = { -1,0 },
			["8"] = { 153,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 251,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pelado"] = {
		[1885233650] = {                                      
			["1"] = { -1,0 },
			["3"] = { 15,0 },
			["4"] = { 21,0 },
			["5"] = { -1,0 },
			["6"] = { 34,0 },
			["7"] = { -1,0 },
			["8"] = { 15,0 },
			["10"] = { -1,0 },
			["11"] = { 15,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 15,0 },
			["4"] = { 21,0 },
			["5"] = { -1,0 },
			["6"] = { 35,0 },
			["7"] = { -1,0 },
			["8"] = { 6,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 82,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			["1"] = { -1,0 },
			["3"] = { 15,0 },
			["4"] = { 61,0 },
			["5"] = { -1,0 },
			["6"] = { 16,0 },
			["7"] = { -1,0 },			
			["8"] = { 15,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 104,0 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 0,0 },
			["4"] = { 57,0 },
			["5"] = { -1,0 },
			["6"] = { 16,0 },
			["7"] = { -1,0 },		
			["8"] = { 7,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 105,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["gesso"] = {
		[1885233650] = {
			["1"] = { -1,0 },
			["3"] = { 1,0 },
			["4"] = { 84,9 },
			["5"] = { -1,0 },
			["6"] = { 13,0 },
			["7"] = { -1,0 },			
			["8"] = { -1,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 186,9 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 },
			["3"] = { 3,0 },
			["4"] = { 86,9 },
			["5"] = { -1,0 },
			["6"] = { 12,0 },
			["7"] = { -1,0 },		
			["8"] = { -1,0 },
			["9"] = { -1,0 },
			["10"] = { -1,0 },
			["11"] = { 188,9 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["staff"] = {
		[1885233650] = {
			["1"] = { 17,0 }, -- máscara
			["3"] = { 0,0 }, -- maos
			["4"] = { 87,14 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 7,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { -1,0 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 271,2 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 15,0 }, -- oculos
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 85,0 }, -- maos
			["4"] = { 92,22 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 52,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { -1,0 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 141,0 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 3,9 }, -- oculos
		}
	},
	["motorista"] = {
		[1885233650] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 0,0 }, -- maos
			["4"] = { 10,0 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 21,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { -1,0 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 242,1 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 7,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 14,0 }, -- maos
			["4"] = { 37,0 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 27,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { -1,0 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 250,1 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["cacador"] = {
		[1885233650] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 97,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { 2,2 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 100,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { 44,1 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["aluno"] = {
		[1885233650] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 97,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { 2,2 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 100,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { 44,1 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["cadete"] = {
		[1885233650] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 97,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { 2,2 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 20,0 }, -- maos
			["4"] = { 100,18 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { 44,1 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pescador"] = {
		[1885233650] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 0,0 }, -- maos
			["4"] = { 98,19 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 }, -- acessorios		
			["8"] = { 85,2 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 247,12 }, -- jaqueta		
			["p0"] = { 104,20 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			["1"] = { -1,0 }, -- máscara
			["3"] = { 14,0 }, -- maos
			["4"] = { 101,19 }, -- calça
			["5"] = { -1,0 }, -- mochila
			["6"] = { 24,0 }, -- sapato
			["7"] = { -1,0 },  -- acessorios		
			["8"] = { 88,1 }, -- blusa
			["9"] = { -1,0 }, -- colete
			["10"] = { -1,0 }, -- adesivo
			["11"] = { 255,13 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 11,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}

RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) and not vRP.castReturn(source,user_id) and not vRPclient.busyAction(source) then
				if args[1] then
					local custom = roupas[tostring(args[1])]
					if custom then
						local old_custom = vRPclient.getCustomization(source)
						local idle_copy = {}

						idle_copy = vRP.save_idle_custom(source,old_custom)
						idle_copy.modelhash = nil

						for l,w in pairs(custom[old_custom.modelhash]) do
							idle_copy[l] = w
						end
						vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
						Citizen.Wait(2500)
						vRPclient._stopAnim(source,true)
						vRPclient._setCustomization(source,idle_copy)
					end
				else
					vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
					Citizen.Wait(2500)
					vRPclient._stopAnim(source,true)
					vRP.removeCloak(source)
				end
			end
		end
	end
end)

RegisterCommand('roupas2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if vRP.hasPermission(user_id,"mindmaster.permissao") or vRP.hasPermission(user_id,"dmla.permissao") then
				local nplayer = vRPclient.getNearestPlayer(source,2)
				if not vRP.searchReturn(nplayer,user_id) then
					if nplayer then
						if args[1] then
							local custom = roupas[tostring(args[1])]
							if custom then
								local old_custom = vRPclient.getCustomization(nplayer)
								local idle_copy = {}

								idle_copy = vRP.save_idle_custom(nplayer,old_custom)
								idle_copy.modelhash = nil

								for l,w in pairs(custom[old_custom.modelhash]) do
									idle_copy[l] = w
								end
								vRPclient._setCustomization(nplayer,idle_copy)
							end
						else
							vRP.removeCloak(nplayer)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ITEMLIST ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários legais ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["mochila"] = { index = "mochila", nome = "Mochila" },
	["celular"] = { index = "celular", nome = "iFruit XI" },
	["radio"] = { index = "radio", nome = "WalkTalk" },
	["mascara"] = { index = "mascara", nome = "Mascara" },
	["identidade"] = { index = "identidade", nome = "Identidade" },
	["colete"] = { index = "colete", nome = "Colete Balístico" },
	["militec"] = { index = "militec", nome = "Militec" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem" },
	["roupas"] = { index = "roupas", nome = "Roupas", },
	["pecadearma"] = { index = "pecadearma", nome = "Peça De Arma", },
	---------------------------------------------------------------------------------------------------
	--[ Ultilitários Ilegais]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["aco"] = { index = "aco", nome = "Aco" },
	["reagente"] = { index = "reagente", nome = "Reagente" },
	["kiteletronico"] = { index = "kiteletronico", nome = "Kit Eletronico" },
	["pano"] = { index = "pano", nome = "Pano" },
	["plastico"] = { index = "plastico", nome = "Plastico" },
	["compattach"] = { index = "compattach", nome = "Comp Attachs" },
	["cordas"] = { index = "cordas", nome = "Cordas" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["algema"] = { index = "algema", nome = "Algema" },
	["distintivo"] = { index = "distintivo", nome = "Distintivo" },
	["pendrive"] = { index = "pendrive", nome = "Pen Drive" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["placa"] = { index = "placa", nome = "Placa" },
	["c4"] = { index = "c4", nome = "C4" },
	["serra"] = { index = "serra", nome = "Serra" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	["embalagem"] = { index = "embalagem", nome = "Embalagem" },
	---------------------------------------------------------------------------------------------------
	--[ Empregos ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de lixo" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["laranja"] = { index = "laranja", nome = "Laranja", },
	["lanche"] = { index = "lanche", nome = "Tacos", },
	["graos"] = { index = "graos", nome = "Graos" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["isca"] = { index = "isca", nome = "Isca" },
	["caixa"] = { index = "caixa", nome = "Caixa",},
	["caixadeuva"] = { index = "caixadeuva", nome = "Caixa Com Uva",},
	["tubaraomartelo"] = { index = "tubaraomartelo", nome = "Tubarão Martelo",},
	["corvina"] = { index = "corvina", nome = "Corvina",},
	["salmao"] = { index = "salamo", nome = "Salmao",},
	["pacu"] = { index = "pacu", nome = "Pacu",},
	["pintado"] = { index = "pintado", nome = "Pintado",},
	["pintado"] = { index = "pirarucu", nome = "Pirarucu",},
	["tilapia"] = { index = "tilapia", nome = "Tilapia",},
	["tucunare"] = { index = "tucunare", nome = "Tucunare",},
	---------------------------------------------------------------------------------------------------
	--[ Bebidas Não Alcoólicas ]-----------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["energetico"] = { index = "energetico", nome = "Energético" },
	---------------------------------------------------------------------------------------------------
	--[ Remédios ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["paracetamil"] = { index = "paracetamil", nome = "Paracetamil" },
	["voltarom"] = { index = "voltarom", nome = "Voltarom" },
	["trandrylux"] = { index = "trandrylux", nome = "Trandrylux" },
	["dorfrex"] = { index = "dorfrex", nome = "Dorfrex" },
	["buscopom"] = { index = "buscopom", nome = "Buscopom" },
	--------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 01 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina", },
	--[ Sub produto ]----------------------------------------------------------------------------------
	["acidobateria"] = { index = "acidobateria", nome = "Ácido de Bateria", },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina", },

	--------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de LSD ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["lsd"] = { index = "lsd", nome = "LSD", },
	["acidolisergico"] = { index = "acidolisergico", nome = "Ácido lisérgico", },
	["complsd"] = { index = "complsd", nome = "Comp. LSD", },	
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["cocaina"] = { index = "cocaina", nome = "Cocaína", },
	--[ Sub produto ]----------------------------------------------------------------------------------
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca", },
	["cocamisturada"] = { index = "cocamisturada", nome = "Coca Misurada", },
	---------------------------------------------------------------------------------------------------
	--[ Organização Maconha ]--------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["maconha"] = { index = "maconha", nome = "Maconha" },
	["lancaperfume"] = { index = "lancaperfume", nome = "Lança Perfume" },
	--[ Sub produto ]----------------------------------------
	["maconhamacerada"] = { index = "maconhamacerada", nome = "Maconha Cerada" },
	["folhademaconha"] = { index = "folhademaconha", nome = "Folha de Maconha" },
	---------------------------------------------------------------------------------------------------
	--[ Organização Criminosa de Drogas 02 ]-----------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["molas"] = { index = "molas", nome = "Molas" },
	["placa-metal"] = { index = "placa-metal", nome = "Placa de Metal" },
	["gatilho"] = { index = "gatilho", nome = "Gatilho", },
	["capsulas"] = { index = "capsulas", nome = "Capsulas" },
	["polvora"] = { index = "polvora", nome = "Polvora" },
	["keysinvasao"] = { index = "keysinvasao", nome = "Cartão" },
	---------------------------------------------------------------------------------------------------
	--[ ARMAS / OUTROS ]-------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor" },
	---------------------------------------------------------------------------------------------------
	--[ CORPO A CORPO ]--------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------	
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
    ---------------------------------------------------------------------------------------------------
    --[ PISTOLA ]-------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven", },--wbody|WEAPON_SPECIALCARBINE_mk2
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven", },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19", type = "equipar" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19", },
	["wbody|WEAPON_ASSAULTRIFLE_MK2"] = { index = "akmk2", nome = "AK 47", },
	["wammo|WEAPON_ASSAULTRIFLE_MK2"] = { index = "m-akmk2", nome = "M.AK47",},
	["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser", },
	["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser", },--
	["wbody|WEAPON_PISTOL50"] = { index = "deserteagle", nome = "Desert Eagle", },--
	["wammo|WEAPON_PISTOL50"] = { index = "m-deserteagle", nome = "M.Desert Eagle", },
	["wbody|WEAPON_SNSPISTOL_MK2"] = { index = "amt800", nome = "Pistol Amt800", },
	["wammo|WEAPON_SNSPISTOL_MK2"] = { index = "m-amt800", nome = "M.Amt800", },
	 ---------------------------------------------------------------------------------------------------
    --[ SMG ]------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5" },
	["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5" },
	["wbody|WEAPON_SMG_MK2"] = { index = "smg", nome = "SMG", },--
	["wammo|WEAPON_SMG_MK2"] = { index = "m-smg", nome = "M.SMG", },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mtar", nome = "Mtar", },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mtar", nome = "M.Mtar", },--
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer", },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer", },
	---------------------------------------------------------------------------------------------------
	--[ SHOTGUN ]--------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870" },
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = { index = "sawnoffshotgun", nome = "Shotgun Sawnoff", },
	["wammo|WEAPON_SAWNOFFSHOTGUN"] = { index = "m-sawnoffshotgun", nome = "M.Shotgun Sawnoff", },
    ---------------------------------------------------------------------------------------------------
    --[ FUZIL ]----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------
    ["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a4", nome = "M4A4", },
	["wbody|WEAPON_CARBINERIFLE_MK2"] = { index = "carabinemk2", nome = "Carabina MK2", },
	["wammo|WEAPON_CARBINERIFLE_MK2"] = { index = "m-carabinemk2", nome = "M.Carabina MK2", },
	["wbody|WEAPON_SPECIALCARBINE_MK2"] = { index = "g36c", nome = "G36 C", },--
	["wammo|WEAPON_SPECIALCARBINE_MK2"] = { index = "m-g36c", nome = "M.G36 C", }
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ITEM ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"mindmaster.permissao") then
        if args[1] and args[2] and itemlist[args[1]] ~= nil then
            vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
            SendWebhookMessage(webhookadmiro2,"\n[ID] "..user_id.."\n [Item] "..args[1].."\n [Quantidade] "..vRP.format(parseInt(args[2]))..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S")..".", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png",  false, false)
        end
    end
end) 
------------
-- [ /COR ]
-----------
RegisterCommand('cor', function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,'mindmaster.permissao') or vRP.hasPermission(user_id,'booster.permissao') or vRP.hasPermission(user_id,'streamer.permissao') or vRP.hasPermission(user_id,'high.permissao') or vRP.hasPermission(user_id,'premium.permissao') or vRP.hasPermission(user_id,'intermedium.permissao') or vRP.getInventoryItemAmount(user_id,"tinta") >= 1 then
		TriggerClientEvent('changeWeaponColor', source, args[1])
	else
		TriggerClientEvent("Notify",source,"negado","Negado","Apenas <b>VIP's</b> e <b>BOOST</b> podem utilizar este comando")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /staff
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('staff',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "suporte.permissao","suporte.permissao","suporte.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,50,5},rawCommand:sub(6))
					end)
				end
			end
		end
	end
end)


----------------------------------------------------------------------------------------------

RegisterCommand('status',function(source,args,rawCommand)
    local onlinePlayers = GetNumPlayerIndices()
    local policia = vRP.getUsersByPermission("dpla.permissao")
    local paramedico = vRP.getUsersByPermission("dmla.permissao")
    local mec = vRP.getUsersByPermission("mecanico.permissao")
    local staff = vRP.getUsersByPermission("suporte.permissao")
	local ilegal = vRP.getUsersByPermission("ilegal.permissao")
    local user_id = vRP.getUserId(source) 
    if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"mindmaster.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then       
        TriggerClientEvent("Notify",source,"aviso","Status","<bold><b>Jogadores</b>: <b>"..onlinePlayers.."<br>Administração</b>: <b>"..#staff.."<br>Policiais</b>: <b>"..#policia.."<br>Ilegal</b>: <b>"..#ilegal.."<br>Paramédicos</b>: <b>"..#paramedico.."<br>Mecânicos</b>: <b>"..#mec.."</b></bold>.")
end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ USER VEHS [ADMIN]]-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"administrador.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ RESKIN ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reskin',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
	vRPclient._setCustomization(vRPclient.getCustomization(source))		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ID ]---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SALÁRIO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local salarios = {
	{ ['permissao'] = "booster.permissao", ['nome'] = "Booster", ['payment'] = 500 },
	{ ['permissao'] = "executive.permissao", ['nome'] = "Premium", ['payment'] = 4000 },
	{ ['permissao'] = "premium.permissao", ['nome'] = "Premium", ['payment'] = 6000 },
	{ ['permissao'] = "high.permissao", ['nome'] = "High", ['payment'] = 500 },
	{ ['permissao'] = "news.permissao", ['nome'] = "News", ['payment'] = 6000 },
	{ ['permissao'] = "juiz.permissao", ['nome'] = "Juiz(a)", ['payment'] = 8500 },
	{ ['permissao'] = "advogado.permissao", ['nome'] = "Advogado(a)", ['payment'] = 6500 },
	{ ['permissao'] = "conce.permissao", ['nome'] = "Dealership", ['payment'] = 1000 },
	{ ['permissao'] = "dpla.permissao", ['nome'] = "Police", ['payment'] = 10000 },
	{ ['permissao'] = "dpla.permissao", ['nome'] = "Police", ['payment'] = 10000 },
	{ ['permissao'] = "dpla2.permissao", ['nome'] = "Hospital", ['payment'] = 10000 },
	{ ['permissao'] = "mecanico.permissao", ['nome'] = "Mêcanico", ['payment'] = 5000 }
}

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(salarios) do
			if vRP.hasPermission(user_id,v.permissao) then
				TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
				TriggerClientEvent("Notify",source,"financeiro","Financeiro","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
				vRP.giveBankMoney(user_id,parseInt(v.payment))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ NOCARJACK ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ AFKSYSTEM ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,"administrador.permissao") then
        DropPlayer(source,"Voce foi desconectado por ficar ausente.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SEQUESTRO ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"importante","Importante","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ENVIAR ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	local identity = vRP.getUserIdentity(user_id)
	  local identitynu = vRP.getUserIdentity(nuser_id)
	  
	if nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"financeiro","Financeiro","Enviou <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",nplayer,"financeiro","Financeiro","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b>.",8000)
			SendWebhookMessage(webhookenviardinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[1])).." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"negado","Negado","Não tem a quantia que deseja enviar.",8000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ GARMAS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local rtime = math.random(1,1)

	TriggerClientEvent("Notify",source,"aviso","Aviso","<b>Aguarde!</b> Suas armas estão sendo desequipadas.",1000)
	--TriggerClientEvent("progress",source,1,"guardando")

	SetTimeout(1*rtime,function()
		if user_id then
			local weapons = vRPclient.replaceWeapons(source,{})
			for k,v in pairs(weapons) do
				vRP.giveInventoryItem(user_id,"wbody|"..k,1)
				if v.ammo > 0 then
					vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
				end
				SendWebhookMessage(webhookgarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList("wbody|"..k).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
			--TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
		end
	end)
	SetTimeout(10000,function()
		TriggerClientEvent("Notify",source,"sucesso","Sucesso","Guardou seu armamento na mochila.")
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRYTOW ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRUNK ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ WINS ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ HOOD ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ DOORS ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CALL ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('call',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false
		if args[1] == "adm" then
			players = vRP.getUsersByPermission("suporte.permissao")	
			especialidade = "Administradores"
		end
		local adm = ""
		if especialidade == "Administradores" then
			adm = "[ADM] "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		if #players == 0  and especialidade ~= "policiais" then
			TriggerClientEvent("Notify",source,"importante","Importante","Não há "..especialidade.." em serviço.")
		else
			local identitys = vRP.getUserIdentity(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Sucesso","Chamado enviado com sucesso.")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player and player ~= uplayer then
					async(function()
						vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
						TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
						local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
						if ok then
							if not answered then
								answered = true
								local identity = vRP.getUserIdentity(nuser_id)
								TriggerClientEvent("Notify",source,"importante","Importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								vRPclient._setGPS(player,x,y)
							else
								TriggerClientEvent("Notify",player,"importante","Importante","Chamado ja foi atendido por outra pessoa.")
								vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
						local id = idgens:gen()
						blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
						SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('revistar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(user_id)
		local weapons = vRPclient.getWeapons(nplayer)
		local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)

	--	TriggerClientEvent('cancelando',source,true)
		--TriggerClientEvent('cancelando',nplayer,true)
		--TriggerClientEvent('carregar',nplayer,source)
		--vRPclient._playAnim(source,false,{{"misscarsteal4@director_grip","end_loop_grip"}},true)
		--vRPclient._playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
		TriggerClientEvent("progress",source,5000,"revistando")
		SetTimeout(5000,function()

			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
			if data and data.inventory then
				for k,v in pairs(data.inventory) do
					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k))
				end
			end
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
			for k,v in pairs(weapons) do
				if v.ammo < 1 then
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k))
				else
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k).." | "..vRP.format(parseInt(v.ammo)).."x Munições")
				end
			end

			-- vRPclient._stopAnim(source,false)
			-- vRPclient._stopAnim(nplayer,false)
			--TriggerClientEvent('cancelando',source,false)
			--TriggerClientEvent('cancelando',nplayer,false)
		--	TriggerClientEvent('carregar',nplayer,source)
			TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
		end)
		TriggerClientEvent("Notify",nplayer,"aviso","Aviso","Você está sendo <b>Revistado</b> por <b>"..identity.name.." "..identity.firstname.."</b>.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ OBJETOS ]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('objetos',function(source,rawCommand)
    local user_id = vRP.getUserId(source)
        vRPclient._setCustomization(source,vRPclient.getCustomization(source))
        vRP.removeCloak(source)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MEC ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mec',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Central Mecânica",{255,128,0},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MR ]---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "mecanico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,191,128},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setblusa",source,args[1],args[2])
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcolete",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setjaqueta",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmaos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					
					TriggerClientEvent("setcalca",source,args[1],args[2])
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setacessorios",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /USE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('use',function(source,args,rawCommand)
	if args[1] == nil then
		return
	end
	local user_id = vRP.getUserId(source)
if args[1] == "energetico" then
		if vRP.tryGetInventoryItem(user_id,"energetico",1) then
			TriggerClientEvent('cancelando',source,true)
			vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)
			TriggerClientEvent("progress",source,10000,"bebendo")
			SetTimeout(10000,function()
				TriggerClientEvent('energeticos',source,true)
				TriggerClientEvent('cancelando',source,false)
				vRPclient._DeletarObjeto(source)
				TriggerClientEvent("Notify",source,"sucesso","Sucesso","Energetico utilizado com sucesso.")
			end)
			SetTimeout(60000,function()
				TriggerClientEvent('energeticos',source,false)
				TriggerClientEvent("Notify",source,"aviso","Aviso","O efeito da Energetico passou e o seu sangue voltou a bombear como o normal")
			end)
		else
			TriggerClientEvent("Notify",source,"aviso","Aviso","Energetico não encontrado na mochila.")
		end
			end
		end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setsapatos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
--------------------------------------------------------------------------------------------------------------------------------
-- RGB 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rgb',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"administrador.permissao") then
        TriggerClientEvent('rbgcarfaizen',source)
        TriggerClientEvent("Notify",source,"sucesso","Você tunou o <b>veículo</b> RGB com sucesso.")
    end
end)

RegisterServerEvent('Tackle:Server:TacklePlayer')
AddEventHandler('Tackle:Server:TacklePlayer',function(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
	TriggerClientEvent("Tackle:Client:TacklePlayer",Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
end)


--------------------------
-- CALLBACK 
---------------------------

RegisterCommand('callback',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if args[1] then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        local tplayer = vRP.getUserSource(parseInt(args[1]))

        TriggerClientEvent('chatMessage',tplayer,"(ADMINISTRAÇÃO)",{5, 230, 255},mensagem)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkAttachs()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"compattach") >= 1 or vRP.hasPermission(user_id,"premium.permissao")  or vRP.hasPermission(user_id,"high.permissao") then
			return true
		else
		
			return false
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkItem()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"cordas") >= 1 then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Cordas</b> na mochila para carregar.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMATION STOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)

