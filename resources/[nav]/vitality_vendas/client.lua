local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

doug = Tunnel.getInterface("vitality_vendas")
-------------------------------------------------------------------------------------------------
--[ LOCAL ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local prodMachine = {
	-- 1200.64,-1276.45,35.23 
	{ ['x'] = 1200.64, ['y'] = -1276.45, ['z'] = 35.23 }
}
-------------------------------------------------------------------------------------------------
--[ MENU ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-------------------------------------------------------------------------------------------------
--[ BOTÕES ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "produzir-placa" then
		TriggerServerEvent("produzir-key","placa")

	elseif data == "produzir-molas" then
		TriggerServerEvent("produzir-key","molas")

	elseif data == "produzir-gatilho" then
		TriggerServerEvent("produzir-key","gatilho")
		
	elseif data == "produzir-embalagem" then
		TriggerServerEvent("produzir-key","embalagem")	

	elseif data == "produzir-maconhamacerada" then
		TriggerServerEvent("produzir-key","maconhamacerada")	

	elseif data == "produzir-acidolisergico" then
		TriggerServerEvent("produzir-key","acidolisergico")	

	elseif data == "produzir-folhadecoca" then
		TriggerServerEvent("produzir-key","folhadecoca")	

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

RegisterNetEvent("bancada-key:posicao")
AddEventHandler("bancada-key:posicao", function()
	local ped = PlayerPedId()
	SetEntityHeading(ped,prodMachine.h)
	SetEntityCoords(ped,1403.56,1136.47,109.75-1,false,false,false,false)
end)

RegisterNetEvent("fechar-nui-key")
AddEventHandler("fechar-nui-key", function()
	ToggleActionMenu()
	onmenu = false
end)
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000

		for k,v in pairs(prodMachine) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local prodMachine = prodMachine[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), prodMachine.x, prodMachine.y, prodMachine.z, true ) <= 1 and not onmenu then
				DrawText3D(prodMachine.x, prodMachine.y, prodMachine.z, "[~r~E~w~] Para ~r~COMPRAR~w~.")
		end
		if distance <= 1.2 then
			idle = 5
				if IsControlJustPressed(0,38) and  not omenu then
				ToggleActionMenu()
				onmenu = true
			end
			end
		end
		Citizen.Wait(idle)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end


--RegisterCommand('material', function(source, args, rawCmd)
--	ToggleActionMenu()
--	onmenu = true
--end)