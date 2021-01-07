local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
primo = {}
Tunnel.bindInterface("vitality_material",primo)

local webhookdrogas = "https://discord.com/api/webhooks/777924006858194995/WVwNhGzKTGTb3kRXYebxtKQQ774yLsOHVfh3a4-0alLK0VN-bKD-HusoGqtbf4v5QLow"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local key = {
    { item = "algema" },
    { item = "capuz" },
	{ item = "bandagem" },
	{ item = "pendrive" },
	{ item = "lockpick" },
    { item = "amt800" },
    { item = "m-amt800" }, 
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("craft")
AddEventHandler("craft",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if user_id then
		for k,v in pairs(key) do
			if item == v.item then
				if item == "algema" then
					 if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("algema") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 15000 then
                            if vRP.getInventoryItemAmount(user_id,"aco") >= 2 and vRP.tryGetInventoryItem(user_id,"dinheirosujo",15000) and vRP.tryGetInventoryItem(user_id,"aco",2) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                         --   TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"algema",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x algema</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "capuz" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("capuz") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
                            if vRP.getInventoryItemAmount(user_id,"pano") >= 2 and vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) and vRP.tryGetInventoryItem(user_id,"pano",2) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"capuz",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x capuz</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "bandagem" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("bandagem") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pano") >= 2 then
                            if vRP.getInventoryItemAmount(user_id,"pano") >= 2 and vRP.tryGetInventoryItem(user_id,"pano",2) and vRP.tryGetInventoryItem(user_id,"cordas",1) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"bandagem",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x bandagem</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end 
                elseif item == "pendrive" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pendrive") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 20000 then
                            if vRP.getInventoryItemAmount(user_id,"kiteletronico") >= 3 and vRP.tryGetInventoryItem(user_id,"kiteletronico",3) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",20000) and vRP.tryGetInventoryItem(user_id,"plastico",2) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"pendrive",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x Pendrive</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end


  			elseif item == "lockpick" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("lockpick") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
                            if vRP.getInventoryItemAmount(user_id,"aco") >= 3 and vRP.tryGetInventoryItem(user_id,"aco",3) and vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"lockpick",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x Lockpick</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end

                     elseif item == "amt800" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SNSPISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
                            if vRP.getInventoryItemAmount(user_id,"distintivo") >= 10 and vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) and vRP.tryGetInventoryItem(user_id,"distintivo",10) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"wbody|WEAPON_SNSPISTOL_MK2",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>1x HK</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end

                     elseif item == "m-amt800" then
                     if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|WEAPON_SNSPISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 5000 then
                            if vRP.getInventoryItemAmount(user_id,"distintivo") >= 10 and vRP.tryGetInventoryItem(user_id,"dinheirosujo",5000) and vRP.tryGetInventoryItem(user_id,"distintivo",10) then

                                       TriggerClientEvent("fechar-nui-craft",source)

                                            TriggerClientEvent("progress",source,10000,"COMPREI")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            --vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"wammo|WEAPON_SNSPISTOL_MK2",60)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você fabricou <b>60x HK MUNIÇÃO</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x AK-47 "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você não possui itens suficientes.")
                                end
                    else
                        TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end

				end
			end
		end
	end
    end )
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function primo.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"life.permissao") then
        return true
    end
end