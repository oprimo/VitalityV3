local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emp = {}
Tunnel.bindInterface("vitality_lixeiro",emp)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------

local items = { 
"cordas",
"aco",
"kiteletronico",
"pano",
"plastico",

}

function emp.GerarLixo()
	local source = source
	local user_id = vRP.getUserId(source)
	local quantidade = math.random(2,3)		
	local lixo = items[math.random(3,#items)]
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(lixo) <= vRP.getInventoryMaxWeight(user_id) then
			vRP.giveInventoryItem(user_id,lixo,quantidade,true)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Negado","<b>Mochila</b> cheia.") 
			return false
		end
	end
end

function emp.GerarRecompensa(bonus)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local money = math.random(20000,25000)
        vRP.giveMoney(user_id,parseInt(money))
        TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você recebeu <b>$"..vRP.format(parseInt(money)).." dólares</b>.")
    end
end