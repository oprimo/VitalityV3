local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_vlbank")

-- Display Map Blips
--[[Citizen.CreateThread(
  function()
    for k, v in ipairs(Config.Banks) do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
)]]

-- NUI Variables
local atBank = false
local atATM = false
local bankOpen = false
local atmOpen = false

local hora = 0
function CalculateTimeToDisplay()
  hora = GetClockHours()
  if hora <= 9 then
    hora = "0" .. hora
  end
end

-- Open Gui and Focus NUI
function openGui()
  CalculateTimeToDisplay()
  --if parseInt(hora) >= 07 and parseInt(hora) <= 17 then
      SetNuiFocus(true, true)
      SendNUIMessage({open = true})
      TriggerServerEvent("vrp_vlbank:showName")
      TriggerServerEvent("vrp_vlbank:openBalance")
  --else
  --    TriggerEvent("Notify","importante","Funcionamento dos bancos é das <b>07:00</b> as <b>18:00</b>.") 
  --end    
end

-- Close Gui and disable NUI
function closeGui()
  if bankOpen or atmOpen then 
    SetNuiFocus(false)
    SendNUIMessage({close = true})
    bankOpen = false
    atmOpen = false
  end
end

Citizen.CreateThread(function()
  while true do
    local kswait = 1000
    if (IsNearBank() or IsNearATM()) then
      kswait = 4
      if (atBank == false) then
        TriggerEvent("Notify","aviso","Aviso","Pressione E para acessar o banco.")
      end
      atBank = true
      if IsControlJustPressed(1, 51) then
        if (IsInVehicle()) then
          TriggerEvent("Notify","aviso","Aviso","Não pode ser usado no veiculo.")
        else
          if bankOpen then
            closeGui()
            bankOpen = false
          else
            openGui()
            bankOpen = true
          end
        end
      end
    else
      if (atmOpen or bankOpen) then
        closeGui()
      end
      atBank = false
      atmOpen = false
      bankOpen = false
    end
    Citizen.Wait(kswait)
  end
end)

Citizen.CreateThread(function()
  while true do
    local kswait = 1000
    if bankOpen or atmOpen then
      kswait = 4
      local ply = PlayerPedId()
      local active = true
      DisableControlAction(0, 1, active)
      DisableControlAction(0, 2, active)
      DisableControlAction(0, 24, active)
      DisablePlayerFiring(ply, true)
      DisableControlAction(0, 142, active)
      DisableControlAction(0, 106, active)
    end
    Citizen.Wait(kswait)
  end
end)

function IsNearATM()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(Config.Atms) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 1.6) then
      return true
    end
  end
end

function IsInVehicle()
  local ply = PlayerPedId()
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function IsNearBank()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(Config.Banks) do
    local distance =
      GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 1.6) then
      return true
    end
  end
end

function IsNearPlayer(player)
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance =
    GetDistanceBetweenCoords(
    ply2Coords["x"],
    ply2Coords["y"],
    ply2Coords["z"],
    plyCoords["x"],
    plyCoords["y"],
    plyCoords["z"],
    true
  )
  if (distance <= 5) then
    return true
  end
end

function notification(title, description, type, returnHome)
  if returnHome == true then
    SendNUIMessage({open = true})
  end
  SendNUIMessage(
    {
      notification = true,
      notification_title = title,
      notification_desc = description,
      notification_type = type
    }
  )
end

RegisterNUICallback("close", function(data)
  closeGui()
end)

RegisterNUICallback("openBalance", function(data)
  TriggerServerEvent("vrp_vlbank:openBalance")
end)

RegisterNUICallback("depositMoney", function(data)
  TriggerServerEvent("vrp_vlbank:depositMoney", data.amount)
end)

RegisterNUICallback("withdrawMoney", function(data)
  TriggerServerEvent("vrp_vlbank:withdrawMoney", data.amount)
end)

RegisterNUICallback("showName", function(data)
  TriggerServerEvent("vrp_vlbank:showName")
end)

RegisterNUICallback("transferMoney", function(data)
  TriggerServerEvent("vrp_vlbank:transferMoney", tonumber(data.userid), tonumber(data.amount))
end)

RegisterNetEvent("vrp_vlbank:notification")
AddEventHandler("vrp_vlbank:notification", function(title, description, type, returnHome)
  notification(title, description, type, returnHome)
end)

RegisterNetEvent("vrp_vlbank:showName")
AddEventHandler("vrp_vlbank:showName", function(firstname, lastname)
  SendNUIMessage({
    showName = true,
    firstname = firstname,
    lastname = lastname
  })
end)

RegisterNetEvent("vrp_vlbank:depositResponse")
AddEventHandler("vrp_vlbank:depositResponse", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then
    notification("Success", "Depósito concluído com sucesso.", "success", false)
    TriggerServerEvent("vrp_vlbank:openBalance")
  else
    notification("Deposit failed", "Você não possui dinheiro suficiente na carteira.", "error", false)
  end
end)

RegisterNetEvent("vrp_vlbank:withdrawResponse")
AddEventHandler("vrp_vlbank:withdrawResponse", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then
    notification("Success", "Você retirou o dinheiro da sua conta com sucesso.", "success", false)
    TriggerServerEvent("vrp_vlbank:openBalance")
  else
    notification("Withdraw failed", "Você não possui dinheiro suficiente pra sacar.", "error", false)
  end
end)

RegisterNetEvent("vrp_vlbank:openBalance")
AddEventHandler("vrp_vlbank:openBalance", function(amount)
  SendNUIMessage({
    openBalance = true,
    balance = amount
  })
end)

RegisterNetEvent("vrp_vlbank:transferResponse")
AddEventHandler("vrp_vlbank:transferResponse", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then    
    notification("Success", "Transferência concluída com sucesso.", "success", false)    
    TriggerServerEvent("vrp_vlbank:openBalance")
  else
    notification("Transfer failed", "Você não possui dinheiro suficiente pra transferir.", "error", false)
  end
end)

RegisterNetEvent("vrp_vlbank:showNotification")
AddEventHandler("vrp_vlbank:showNotification", function(text)
  SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end)

AddEventHandler("onResourceStop", function(resource)
  if resource == GetCurrentResourceName() then
    closeGui()
  end
end)
