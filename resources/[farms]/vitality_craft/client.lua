local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

primo = Tunnel.getInterface("vitality_material")
-------------------------------------------------------------------------------------------------
--[ LOCAL ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--local prodMachine = {
--	{ ['x'] = -2347.04, ['y'] = 3269.58, ['z'] = 32.82 },
--}
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
	if data == "produzir-algema" then
		TriggerServerEvent("craft","algema")

	elseif data == "produzir-capuz" then
		TriggerServerEvent("craft","capuz")

	elseif data == "produzir-bandagem" then
		TriggerServerEvent("craft","bandagem")
		
	elseif data == "produzir-pendrive" then
		TriggerServerEvent("craft","pendrive")	

	elseif data == "produzir-lockpick" then
		TriggerServerEvent("craft","lockpick")

	elseif data == "produzir-amt800" then
		TriggerServerEvent("craft","amt800")	

	elseif data == "produzir-m-amt800" then
	TriggerServerEvent("craft","m-amt800")	

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

RegisterNetEvent("bancada:posicao")
AddEventHandler("bancada:posicao", function()
	local ped = PlayerPedId()
	--SetEntityHeading(ped,prodMachine.h)
	--SetEntityCoords(ped,1403.56,1136.47,109.75-1,false,false,false,false)
end)

RegisterNetEvent("fechar-nui-craft")
AddEventHandler("fechar-nui-craft", function()
	ToggleActionMenu()
	onmenu = false
end)
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--Citizen.CreateThread(function()
--	while true do
--		local idle = 1000
--
--		for k,v in pairs(prodMachine) do
--			local ped = PlayerPedId()
--			local x,y,z = table.unpack(GetEntityCoords(ped))
--			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
--			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
--			local prodMachine = prodMachine[k]
--
--			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), prodMachine.x, prodMachine.y, prodMachine.z, true ) <= 1 and not onmenu then
--				drawTxt("PRESSIONE  ~o~E~w~  PARA INICIAR A PRODUÇÃO",4,0.08,0.55,0.45,255,255,255,180)
--			end
--			if distance <= 1.2 then
--				idle = 5
--				if IsControlJustPressed(0,38) and primo.checkPermissao() then
--					ToggleActionMenu()
--					onmenu = true
--				end
--			end
--		end
--		Citizen.Wait(idle)
--	end
--end)
RegisterCommand('craft', function(source, args, rawCmd)
	ToggleActionMenu()
	onmenu = true
end)