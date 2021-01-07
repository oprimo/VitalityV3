local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

primo = {}
Tunnel.bindInterface("vitality_rout_l",primo)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}

function primo.Quantidade()
	local source = source

	if quantidade[source] == nil then
	   quantidade[source] = math.random(10,12)	
	end

	TriggerClientEvent("quantidade-key",source,parseInt(quantidade[source]))
end


local key = {}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(key) do
            if v > 0 then
                key[k] = v - 1
            end
        end
    end
end)

function primo.checkPayment()
	primo.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("keysinvasao")*quantidade[source] <= vRP.getInventoryMaxWeight(user_id) then
			vRP.giveInventoryItem(user_id,"keysinvasao",quantidade[source])
			vRP.giveInventoryItem(user_id,"energetico",math.random(1,2))
			quantidade[source] = nil
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Negado","<b>Mochila</b> cheia.")
			return false
		end
	end
end

function primo.checkGroup()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"life.permissao") or vRP.hasPermission(user_id,"bahamas.permissao") then
        return true
    end
end