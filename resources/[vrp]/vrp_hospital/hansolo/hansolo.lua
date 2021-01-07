-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Resg = Tunnel.getInterface("vrp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
--[ REANIMAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('reanimar')
AddEventHandler('reanimar',function()
	local handle,ped = FindFirstPed()
	local finished = false
	local reviver = nil
	repeat
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(ped),true)
		if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) and distance <= 1.5 and reviver == nil then
			reviver = ped
			TriggerEvent("cancelando",true)
			vRP._playAnim(false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
			TriggerEvent("progress",15000,"reanimando")
			SetTimeout(15000,function()
				SetEntityHealth(reviver,110)
				local newped = ClonePed(reviver,GetEntityHeading(reviver),true,true)
				TaskWanderStandard(newped,10.0,10)
				local model = GetEntityModel(reviver)
				SetModelAsNoLongerNeeded(model)
				Citizen.InvokeNative(0xAD738C3085FE7E11,reviver,true,true)
				TriggerServerEvent("trydeleteped",PedToNet(reviver))
				vRP._stopAnim(false)
				TriggerServerEvent("reanimar:pagamento")
				TriggerEvent("cancelando",false)
			end)
			finished = true
		end
		finished,ped = FindNextPed(handle)
	until not finished
	EndFindPed(handle)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MACAS DO HOSPITAL ]------------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
	{ ['x'] = 323.22, ['y'] = -582.75, ['z'] = 43.29, ['x2'] = 324.4, ['y2'] = -582.93, ['z2'] = 44.21, ['h'] = 340.62, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 321.88, ['y'] = -586.76, ['z'] = 43.29, ['x2'] = 322.74, ['y2'] = -587.45, ['z2'] = 44.21, ['h'] = 149.76, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 318.6, ['y'] = -580.57, ['z'] = 43.29, ['x2'] = 319.45, ['y2'] = -580.88, ['z2'] = 44.21, ['h'] = 327.40, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 309.14, ['y'] = -581.99, ['z'] = 43.29, ['x2'] = 307.7, ['y2'] = -581.7, ['z2'] = 44.21, ['h'] = 154.52, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 366.36, ['y'] = -581.34, ['z'] = 43.29, ['x2'] = 367.25, ['y2'] = -581.65, ['z2'] = 44.21, ['h'] = 334.32, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 310.25, ['y'] = -577.66, ['z'] = 43.29, ['x2'] = 309.33, ['y2'] = -577.31, ['z2'] = 44.21, ['h'] = 336.70, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 318.69, ['y'] = -585.58, ['z'] = 43.29, ['x2'] = 317.64, ['y2'] = -585.46, ['z2'] = 44.21, ['h'] = 149.81, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 312.2, ['y'] = -582.78, ['z'] = 43.29, ['x2'] = 311.04, ['y2'] = -582.96, ['z2'] = 44.21, ['h'] = 151.34, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 314.77, ['y'] = -579.44, ['z'] = 43.29, ['x2'] = 314.07, ['y2'] = -578.98, ['z2'] = 44.21, ['h'] = 332.87, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
	{ ['x'] = 315.42, ['y'] = -584.34, ['z'] = 43.29, ['x2'] = 314.55, ['y2'] = -584.09, ['z2'] = 44.21, ['h'] = 153.47, ['texto'] = "Pressione [~y~E~w~] para deitar   ~y~&~w~   [~y~G~w~] para iniciar tratamento." },
}
-----------------------------------------------------------------------------------------------------------------------------------------
--[ USO ]-------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------------
local emMaca = false
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local cod = macas[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cod.x, cod.y, cod.z, true ) < 1.2 then
				
				DrawText3D(cod.x, cod.y, cod.z, cod.texto)
			end

			if distance < 1.2 then

				idle = 5

				if IsControlJustPressed(0,38) then
					SetEntityCoords(ped,v.x2,v.y2,v.z2)
					SetEntityHeading(ped,v.h)
					vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					emMaca = true
				end

				if IsControlJustPressed(0,47) then
					if Resg.checkServices() then
						TriggerEvent('tratamento-macas')
						TriggerEvent('resetDiagnostic')
						TriggerEvent('resetWarfarina')
						SetEntityCoords(ped,v.x2,v.y2,v.z2)
						SetEntityHeading(ped,v.h)
						vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					else
						TriggerEvent("Notify","aviso","Aviso","Existem paramédicos em serviço.")
					end
				end

			end

			if IsControlJustPressed(0,167) and emMaca then
				ClearPedTasks(GetPlayerPed(-1))
				emMaca = false
			end
		end

		Citizen.Wait(idle)
	end
end)

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
	TriggerEvent("cancelando",true)
	repeat
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(10)
	until GetEntityHealth(PlayerPedId()) >= 400 or GetEntityHealth(PlayerPedId()) <= 100
	TriggerEvent("Notify","importante","Importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRATAMENTO ]-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local tratamento = false
RegisterNetEvent("tratamento")
AddEventHandler("tratamento",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    SetEntityHealth(ped,health)
    SetPedArmour(ped,armour)
	
	if emMaca then
		if tratamento then
			return
		end

		tratamento = true
		TriggerEvent("Notify","sucesso","Sucesso","Tratamento iniciado, aguarde a liberação do <b>profissional médico.</b>.",8000)
		TriggerEvent('resetWarfarina')
		TriggerEvent('resetDiagnostic')
		

		if tratamento then
			repeat
				Citizen.Wait(10)
				if GetEntityHealth(ped) > 101 then
					SetEntityHealth(ped,GetEntityHealth(ped)+1)
				end
			until GetEntityHealth(ped) >= 400 or GetEntityHealth(ped) <= 101
				TriggerEvent("Notify","sucesso","Sucesso","Tratamento concluido.",8000)
				tratamento = false
		end
	else
		TriggerEvent("Notify","negado","Negado","Você precisa estar deitado em uma maca para ser tratado.",8000)
	end
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