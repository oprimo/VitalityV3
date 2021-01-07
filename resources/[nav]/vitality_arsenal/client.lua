local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("vitality_arsenal")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
local locs = {
	{ x = -1098.96, y = -826.19, z = 14.29 }, -- SUL
	{ x = -430.32, y = 5999.118, z = 31.71 }, -- PALETO
	{ x = 456.68, y = -983.13, z = 30.69 }, -- SUL ANTIGO
	{ x = 1851.55, y = 3690.74, z = 34.27 } -- SANDY
}
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if data == "armamentos-comprar-taser" then
		if HasPedGotWeapon(ped, 0x3656C8C1) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui um <b>Taser</b>.")
		else
			TriggerServerEvent("policia-comprar",1)
		end
	elseif data == "armamentos-comprar-cassetete" then
		if HasPedGotWeapon(ped, 0x678B81B1) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui um <b>Cassetete</b>.")
		else
			TriggerServerEvent("policia-comprar",2)
		end
	elseif data == "armamentos-comprar-lanterna" then
		if HasPedGotWeapon(ped, 0x8BB05FD7) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>Lanterna</b>.")
		else
			TriggerServerEvent("policia-comprar",3)
		end
	elseif data == "armamentos-comprar-extintor" then
		if HasPedGotWeapon(ped, 0x060EC506) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui um <b>Extintor</b>.")
		else
			TriggerServerEvent("policia-comprar",4)
		end
	elseif data == "armamentos-comprar-glock" then
		if HasPedGotWeapon(ped, 0x5EF9FEC4) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>Glock</b>.")
		else
			TriggerServerEvent("policia-comprar",5)
		end
	elseif data == "armamentos-comprar-mp5" then
		if HasPedGotWeapon(ped, 0x2BE6766B) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>MP5</b>.")
		else
			TriggerServerEvent("policia-comprar",6)
		end
	elseif data == "armamentos-comprar-sigsauer" then
		if HasPedGotWeapon(ped, 0x0A3D4D34) then
			TriggerEvent("Notify", "negado","Negado","Você já possui uma <b>SIG Sauer MPX</b>.")
		else
			TriggerServerEvent("policia-comprar",7)
		end
	elseif data == "armamentos-comprar-remington" then
		if HasPedGotWeapon(ped, 0x555AF99A) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>Remington</b>.")
		else
			TriggerServerEvent("policia-comprar",8)
		end
	elseif data == "armamentos-comprar-m4a1" then
		if HasPedGotWeapon(ped, 0x83BF0278) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>M4A1</b>.")
		else
			TriggerServerEvent("policia-comprar",9)
		end
	elseif data == "armamentos-comprar-m4a4" then
		if HasPedGotWeapon(ped, 0xFAD1F1C9) then
			TriggerEvent("Notify", "negado","Negado", "Você já possui uma <b>M4A4</b>.")
		else
			TriggerServerEvent("policia-comprar",10)
		end
	elseif data == "armamentos-comprar-radio" then
		TriggerServerEvent("policia-comprar",23)
	elseif data == "armamentos-comprar-limpar" then
		TriggerServerEvent("policia-comprar",11)

	-- elseif data == "municoes-comprar-glock" then
	-- 	TriggerServerEvent("policia-comprar",12)
	-- elseif data == "municoes-comprar-mp5" then
	-- 	TriggerServerEvent("policia-comprar",13)
	-- elseif data == "municoes-comprar-sigsauer" then
	-- 	TriggerServerEvent("policia-comprar",14)
	-- elseif data == "municoes-comprar-remington" then
	-- 	TriggerServerEvent("policia-comprar",15)
	-- elseif data == "municoes-comprar-m4a1" then
	-- 	TriggerServerEvent("policia-comprar",16)
	-- elseif data == "municoes-comprar-m4a4" then
	-- 	TriggerServerEvent("policia-comprar",17)

	elseif data == "kits-comprar-cadete" then
		TriggerServerEvent("policia-comprar",18)
	elseif data == "kits-comprar-officer" then
		TriggerServerEvent("policia-comprar",19)
	elseif data == "kits-comprar-sargento" then
		TriggerServerEvent("policia-comprar",20)
	elseif data == "kits-comprar-tenente" then
		TriggerServerEvent("policia-comprar",21)
	elseif data == "kits-comprar-capitao" then
		TriggerServerEvent("policia-comprar",22)



	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local kswait = 1000
		for k, v in pairs(locs) do
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true)
			if distance <= 1.4 then
				kswait = 4
				drawTxt("PRESSIONE  ~b~E~w~  PARA ACESSAR O ARSENAL", 4, 0.5, 0.9, 0.6, 255, 255, 255, 180)
				if IsControlJustPressed(0,38) and emP.checkPermission() then
					ToggleActionMenu()
				end
			end
		end
		Citizen.Wait(kswait)
	end
end)
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end