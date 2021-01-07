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
Tunnel.bindInterface("vitality_stealshop",src)
vSERVER = Tunnel.getInterface("vitality_stealshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
local robmark = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] = { ['x'] = 28.151824951172, ['y'] = -1339.5554199219, ['z'] = 29.497022628784 },
	[2] = { ['x'] = 2549.7182617188, ['y'] = 384.85549926758, ['z'] = 108.62294006348 },
	[3] = { ['x'] = 1160.0583496094, ['y'] = -313.89276123047, ['z'] = 69.205070495605 },
	[4] = { ['x'] = -709.35693359375, ['y'] = -904.12329101563, ['z'] = 19.215589523315 },
	[5] = { ['x'] = -42.820041656494, ['y'] = -1748.6987304688, ['z'] = 29.421016693115 },
	[6] = { ['x'] = 378.16299438477, ['y'] = 332.90216064453, ['z'] = 103.56639099121 },
	[7] = { ['x'] = -3249.6608886719, ['y'] = 1004.3889160156, ['z'] = 12.830709457397 },
	[8] = { ['x'] = 1734.6555175781, ['y'] = 6420.49609375, ['z'] = 35.037223815918 },
	[9] = { ['x'] = 546.30456542969, ['y'] = 2663.3195800781, ['z'] = 42.156497955322 },
	[10] = { ['x'] = 1959.5377197266, ['y'] = 3748.5581054688, ['z'] = 32.343738555908 },
	[11] = { ['x'] = 2673.173828125, ['y'] = 3286.4020996094, ['z'] = 55.241134643555 },
	[12] = { ['x'] = 1707.8018798828, ['y'] = 4920.30078125, ['z'] = 42.063674926758 },
	[13] = { ['x'] = -1828.9145507813, ['y'] = 799.21514892578, ['z'] = 138.18203735352 },
	[14] = { ['x'] = 1395.1953125, ['y'] = 3613.6157226563, ['z'] = 34.980930328369 },
	-- [15] = { ['x'] = -2959.6083984375, ['y'] = 387.12246704102, ['z'] = 14.043285369873 },
	[15] = { ['x'] = -3047.8112792969, ['y'] = 585.68365478516, ['z'] = 7.9089283943176 },
	--[17] = { ['x'] = 1126.8942871094, ['y'] = -980.64166259766, ['z'] = 45.415660858154 },
	--[18] = { ['x'] = 1168.9588623047, ['y'] = 2717.7473144531, ['z'] = 37.157619476318 },
	--[19] = { ['x'] = -1479.08984375, ['y'] = -375.34344482422, ['z'] = 39.163368225098 },
	--[20] = { ['x'] = -1220.8641357422, ['y'] = -915.88543701172, ['z'] = 11.326333999634 } 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERSBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not robbery then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(robbers) do
				local distance = Vdist(x,y,z,v.x,v.y,v.z)
				if distance <= 2 and GetEntityHealth(ped) > 15 then
					idle = 5
					drawText("PRESSIONE  ~r~E~w~  PARA INICIAR O ROUBO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and timedown <= 0 then
						timedown = 3
						if vSERVER.checkPolice() then
							vSERVER.startRobbery(k,v.x,v.y,v.z)
						end
					end
				end
			end
		else
			drawText("PARA CANCELAR O ROUBO SAIA PELA PORTA DA FRENTE",4,0.5,0.88,0.36,255,255,255,50)
			drawText("AGUARDE ~g~"..timedown.." SEGUNDOS~w~ ATÉ QUE TERMINE O ROUBO",4,0.5,0.9,0.46,255,255,255,150)
			if GetEntityHealth(PlayerPedId()) <= 101 then
				robbery = false
				vSERVER.stopRobbery()
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(time,x2,y2,z2)
	robbery = true
	timedown = time
	SetPedComponentVariation(PlayerPedId(),5,45,0,2)
	Citizen.CreateThread(function()
		while robbery do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(x,y,z,x2,y2,z2)
			if distance >= 10.0 then
				robbery = false
				vSERVER.stopRobbery()
			end
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobberyPolice(x,y,z,localidade)
	if not DoesBlipExist(robmark) then
		robmark = AddBlipForCoord(x,y,z)
		SetBlipScale(robmark,0.5)
		SetBlipSprite(robmark,161)
		SetBlipColour(robmark,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo: "..localidade)
		EndTextCommandSetBlipName(robmark)
		SetBlipAsShortRange(robmark,false)
		SetBlipRoute(robmark,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobberyPolice()
	if DoesBlipExist(robmark) then
		RemoveBlip(robmark)
		robmark = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timedown >= 1 then
			timedown = timedown - 1
			if timedown == 0 then
				robbery = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawText(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end