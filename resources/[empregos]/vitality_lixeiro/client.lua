local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

emp = Tunnel.getInterface("vitality_lixeiro")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
local central = {-349.99,-1570.0,25.23}
local garagem = {-340.96,-1567.77,25.23}
local spawnStockade = {-345.84,-1569.48,25.23}
local descargaCentral = {-329.94,-1566.78,25.24}
local rota = {
    
    [1] = {['x'] = -361.94, ['y'] = -1864.66, ['z'] = 20.53},
    [2] = {['x'] = -52.4, ['y'] = -1661.41, ['z'] = 29.14},
    [3] = {['x'] = 96.63, ['y'] = -1525.61, ['z'] = 29.37},
    [4] = {['x'] = 98.29, ['y'] = -1655.64, ['z'] = 29.3},
    [5] = {['x'] = 194.95, ['y'] = -1773.61, ['z'] = 29.04},
    [6] = {['x'] = 286.74, ['y'] = -1811.36, ['z'] = 27.16},
    [7] = {['x'] = 272.06, ['y'] = -1523.66, ['z'] = 29.3},
    [8] = {['x'] = 306.15, ['y'] = -1292.13, ['z'] = 30.8},
    [9] = {['x'] = 382.06, ['y'] = -1119.74, ['z'] = 29.41},
    [10] = {['x'] = 482.26, ['y'] = -1275.38, ['z'] = 29.65},
    [11] = {['x'] = 482.5, ['y'] = -1448.6, ['z'] = 29.29},
    [12] = {['x'] = 271.65, ['y'] = -1501.42, ['z'] = 29.24},
    [13] = {['x'] = 189.68, ['y'] = -1320.57, ['z'] = 29.32},
    [14] = {['x'] = 128.78, ['y'] = -1054.89, ['z'] = 29.2},
    [15] = {['x'] = 39.95, ['y'] = -1015.92, ['z'] = 29.49}
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local trabalhando = false
local CarroSpawnado = false
local etapa = 0
local ComLixos = false
local PontoMarcado = false
local blip = false
local lixos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CÓDIGO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        local sleep = 500
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if not trabalhando then 
            local DistCentral = Vdist2(x,y,z, central[1], central[2], central[3])
            if DistCentral <= 15 then
                sleep = 4
                DrawMarker(21, central[1], central[2], central[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                if DistCentral <= 1.5 then
                    sleep = 4
                    DrawText3D(central[1], central[2], central[3], '~g~[E] ~w~PARA TRABALHAR')
                    if IsControlJustPressed(0,38) then
                        trabalhando = true
                        Wait(450)
                        ClearPedTasks(ped)
                    end
                end
            end
        elseif trabalhando and not CarroSpawnado then
            local DistGaragem = Vdist(x,y,z, garagem[1], garagem[2], garagem[3])
            if DistGaragem <= 15 then
                sleep = 4
                DrawMarker(21, garagem[1], garagem[2], garagem[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                if DistGaragem <= 1.5 then
                    sleep = 4
                    DrawText3D(garagem[1], garagem[2], garagem[3], '~g~[E] ~w~PARA SOLICITAR CAMINHÃO')
                    if IsControlJustPressed(0,38) then
                        CarroSpawnado = true
                        SpawnStockade()
                    end
                end
            end
        elseif trabalhando and CarroSpawnado then
            local xCar, yCar, zCar = table.unpack(GetEntityCoords(nveh))
            local DistCarro = Vdist2(x,y,z, xCar, yCar, zCar)
            if not ComLixos and not acabou then
                if not PontoMarcado then
                    PontoMarcado = math.random(#rota)
                    if not blip then
                        CriandoBlip(rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, 207, 38, 0.4, 'Retirada de lixos')
                        vRPclient.playSound("CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                        TriggerEvent('Notify', 'sucesso',"Sucesso", 'Vá até o próximo ponto.')
                        blip = true
                    end
                else
                    local DistPonto = Vdist2(x,y,z, rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z)
                    if DistPonto < 15 then
                        if blip then
                            RemoveBlip(blips)
                            blip = false
                        end
                        sleep = 4
                        DrawMarker(21, rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                        if DistPonto <= 1.5 then
                            sleep = 4
                            DrawText3D(rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, '~g~[E] ~w~PARA COLETAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                ComLixos = true
                                vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_cs_rub_binbag_01",50,57005)
                                TriggerEvent('Notify', 'sucesso',"Sucesso", 'Você <b>COLETOU</b> um <b>LIXO</b>, deposite-o no caminhão.')
                                emp.GerarLixo()
                            end
                        end
                    end
                end 
            elseif ComLixos and not acabou then
                if DistCarro < 30 then
                    sleep = 4
                    DrawMarker(0, xCar, yCar, zCar+3.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                    if DistCarro <= 3.5 then
                        sleep = 4
                        DrawText3D(xCar, yCar, zCar, '~g~[E] ~w~PARA GUARDAR O LIXO')
                        if IsControlJustPressed(0,38) then
                            if lixos + 1 < 8 then
                                lixos = lixos + 1
                                ComLixos = false
                                PontoMarcado = false
                            else
                                lixos = lixos + 1
                                ComLixos = false
                                acabou = true
                                TriggerEvent('Notify', 'sucesso',"Sucesso", 'Vá até a <b>CENTRAL</b> para descarregar o caminhão.')
                                if not blip then
                                    CriandoBlip(descargaCentral[1], descargaCentral[2], descargaCentral[3], 408, 38, 0.4, 'Descarregamento de lixos')
                                    vRPclient.playSound("CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                                    blip = true
                                end
                            end
                            ClearPedTasks(ped)
                            vRP.DeletarObjeto()
                        end
                    end
                end
            elseif acabou then
                if not ComLixos and not IsPedInAnyVehicle(ped) then 
                    if DistCarro < 30 then
                        sleep = 4
                        DrawMarker(0, xCar, yCar, zCar+3.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                        if DistCarro <= 3.5 then
                            sleep = 4
                            DrawText3D(xCar, yCar, zCar, '~g~[E] ~w~PARA RETIRAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                lixos = lixos - 1
                                TriggerEvent('Notify', 'aviso',"Aviso", 'Lixos restantes: ' .. lixos .. '/8')
                                ComLixos = true
                                vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_cs_rub_binbag_01",50,57005)
                            end
                        end
                    end
                elseif ComLixos and not IsPedInAnyVehicle(ped) then
                    local DistDescarga = Vdist2(x,y,z, descargaCentral[1], descargaCentral[2], descargaCentral[3])
                    if DistDescarga < 30 then
                        sleep = 4
                        DrawMarker(21, descargaCentral[1], descargaCentral[2], descargaCentral[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,255,255,150, 1, 0, 0, 1)
                        if DistDescarga < 1.5 then
                            sleep = 4
                            DrawText3D(descargaCentral[1], descargaCentral[2], descargaCentral[3], '~g~[E] ~w~PARA ENTREGAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                if lixos > 0 then
                                    TriggerEvent('Notify', 'importante',"Importante", 'Você despejou um lixo, despeje o resto.')
                                else
                                    PontoMarcado = false
                                    acabou = false
                                    lixos = 0
                                    if blip then
                                        blip = false
                                        RemoveBlip(blips)
                                    end
                                    TriggerEvent('Notify', 'sucesso',"Sucesso", 'Você <b>FINALIZOU</b> o serviço, poderá continuar a coleta de lixos.')
                                    -- GERAR PAGAMENTO
                                    emp.GerarRecompensa()
                                end
                                ComLixos = false
                                ClearPedTasks(ped)
                                vRP.DeletarObjeto()
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR F6
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if trabalhando then
            if IsControlJustPressed(0,168) then
                trabalhando = false
                etapa = 0
                ComLixos = false
                lixos = 0
                PontoMarcado = false
                if CarroSpawnado then
                    deleteCar(nveh)
                    CarroSpawnado = false
                end
                if blip then
                    blip = false
                    RemoveBlip(blips)
                end
                ClearPedTasks(ped)
                vRP.DeletarObjeto()
                TriggerEvent('Notify', 'aviso',"Aviso", 'Você cancelou o serviço.')
            end
        end
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function SpawnStockade()
    local mhash = GetHashKey('trash2')
    modelRequest('trash2')
    nveh = CreateVehicle(mhash,spawnStockade[1], spawnStockade[2], spawnStockade[3], spawnStockade[4],true,false)
    SetVehicleOnGroundProperly(nveh)
    SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
    SetEntityAsMissionEntity(nveh,true,true)
    SetModelAsNoLongerNeeded(mhash)
end

function CriandoBlip(x,y,z, sprite, colour, scale, texto)
	blips = AddBlipForCoord(x,y,z)
	SetBlipSprite(blips,sprite)
	SetBlipColour(blips,colour)
	SetBlipScale(blips,scale)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(texto)
	EndTextCommandSetBlipName(blips)
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

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

function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.35, 0.35)
        SetTextColour(r, g, b, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 55, 55, 55, 68)
    end
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function modelRequest(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(10)
	end
end