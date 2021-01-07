local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_vlbank")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbancodepositou = "https://discordapp.com/api/webhooks/772736954064044102/ZFU7EnZHTOSzXweMJdSj6xE07hNk1qNmmcGbzvqeFeGtq3UnBmr_-EBup3l6P7NmpHU5"
local webhookbancosacou = "https://discordapp.com/api/webhooks/772737059923427338/PS5Ub8q6y_qAzB0l7xmgMYoA9fH4gfuYhp875TW6m0lLVVTkf93dy3GY1aOF5d_fOe1S"
local webhookbancotransferiu = "https://discordapp.com/api/webhooks/772737109596831755/GFxSuY9y3p6U15jGUzMCfA8zxr_JgSWXFl2vEsRuPOJrMEHcpqtkeqCuNfWrWsjSUum0"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANCO
-----------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------
--[ PAGAR MULTAS ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('multas',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)

	local value = vRP.getUData(parseInt(user_id),"vRP:multas")
	local multas = json.decode(value) or 0
	local banco = vRP.getBankMoney(user_id)
	
	if user_id then
		if args[1] == nil then
			if multas >= 1 then
				TriggerClientEvent("Notify",source,"aviso","Aviso","Você possuí <b>$"..multas.." reais em multas</b> para pagar.",8000)
			else
				TriggerClientEvent("Notify",source,"aviso","Aviso","Você <b>não possuí</b> multas para pagar.",8000)
			end
		elseif args[1] == "pagar" then
			local valorpay = vRP.prompt(source,"Saldo de multas: $"..multas.." - Valor de multas a pagar:","")
			if banco >= parseInt(valorpay) then
				if parseInt(valorpay) <= parseInt(multas) then
					vRP.setBankMoney(user_id,parseInt(banco-valorpay))
					vRP.setUData(user_id,"vRP:multas",json.encode(parseInt(multas)-parseInt(valorpay)))
					TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você pagou <b>$"..valorpay.." reais</b> em multas.",8000)
				else
					TriggerClientEvent("Notify",source,"aviso","Aviso","Você não pode pagar mais multas do que deve.",8000)
				end
			else
				TriggerClientEvent("Notify",source,"Financeiro","Financeiro","Você não tem dinheiro em sua conta suficiente para isso.",8000)
			end
		end
	end
end)

RegisterServerEvent('vrp_vlbank:depositMoney')
AddEventHandler('vrp_vlbank:depositMoney', function(amount)
    local user_id = vRP.getUserId(source)
    local _source = source
    local identity = vRP.getUserIdentity(user_id)
    if parseInt(amount) > 0 then
        if vRP.tryDeposit(user_id,tonumber(amount)) then
            local identity = vRP.getUserIdentity(user_id)
            TriggerClientEvent("vrp_vlbank:depositResponse", _source, true)
            SendWebhookMessage(webhookbancodepositou,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEPOSITOU]: R$"..vRP.format(parseInt(amount)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        else
            TriggerClientEvent("vrp_vlbank:depositResponse", _source, false)
        end
    end
end)

RegisterServerEvent('vrp_vlbank:withdrawMoney')
AddEventHandler('vrp_vlbank:withdrawMoney', function(amount)
    local user_id = vRP.getUserId(source)
    local _source = source
    local identity = vRP.getUserIdentity(user_id)
    if vRP.tryWithdraw(user_id,tonumber(amount)) then
        TriggerClientEvent("vrp_vlbank:withdrawResponse", _source, true)
        local identity = vRP.getUserIdentity(user_id)
        SendWebhookMessage(webhookbancosacou,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SACOU]: R$"..vRP.format(parseInt(amount)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent("vrp_vlbank:withdrawResponse", _source, false)
    end
end)

RegisterServerEvent('vrp_vlbank:showName')
AddEventHandler('vrp_vlbank:showName', function()
    local _source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local identity = vRP.getUserIdentity(user_id)
        TriggerClientEvent("vrp_vlbank:showName", _source, identity.firstname, identity.name)
    end
end)

RegisterServerEvent('vrp_vlbank:openBalance')
AddEventHandler('vrp_vlbank:openBalance', function()
    local _source = source
    local user_id = vRP.getUserId(source)
    local money = vRP.getBankMoney(user_id)
    TriggerClientEvent("vrp_vlbank:openBalance", _source, vRP.format(money))
end)

RegisterServerEvent('vrp_vlbank:transferMoney')
AddEventHandler('vrp_vlbank:transferMoney', function(userid, amount)
    local _source = source
    local user_id = vRP.getUserId(source)
    local targetPlayer = vRP.getUserSource(tonumber(userid))
    local identity = vRP.getUserIdentity(user_id)
    local identityT = vRP.getUserIdentity(userid)
    if targetPlayer == nil then
        return TriggerClientEvent("vrp_vlbank:notification", _source, "Transfer Falhou", "Este Cidadão não mora na cidade.", "error", true)
    end
    local myBank = vRP.getBankMoney(user_id)
    if myBank >= amount then
        vRP.setBankMoney(user_id, myBank - amount)
        vRP.giveBankMoney(userid,amount)

        TriggerClientEvent("Notify",targetPlayer,"financeiro","Financeiro","Você recebeu R$" .. amount .." de " .. identity.firstname .. " " .. identity.name)
        TriggerClientEvent("vrp_vlbank:transferResponse", _source, true)

        SendWebhookMessage(webhookbancotransferiu,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: R$"..vRP.format(parseInt(amount)).."\n[PARA]:"..userid.." "..identityT.name.." "..identityT.firstname.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent("vrp_vlbank:transferResponse", _source, false)
    end
end)