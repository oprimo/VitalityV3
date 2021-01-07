local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
doug = {}
Tunnel.bindInterface("vitality_vendas",doug)

local webhookcontrabando = "https://discord.com/api/webhooks/784929311308120074/FtkyqNv2NuX357rteDhk74yJJpusbXL-jgmeBqFW_8Aohn1JRgk4M_pVCeflHSaVbYhD"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local key = {
    { item = "placa" },
    { item = "molas" },
	{ item = "gatilho" },
	{ item = "embalagem" },
 	{ item = "maconhamacerada" },
	{ item = "acidolisergico" },
	{ item = "folhadecoca" }

}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-key")
AddEventHandler("produzir-key",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if user_id then
		for k,v in pairs(key) do
			if item == v.item then
				if item == "placa" then
					if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("placa-metal") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 5000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",5000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"placa-metal",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Placa de Metal</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "molas" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("molas") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 5000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",5000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                           --   vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"molas",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Molas</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "gatilho" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("gatilho") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 5000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",5000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"gatilho",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Gatilho</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "embalagem" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("embalagem") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 200 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",200) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"embalagem",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Embalagem</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>200x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

 					elseif item == "maconhamacerada" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("maconhamacerada") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 1000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",1000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"maconhamacerada",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Maconha Cerrada</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>1000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end

 					elseif item == "acidolisergico" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("acidolisergico") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 1000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",1000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"acidolisergico",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Ácido Lisergico</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>1000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end


					elseif item == "folhadecoca" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("folhadecoca") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 1000 then

                                        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",1000) then
                                            TriggerClientEvent("fechar-nui-key",source)

                                            TriggerClientEvent("progress",source,1000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                          --    vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(1000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"folhadecoca",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você Comprou <b>1x Folha de Coca</b>.")
                                                SendWebhookMessage(webhookcontrabando,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado"," ")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>1000x Dinheiro Sujo")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
                    end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-- function doug.checkPermissao()
--    local source = source
 --   local user_id = vRP.getUserId(source)
   -- if vRP.hasPermission(user_id,"life.permissao") then
     --   return true
 --   end
--end