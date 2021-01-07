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
Tunnel.bindInterface("vrp_radio",src)
vCLIENT = Tunnel.getInterface("vrp_radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.activeFrequency(freq)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(freq) >= 1 and parseInt(freq) <= 999 then
			if parseInt(freq) == 911 then
				if vRP.hasPermission(user_id,"dpla.permissao") then
					vCLIENT.startFrequency(source,parseInt(911))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>911</b> dos <b>Policiais</b>.")
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.")
				end
			elseif parseInt(freq) == 912 then
				if vRP.hasPermission(user_id,"dmla.permissao") then
					vCLIENT.startFrequency(source,parseInt(912))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>912</b> dos <b>Paramédicos</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 909 then
				if vRP.hasPermission(user_id,"dpla.permissao") then
					vCLIENT.startFrequency(source,parseInt(909))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>909</b> dos <b>Policiais</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 910 then
				if vRP.hasPermission(user_id,"dpla.permissao") then
					vCLIENT.startFrequency(source,parseInt(910))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>910</b> dos <b>Policiais</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end				
			elseif parseInt(freq) == 913 then
				if vRP.hasPermission(user_id,"mecanico.permissao") then
					vCLIENT.startFrequency(source,parseInt(913))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>913</b> dos <b>Mecânicos</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 914 then
				if vRP.hasPermission(user_id,"ballas.permissao") then
					vCLIENT.startFrequency(source,parseInt(914))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>914</b> dos crias <b>Ballas</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 915 then
				if vRP.hasPermission(user_id,"vagos.permissao") then
					vCLIENT.startFrequency(source,parseInt(915))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>915</b> dos crias <b>Vagos</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 916 then
				if vRP.hasPermission(user_id,"grove.permissao") then
					vCLIENT.startFrequency(source,parseInt(916))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>916</b> dos crias <b>Groove</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end								
			elseif parseInt(freq) == 917 then
				if vRP.hasPermission(user_id,"britanica.permissao") then
					vCLIENT.startFrequency(source,parseInt(917))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>917</b> da <b>Máfia Britânica</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end
			elseif parseInt(freq) == 918 then
				if vRP.hasPermission(user_id,"lifeinvader.permissao") then
					vCLIENT.startFrequency(source,parseInt(918))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>918</b> da <b>LifeInvader</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end		
			elseif parseInt(freq) == 919 then
				if vRP.hasPermission(user_id,"galaxy.permissao") then
					vCLIENT.startFrequency(source,parseInt(919))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>919</b> da <b>Galaxy</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end	
			elseif parseInt(freq) == 920 then
				if vRP.hasPermission(user_id,"bloods.permissao") then
					vCLIENT.startFrequency(source,parseInt(920))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>920</b> dos crias <b>Bloods</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end	
			elseif parseInt(freq) == 921 then
				if vRP.hasPermission(user_id,"crips.permissao") then
					vCLIENT.startFrequency(source,parseInt(921))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>921</b> dos crias <b>Crips</b>.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não tem permissão para entrar nesta frequência.",8000)
				end	
			else
				vCLIENT.startFrequency(source,parseInt(freq))
				TriggerClientEvent("Notify",source,"sucesso","Sucesso","Entrou na frequência <b>"..parseInt(freq).."</b>.",8000)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Aviso","Frequência não encontrada.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
		return true
	else
		TriggerClientEvent("Notify",source,"importante","Importante","Você precisa comprar um <b>Rádio</b> na <b>Loja de Departamento</b>.",8000)
		return false
	end
end