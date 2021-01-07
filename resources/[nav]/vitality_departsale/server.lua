local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "militec", quantidade = 1, compra = 7500, venda = 1250 },
	{ item = "repairkit", quantidade = 1, compra = 4000 },
	{ item = "ferramenta", quantidade = 2, compra = 20, venda = 10 },
	{ item = "serra", quantidade = 1, compra = 10000, venda = 5000 },
	{ item = "furadeira", quantidade = 1, compra = 2500, venda = 1500 },
	{ item = "radio", quantidade = 1, compra = 1000},
	{ item = "mochila", quantidade = 1, compra = 5000},
	{ item = "roupas", quantidade = 1, compra = 5000, venda = 500 },
	{ item = "alianca", quantidade = 1, compra = 500, venda = 150 },
	{ item = "celular", quantidade = 1, compra = 2500, venda = 1000 },
	{ item = "energetico", quantidade = 3, compra = 1000, venda = 100 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("departamento-comprar")
AddEventHandler("departamento-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryFullPayment(user_id,parseInt(v.compra),true) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"financeiro","Financeiro","Comprou <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> por <b>$"..vRP.format(parseInt(v.compra)).." dólares</b>.")
					else
						TriggerClientEvent("Notify",source,"financeiro","Financeiro","Dinheiro insuficiente.")
					end
				else
						TriggerClientEvent("Notify",source,"importante","Importante","Espaço insuficiente.")
				end
			end
		end
	end
end)