-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "utilidades-comprar-isca" then
		TriggerServerEvent("departamento-comprar","isca")
	elseif data == "utilidades-comprar-celular" then
		TriggerServerEvent("departamento-comprar","celular")
	elseif data == "utilidades-comprar-militec" then
		TriggerServerEvent("departamento-comprar","militec")
	elseif data == "utilidades-comprar-reparos" then
		TriggerServerEvent("departamento-comprar","repairkit")
	elseif data == "utilidades-comprar-ferramentas" then
		TriggerServerEvent("departamento-comprar","ferramenta")
	elseif data == "utilidades-comprar-bandagem" then
		TriggerServerEvent("departamento-comprar","bandagem")
	elseif data == "utilidades-comprar-serra" then
		TriggerServerEvent("departamento-comprar","serra")
	elseif data == "utilidades-comprar-furadeira" then
		TriggerServerEvent("departamento-comprar","furadeira")	
	elseif data == "utilidades-comprar-radio" then
		TriggerServerEvent("departamento-comprar","radio")
	elseif data == "utilidades-vender-militec" then
		TriggerServerEvent("departamento-vender","militec")
	elseif data == "utilidades-vender-reparos" then
		TriggerServerEvent("departamento-vender","repairkit")
	elseif data == "utilidades-vender-ferramentas" then
		TriggerServerEvent("departamento-vender","ferramenta")
	elseif data == "utilidades-vender-serra" then
		TriggerServerEvent("departamento-vender","serra")
	elseif data == "utilidades-vender-furadeira" then
		TriggerServerEvent("departamento-vender","furadeira")	
	elseif data == "vestuario-comprar-mochila" then
		TriggerServerEvent("departamento-comprar","mochila")
	elseif data == "vestuario-comprar-roupas" then
		TriggerServerEvent("departamento-comprar","roupas")
	elseif data == "vestuario-vender-mochila" then
		TriggerServerEvent("departamento-comprar","absinto")
	elseif data == "bebidas-comprar-energetico" then
		TriggerServerEvent("departamento-comprar","energetico")
	elseif data == "bebidas-vender-energetico" then
		TriggerServerEvent("departamento-vender","energetico")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local marcacoes = {
	{ 25.65,-1346.58,29.49 },
	{ 2556.75,382.01,108.62 },
	{ 1163.54,-323.04,69.20 },
	{ -707.37,-913.68,19.21 },
	{ -47.73,-1757.25,29.42 },
	{ 373.90,326.91,103.56 },
	{ -3243.10,1001.23,12.83 },
	{ 1729.38,6415.54,35.03 },
	{ 547.90,2670.36,42.15 },
	{ 1960.75,3741.33,32.34 },
	{ 2677.90,3280.88,55.24 },
	{ 1698.45,4924.15,42.06 },
	{ -1820.93,793.18,138.11 },
	{ 1392.46,3604.95,34.98 },
	{ -2967.82,390.93,15.04 },
	{ -3040.10,585.44,7.90 },
	{ 1135.56,-982.20,46.41 },
	{ 1165.91,2709.41,38.15 },
	{ -1487.18,-379.02,40.16 },
	{ -1222.78,-907.22,12.32 },
	{ -1074.1,-2735.98,0.82 }, -- aeroporto
	{ -1089.11,-834.63,23.04 }, -- DP
	{ 343.37,-597.72,43.13 } -- HP
	
}

RegisterCommand('dcomprar', function(source, args, rawCmd)
	SetNuiFocus(false,false)
		for _,mark in pairs(marcacoes) do
			local x,y,z = table.unpack(mark)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			if distance <= 2.0 then
						ToggleActionMenu()
					else
					end
				end
end)