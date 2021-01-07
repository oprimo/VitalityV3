-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_chest",src)
vCLIENT = Tunnel.getInterface("vrp_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaupolicia = "https://discord.com/api/webhooks/784775058181718016/ypmDJOxsJO_Lv84DlHmBYLkfEw-6MI73fEljvWYmgV5jh0zvyf2cnsIwStvsZlfUFLgI"
local webhookbauvagos = "https://discord.com/api/webhooks/784775178256646145/iWGTBfPKf2yfdQCqAezDTpLLhO5YrjXBO3pRU1viD3AJB7-0WtoONofCDpdsaX7mWRwb"
local webhookbaugroove = "https://discord.com/api/webhooks/784775241162293248/jC8Pf0gNwoLrpsvZRAB4Q1EHlkeRkHudfZn6wmdWhhSRypsMRhD7Lp3bjlLXnO3W_oO_"
local webhookbauballas = "https://discord.com/api/webhooks/784775308602507295/unsxxwTYTUfalzp-RvmOmCYpgbFABagLc77VnRz9OJT8oa4XyP2eNBAOuvDQNzo1k_Xc"
local webhookbauyardie = "https://discord.com/api/webhooks/784789644809207819/jbTIHB2QSt3bFpul41hAXTDWeMGVYaJYn7CkAkbeLvKAuiW4cxwF-Ml0oD-QODokcWWR"
local webhookbaumotoclub = "https://discord.com/api/webhooks/784775360382369802/FPCMPIg4Kvbd6ZLqiK7AdX7GeUlpUk8-c4Xqu5YcjeaKvPbyvj3B_ovBDDbq9Wwf-At7"
local webhookbaucrips = "https://discord.com/api/webhooks/784788802861531146/tZkLUIWj_8mWiNa5H1j6GbbfMZ-P1tDPzTEGNh6rSVgoeImKMCuNgncS-7Y79c_HFOOA"
local webhookbaubloods = "https://discord.com/api/webhooks/784789038820753418/ZiMXSYBBE0Y8a4xpEV4O73arFmVfVFaJHMcRn7XqBf0FY-5KlJycVTrpkw59Lae3er70"
local webhookbaucartel = "https://discord.com/api/webhooks/784789113801932810/JFM4DuBqyPvKd5B7osRc8FuX9dXlP4uIiXZNZcIDEpqzAJ5UHxdU3ReaPoExw1cHoqLZ"
local webhooklifeinvader = "https://discord.com/api/webhooks/784774920630566932/z6qZ07b-COyjNTO1LJcNUzPDp5zYMMq8Xi-PFTLGIyGXD7TTwpAiP_SiQehsXT5Nwe7n"
local webhookbaubennys = "https://discord.com/api/webhooks/784789325447430154/97gqgkEjWTxoqFnSLp7u-Q0JiHyjaSfdgANKLh26Ks7wonEI0c4L-BHUauxEtbtzZiVC"
local webhookbaulsantos = "https://discord.com/api/webhooks/784789396158283786/U0ilL5qd-jiPJQQEKp3EZBd2_u-bnzl_ynG3dykw6AYLsoXxY8xFGCern-qr-G1ZAlnD"
local webhookbaubahamas = "https://discord.com/api/webhooks/784789484540526592/b6muGQ9ookWdVxXYOWwTIb0lshXza-M5WRlSFiS0VcfIbrJtWw6NokUgeqwTN1FQdQeg"
local webhookbauhospital = "https://discord.com/api/webhooks/784789570797174854/QEL-xY_4gcdll4uL6eegwVlCYSJlvFua9pdSTyqiMnlUWfw8aikQgrL7FN540wni8dUa"

local webhookbaupolicia1 = "https://discord.com/api/webhooks/792609365860286465/xdyzwD7AwiPSPddS97XuGxPITkngD2tkhsMP2kwtLWbCNckPHzxjARckj939XqRKuzA2"
local webhookbauvagos1 = "https://discord.com/api/webhooks/792610863743893514/mzBdQYZ7pp17C89dsr155_M0P4lYDZozpSU1VLvtKAolfuee1bjCIhOjLo8wyJPbWih5"
local webhookbaugroove1 = "https://discord.com/api/webhooks/792612121912672256/eLAzZUetSShG-bvRnc2x3pmOR1YqBQ_wstBChlKq3Bc-4Dcq2Goz0X8I8BMEHuUmcKB0"
local webhookbauballas1 = "https://discord.com/api/webhooks/792611208804696074/vlWXlb9sL6Kifie2HKWOoSABGiBqHTt79sSIoIX1X4lqmsLKhQXdtGzB3dn9CevjzVj3"
local webhookbauyardie1 = "https://discord.com/api/webhooks/792612232290238485/vOLw0aRwTfQAV9BU0AGPSVMnaxemHDND-I_ir77YiJxUxj5ujXW8HE4B9dyWiqQ7hvMh"
local webhookbaumotoclub1 = ""
local webhookbaucrips1 = "https://discord.com/api/webhooks/792612313210290197/f3Z3T75Oeg9mrsK0AhhD-Eo5qdNyG4HbSF2ijQ6uCNFhig6CrF0Q5LanUDWMOWXyYvdk"
local webhookbaubloods1 = "https://discord.com/api/webhooks/795420571885240321/G5x3XSWocXt0sx9fZtjkcLhg_x8yharSAIptPuHcmBFaoww3sOjCH3e4x0DPpVHTVRhk "
local webhookbaucartel1 = "https://discord.com/api/webhooks/792612402527993886/pcgr9L9WQxfwLjGB33d_Wg9LaElJkeZ4u2CDu5gUuUYp3hwn74QMqqbySsjBMa359X6w"
local webhooklifeinvader1 = "https://discord.com/api/webhooks/792612646976487455/cikbBRDwhWGhrcGg_XkD6qxrPZAwmgD-OB1r2qi_ZoU8A-FnIHuSKM3StUt2rTsUTSf4"
local webhookbaubennys1 = ""
local webhookbaulsantos1 = ""
local webhookbaubahamas1 = "https://discord.com/api/webhooks/792612523350032404/myL4mzk0qEgmyvy5bktRrlql6hlDtNp6b3XH2Yb1Swmq7yrF7MQA2lnXqZictgVKj7iI"
local webhookbauhospital1 = ""



function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------

local chest = {
	["Policia"] = {30000, "policia.permissao"},
	["Hospital"] = {30000, "dmla.permissao"},
	["Motoclub"] = {30000, "motoclub.permissao"},
	["Yardie"] = {30000, "britanica.permissao"},
	["Ballas"] = {30000, "ballas.permissao"},
	["Grove1"] = {30000, "grove.permissao"},
	["Vagos"] = {30000, "vagos.permissao"},
	["Crips"] = {30000, "crips.permissao"},
	["Bloods1"] = {30000, "cosanostra.permissao"},
	["Cartel"] = {30000, "cartel.permissao"},
	["Life"] = {30000, "life.permissao"},
	["Bennys"] = {30000, "b.permissao"},
	["LS"] = {30000, "ls.permissao"},
	["Bahamas"] = {30000, "bahamas.permissao"}
	}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local opened = {}
local chestTimer = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDOWNTIME
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(actived) do
			if v > 0 then
				actived[k] = v - 1
				if v == 0 then
					actived[k] = nil
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if chestTimer > 0 then
            chestTimer = chestTimer - 1
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINTPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkIntPermissions(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			if vRP.hasPermission(user_id,chest[chestName][2]) then
				return true
			end
		end
	end
	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.openChest(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local hsinventory = {}
		local myinventory = {}
		local data = vRP.getSData("chest:"..tostring(chestName))
		local result = json.decode(data) or {}
		if result then
			for k,v in pairs(result) do
				table.insert(hsinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end

			local inv = vRP.getInventory(parseInt(user_id))
			for k,v in pairs(inv) do
				table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end
		end
		return hsinventory,myinventory,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(result),parseInt(chest[tostring(chestName)][1])
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.storeItem(chestName,itemName,amount)
    local source = source
    if itemName then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        if user_id  then
            if string.match(itemName,"identidade") then
                TriggerClientEvent("Notify",source,"importante","Importante","Não pode guardar este item.",8000)
                return
            end
 
            local data = vRP.getSData("chest:"..tostring(chestName))
            local items = json.decode(data) or {}
            if items then
                if parseInt(amount) > 0 then
                    local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(amount)
                    if new_weight <= parseInt(chest[tostring(chestName)][1]) then
                        if actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
                            if chestName == "Policia" then
                                SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaupolicia1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                          
                            elseif chestName == "Ballas" then
                                SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauballas1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif chestName == "Vagos" then
                                SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauvagos1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Grove1" then
                                SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaugroove1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Crips" then
                                SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaucrips1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Bloods1" then
                                SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubloods1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Yardie" then
                                SendWebhookMessage(webhookbauyardie,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauyardie1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                            
                            elseif  chestName == "Cartel" then
                                SendWebhookMessage(webhookbaucartel,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaucartel1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Life" then
                                SendWebhookMessage(webhooklifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhooklifeinvader1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "LS" then
                                SendWebhookMessage(webhookbaulsantos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaulsantos1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Hospital" then
                                SendWebhookMessage(webhookbauhospital,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauhospital1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Bahamas" then
                                SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubahamas1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
  
                            elseif  chestName == "Bennys" then
                                SendWebhookMessage(webhookbaubennys,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubennys1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    
                            end
                            if user_id and vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(amount)) then
                                actived[parseInt(user_id)] = 4
                                chestTimer = 10
                                if items[itemName] ~= nil then
                                    items[itemName].amount = parseInt(items[itemName].amount) + parseInt(amount)
                                else
                                    items[itemName] = { amount = parseInt(amount) }
                                end
                                vRP.setSData("chest:"..tostring(chestName),json.encode(items))
                                TriggerClientEvent('KSRP:UpdateChest',source,'updateChest')
                            else
                                TriggerClientEvent("Notify",source,"aviso","Aviso","Você está fazendo ações muito rapido!")
                            end 
                        end
                    else
                        TriggerClientEvent("Notify",source,"Negado","Negado","<b>Chest</b> cheio.",8000)
                    end
                else
                    TriggerClientEvent("Notify",source,"Negado","Negado","Digite o valor corretamente.",8000)
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.takeItem(chestName,itemName,amount)
    local source = source
    if itemName then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        if user_id then
            local data = vRP.getSData("chest:"..tostring(chestName))
            local items = json.decode(data) or {}
            if items then
                if parseInt(amount) > 0 then
                    if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
                        if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then
                            if chestName == "Policia" then
                                SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaupolicia1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                          
                            elseif chestName == "Ballas" then
                                SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauballas1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif chestName == "Vagos" then
                                SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauvagos1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Grove1" then
                                SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaugroove1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Crips" then
                                SendWebhookMessage(webhookbaucrips,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaucrips1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                            elseif  chestName == "Bloods1" then
                                SendWebhookMessage(webhookbaubloods,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubloods1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                
                            elseif  chestName == "Cartel" then
                                SendWebhookMessage(webhookbaucartel,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaucartel1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                
                            elseif  chestName == "Yardie" then
                                SendWebhookMessage(webhookbauyardie,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauyardie1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                
                            elseif  chestName == "Life" then
                                SendWebhookMessage(webhooklifeinvader,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhooklifeinvader1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                
                            elseif  chestName == "LS" then
                                SendWebhookMessage(webhookbaulsantos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaulsantos1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                
                            elseif  chestName == "Bahamas" then
                                SendWebhookMessage(webhookbaubahamas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubahamas1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 
                             elseif  chestName == "Hospital" then
                                SendWebhookMessage(webhookbauhospital,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbauhospital1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            
                             elseif  chestName == "Bennys" then
                                SendWebhookMessage(webhookbaubennys,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                SendWebhookMessage(webhookbaubennys1,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    

                            end
                            if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] and chestTimer <= 0 then
                                actived[parseInt(user_id)] = 4
                                chestTimer = 10
                                vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(amount))
                                items[itemName].amount = parseInt(items[itemName].amount) - parseInt(amount)
                                if parseInt(items[itemName].amount) <= 0 then
                                    items[itemName] = nil
                                end
                                TriggerClientEvent('KSRP:UpdateChest',source,'updateChest')
                                vRP.setSData("chest:"..tostring(chestName),json.encode(items))
                            else
                                TriggerClientEvent("Notify",source,"aviso","Aviso","Você está fazendo ações muito rapido!")
                            end 
                        else
                            TriggerClientEvent("Notify",source,"negado","Negado","<b>Mochila</b> cheia.",8000)
                        end
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Negado","Digite o valor corretamente.",8000)
                end
            end
        end
    end
    return false
end