local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

primo = Tunnel.getInterface("vitality_rout_drugs")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local emprocesso = false
local segundos = 0
local selecionado = 0
local quantidade = 0
-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local CoordenadaX = 82.96
local CoordenadaY = -1968.72
local CoordenadaZ = 20.75

-- 82.96,-1968.72,20.75 : BALLAS ROTA


local Coordenada2X = -150.57
local Coordenada2Y = -1625.37
local Coordenada2Z = 33.66

-- -150.57,-1625.37,33.66 : GROOVE

local Coordenada3X = 364.25
local Coordenada3Y = -2045.67
local Coordenada3Z = 22.36

--  364.25,-2045.67,22.36 : VAGOS 

-----------------------------------------------------------------------------------------------------------------------------------------
--[ RESIDENCIAS ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 108.55, ['y'] = -1798.73, ['z'] = 27.08 }, 
	[2] = { ['x'] = 142.82, ['y'] = -1520.0, ['z'] = 29.84 }, 
	[3] = { ['x'] = -145.02, ['y'] = -1429.89, ['z'] = 30.91 }, 
	[4] = { ['x'] = -324.97, ['y'] = -1356.13, ['z'] = 31.3 }, 
	[5] = { ['x'] = -642.8, ['y'] = -1227.62, ['z'] = 11.55 }, 
	[6] = { ['x'] = -924.86, ['y'] = -1163.01, ['z'] = 4.81 }, 
	[7] = { ['x'] = -1252.95, ['y'] = -1191.92, ['z'] = 7.24 }, 
	[8] = { ['x'] = -1473.25, ['y'] = -646.64, ['z'] = 29.59 }, 
	[9] = { ['x'] = -1578.5, ['y'] = -441.57, ['z'] = 37.97 }, 
	[10] = { ['x'] = -534.35, ['y'] = 33.01, ['z'] = 44.58 }, 
	[11] = { ['x'] = -72.42, ['y'] = 81.45, ['z'] = 71.59 }, 
	[12] = { ['x'] = 376.88, ['y'] = -336.03, ['z'] = 48.17 }, 
	[13] = { ['x'] = 494.52, ['y'] = -570.95, ['z'] = 24.57 }, 
	[14] = { ['x'] = 495.72, ['y'] = -1339.22, ['z'] = 29.32 }, 
	[15] = { ['x'] = 448.28, ['y'] = -1898.05, ['z'] = 26.7 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRABALHAR ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("primofarmdrugs",function(source,args)
	if not servico then
		if not emprocesso then
			emprocesso = true
		--	vRP._playAnim(false,{{'anim@heists@prison_heistig1_p1_guard_checks_bus','loop'}},false)
			--DisableControlAction(0,167,true)
			Wait(5000)
			servico = true
			segundos = 200
			selecionado = 1
			CriandoBlip(locs,selecionado)
			primo.Quantidade()
			TriggerEvent("Notify","sucesso","Sucesso","Você entrou em serviço.")
			PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
		else
			TriggerEvent("Notify","importante","Importante","Aguarde <b>"..segundos.." segundos</b> até acharmos outras coletas.")
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
		local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
		if not servico then
			if distance <= 1.1 and not IsPedInAnyVehicle(ped) then
				idle = 5
				drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A COLETA",4,0.08,0.55,0.45,255,255,255,180)
				if IsControlJustPressed(0,38) and primo.checkGroup() then
					ExecuteCommand('primofarmdrugs')
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(Coordenada2X,Coordenada2Y,Coordenada2Z)
		local distance = GetDistanceBetweenCoords(Coordenada2X,Coordenada2Y,cdz,x,y,z,true)
		if not servico then
			if distance <= 1.1 and not IsPedInAnyVehicle(ped) then
				idle = 5
				drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A COLETA",4,0.08,0.55,0.45,255,255,255,180)
				if IsControlJustPressed(0,38) and primo.checkGroup() then
					ExecuteCommand('primofarmdrugs')
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local bowz,cdz = GetGroundZFor_3dCoord(Coordenada3X,Coordenada3Y,Coordenada3Z)
		local distance = GetDistanceBetweenCoords(Coordenada3X,Coordenada3Y,cdz,x,y,z,true)
		if not servico then
			if distance <= 1.1 and not IsPedInAnyVehicle(ped) then
				idle = 5
				drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A COLETA",4,0.08,0.55,0.45,255,255,255,180)
				if IsControlJustPressed(0,38) and primo.checkGroup() then
					ExecuteCommand('primofarmdrugs')
				end
			end
		end
		Citizen.Wait(idle)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
--[ ENTREGAS ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30 and not IsPedInAnyVehicle(ped) then
				DrawMarker(27,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-1.0,0,0,0,0,180.0,130.0,0.8,0.8,0.8,0,255,0,50,0,0,0,1)
				if distance <= 1.5 then
					idle = 5
					drawTxt("PRESSIONE  ~g~E~w~  PARA COLETAR "..quantidade.." REAGENTES",4,0.09,0.55,0.45,255,255,255,180)
					if IsControlJustPressed(0,38) then
						if primo.checkPayment() then
							RemoveBlip(blips)
							backentrega = selecionado
							TriggerEvent("Notify","importante","Importante","Vá até o proximo destino e colete <b>"..quantidade.."x Reagentes.")
							PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
							while true do
								if selecionado == 15 then
									selecionado = 1
								else
									selecionado = selecionado + 1
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if emprocesso then
			if segundos > 0 then
				segundos = segundos - 1
				if segundos == 0 then
					emprocesso = false
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CANCELAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			drawTxt2("~w~COLETE ~r~"..quantidade.." REAGENTES ~w~NO DESTINO MARCADO",4,0.25,0.95,0.40,255,255,255,180)
			drawTxt2("~w~PRESSIONE~r~  F7  ~w~PARA FINALIZAR O EXPEDIENTE",4,0.25,0.97,0.40,255,255,255,180)
			if IsControlJustPressed(0,121) then
			elseif IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Aviso","Você saiu de serviço.")
				PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ STATUS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("quantidade-drugs")
AddEventHandler("quantidade-drugs",function(status)
    quantidade = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
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

function drawTxt2(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,501)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de Peças")
	EndTextCommandSetBlipName(blips)
end