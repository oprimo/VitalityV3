local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("primo_dorgas",oC)

local webhookdrogas = "https://discord.com/api/webhooks/795304384510427136/kOG3QFEiDlj-nzo96rK64Fy9J6ddAidBA5pNy-C4m6iNE_Q9JNFy9TWoosZRrK8czTK2"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
	
	{ item = "lsd" },
	{ item = "maconha" },
	{ item = "cocaina" }
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-droga1")
AddEventHandler("produzir-droga1",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		for k,v in pairs(armas) do
			if item == v.item then
                if item == "lsd" then
                	 if vRP.hasPermission(user_id,"vagos.permissao") then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lsd") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"reagente") >= 10 then
                            if vRP.getInventoryItemAmount(user_id,"acidolisergico") >= 5 then
                                if vRP.getInventoryItemAmount(user_id,"embalagem") >= 2 then
                                        if vRP.tryGetInventoryItem(user_id,"reagente",10) and vRP.tryGetInventoryItem(user_id,"acidolisergico",5) and vRP.tryGetInventoryItem(user_id,"embalagem",2) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,10000,"Fabricando Drogas")
                                            TriggerClientEvent("bancada-drogas:posicao",source)
                                            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"lsd",30)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você montou fabricou <b>LSD</b>.")
                                                SendWebhookMessage(webhookdrogas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 30x LSD "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>10x reagente.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5x Ácido Lisergico</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Negado","Você não possui ingredientes o suficiente.")
                            end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end end
	
					elseif item == "maconha" then
					if vRP.hasPermission(user_id,"ballas.permissao") then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("maconha") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"reagente") >= 10 then
                            if vRP.getInventoryItemAmount(user_id,"maconhamacerada") >= 5 then
                                if vRP.getInventoryItemAmount(user_id,"embalagem") >= 2 then
                                        if vRP.tryGetInventoryItem(user_id,"reagente",10) and vRP.tryGetInventoryItem(user_id,"maconhamacerada",5) and vRP.tryGetInventoryItem(user_id,"embalagem",2) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,10000,"Fabricando Drogas")
                                            TriggerClientEvent("bancada-drogas:posicao",source)
                                            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"maconha",30)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você montou fabricou <b>Maconha</b>.")
                                                SendWebhookMessage(webhookdrogas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 30x  Maconha "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>10x reagente.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5x Maconha Macerada</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Negado","Você não possui ingredientes o suficiente.")
                            end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end	 end
        
					elseif item == "cocaina" then
					if vRP.hasPermission(user_id,"grove.permissao") then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cocaina") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"reagente") >= 10 then
                            if vRP.getInventoryItemAmount(user_id,"folhadecoca") >= 5 then
                                if vRP.getInventoryItemAmount(user_id,"embalagem") >= 2 then
                                        if vRP.tryGetInventoryItem(user_id,"reagente",10) and vRP.tryGetInventoryItem(user_id,"folhadecoca",5) and vRP.tryGetInventoryItem(user_id,"embalagem",2) then
                                            TriggerClientEvent("fechar-nui",source)

                                            TriggerClientEvent("progress",source,10000,"Fabricando Drogas")
                                            TriggerClientEvent("bancada-drogas:posicao",source)
                                            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"cocaina",30)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você montou fabricou <b>Maconha</b>.")
                                                SendWebhookMessage(webhookdrogas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 30x  Cocaína "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>10x reagente.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>5x Folha de Coca</b>.")
                                end
                            else
                                 TriggerClientEvent("Notify",source,"negado","Negado","Você não possui ingredientes o suficiente.")
                            end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end end

				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
