local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("vitality_arsenal",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = 1}, -- taser
	{ item = 2}, -- cassetete
	{ item = 3}, -- lanterna
	{ item = 4}, -- extintor
	{ item = 5}, -- combatpistol
	{ item = 6}, -- smg
	{ item = 7}, -- combatpdw
	{ item = 8}, -- pump
	{ item = 9}, -- m4a1
	{ item = 10}, -- m4a4
	{ item = 23}, -- radio
	{ item = 11}, -- limpar

	-- Munições
	{ item = 12 },
	{ item = 13 },
	{ item = 14 },
	{ item = 15 },
	{ item = 16 },
	{ item = 17 },

	-- Kits
	{ item = 18 }, -- Cadete
	{ item = 19 }, -- Officer
	{ item = 20 }, -- Sargento
	{ item = 21 }, -- Tentente
	{ item = 22 }  -- Capitão
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("policia-comprar")
AddEventHandler("policia-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if item == 1 then
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Taser".."</b> do arsenal. <b>")					
				elseif item == 2 then
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Cassetete".."</b> do arsenal. <b>")				
				elseif item == 3 then
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Lanterna".."</b> do arsenal. <b>")
				elseif item == 4 then
					vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Extintor".."</b> do arsenal. <b>")
				elseif item == 5 then
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Glock".."</b> do arsenal. <b>")				
				elseif item == 6 then
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "MP5".."</b> do arsenal. <b>")				
				elseif item == 7 then
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "SIG Sauer MPX".."</b> do arsenal. <b>")				
				elseif item == 8 then
					vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 100 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "Remington".."</b> do arsenal. <b>")				
				elseif item == 9 then
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "M4A1".."</b> do arsenal. <b>")	
				elseif item == 10 then
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE_MK2"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "M4A4".."</b> do arsenal. <b>")
				elseif item == 23 then
					if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
						TriggerClientEvent("Notify",source,"negado","Negado","Você já possui um <b>Rádio</b>.", 8000)
					else
						vRP.giveInventoryItem(user_id, "radio", 1)
						TriggerClientEvent("Notify",source,"sucesso","Sucesso","Recebeu <b>" .. "rádio".."</b> do arsenal. <b>")	
					end
				elseif item == 11 then
					vRPclient.giveWeapons(source,{},true)

					-- Limpa munição reserva de MP5
					ammo_smg = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_SMG")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_SMG", ammo_smg)

					-- Limpa munição reserva de SIG Sauer MPX
					ammo_pdw = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_COMBATPDW")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", ammo_pdw)

					-- Limpa munição reserva de M4A1
					ammo_m4a1 = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_CARBINERIFLE")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", ammo_m4a1)

					-- Limpa munição reserva de M4A4
					ammo_m4a4 = vRP.getInventoryItemAmount(user_id, "wammo|WEAPON_CARBINERIFLE_MK2")
					vRP.tryGetInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2", ammo_m4a4)
					TriggerClientEvent("Notify",source,"sucesso","Guardou <b>" .. "".."</b> todo o armamento. <b>")
				-- elseif item == 12 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPISTOL",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de Glock19".."</b> do arsenal. <b>")
				-- elseif item == 13 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de MP5".."</b> do arsenal. <b>")
				-- elseif item == 14 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de Sigsauer".."</b> do arsenal. <b>")
				-- elseif item == 15 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_PUMPSHOTGUN_MK2",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de Remington".."</b> do arsenal. <b>")
				-- elseif item == 16 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de M4A1".."</b> do arsenal. <b>")
				-- elseif item == 17 then
				-- 	vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2",250)
				-- 	TriggerClientEvent("Notify",source,"sucesso","Pegou <b>" .. "250 munições de M4A1".."</b> do arsenal. <b>")
				elseif item == 18 then -- Cadete
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					-- vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Pegou <b>o KIT Cadete</b> do arsenal. <b>")
				elseif item == 19 then -- Officer
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					-- vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Pegou <b>o KIT Officer</b> do arsenal. <b>")
				elseif item == 20 then -- Sargento
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					-- vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 100 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Pegou <b>o KIT Sargento</b> do arsenal. <b>")
				elseif item == 21 then -- Tenente
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					-- vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 100 }})
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Pegou <b>o KIT Tenente</b> do arsenal. <b>")
				elseif item == 22 then -- Capitão
					vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
					-- vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 100 }})
					vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
					vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE_MK2"] = { ammo = 250 }})
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_SMG", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_COMBATPDW", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE", 250)
					--vRP.giveInventoryItem(user_id,"wammo|WEAPON_CARBINERIFLE_MK2", 250)
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Pegou <b>o KIT Capitão</b> do arsenal. <b>")
				end
			end
		end
	end
end)

function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao")
end