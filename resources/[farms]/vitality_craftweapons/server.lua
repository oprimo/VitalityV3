local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("vitality_craftweapons",oC)

local webhookarmas = "https://discord.com/api/webhooks/784791653939675167/rV7Mh1L7sUQTieAKfQCHcVfewilIl3BZKN1AlI2-GM6-nunPLTWI5mhkAw4CcHafVzpu"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ ARRAY ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = {
	--{ item = "g36" },
	--{ item = "sawnoffshotgun" },
	{ item = "fiveseven" },
	{ item = "sns" }
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-armas")
AddEventHandler("produzir-armas",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		for k,v in pairs(armas) do
			if item == v.item then
                if item == "fiveseven" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_PISTOL_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecadearma") >= 50 then
                            if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 2 then
                                if vRP.getInventoryItemAmount(user_id,"molas") >= 2 then
                                    if vRP.getInventoryItemAmount(user_id,"gatilho") >= 1 then
                                        if vRP.tryGetInventoryItem(user_id,"pecadearma",50) and vRP.tryGetInventoryItem(user_id,"placa-metal",2) and vRP.tryGetInventoryItem(user_id,"molas",2) and vRP.tryGetInventoryItem(user_id,"gatilho",1) then
                                            TriggerClientEvent("fechar-nuis",source)

                                            TriggerClientEvent("progress",source,10000,"Montando Shotgun")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"wbody|WEAPON_PISTOL_MK2",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você montou uma <b>FIVESEVEN</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x FiveSeven "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>1x Gatilho.")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>2x Molas</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>2x Placa de Metal</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>50x Peça de Arma")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
                elseif item == "sns" then
                    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|WEAPON_SMG_MK2") <= vRP.getInventoryMaxWeight(user_id) then
                        if vRP.getInventoryItemAmount(user_id,"pecadearma") >= 80 then -- 10 + 10 + 5
                            if vRP.getInventoryItemAmount(user_id,"placa-metal") >= 3 then
                                if vRP.getInventoryItemAmount(user_id,"molas") >= 3 then
                                    if vRP.getInventoryItemAmount(user_id,"gatilho") >= 2 then
                                        if vRP.tryGetInventoryItem(user_id,"pecadearma",80) and vRP.tryGetInventoryItem(user_id,"placa-metal",3) and vRP.tryGetInventoryItem(user_id,"molas",3) and vRP.tryGetInventoryItem(user_id,"gatilho",2) then
                                            TriggerClientEvent("fechar-nuis",source)

                                            TriggerClientEvent("progress",source,10000,"Montando SMG")
                                            TriggerClientEvent("bancada-armas:posicao",source)
                                            vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)

                                            SetTimeout(10000,function()
                                                vRPclient._stopAnim(source,false)
                                                vRP.giveInventoryItem(user_id,"wbody|WEAPON_SMG_MK2",1)
                                                TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você montou uma <b>SMG</b>.")
                                                SendWebhookMessage(webhookarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FABRICOU]: 1x SMG "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                            end)
                                        end
                                    else
                                        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>1x Gatilho")
                                    end
                                else
                                    TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>1x Mola</b>.")
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Negado","Você precisa de <b>2x Placa de metal</b>.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Negado","Você não tem <b>30x Peça de Arma")
                        end
					else
						TriggerClientEvent("Notify",source,"negado","Negado","Espaço insuficiente na mochila.")
                    end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function oC.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"crips.permissao") or vRP.hasPermission(user_id,"bloods.permissao") then
        return true
    end
end