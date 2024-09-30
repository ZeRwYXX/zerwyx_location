Locales = {}

function _U(str, ...)
    local lang = Config.Locales or 'fr' 
    if Config.Translations[lang] and Config.Translations[lang][str] then
        return string.format(Config.Translations[lang][str], ...)
    else
        return "Texte introuvable"
    end
end

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("zerwyx_location:attemptRent")
AddEventHandler("zerwyx_location:attemptRent", function(model, price, spawnLocation)
    local xPlayer = ESX.GetPlayerFromId(source)
    local paymentType = Config.PaymentType
    local fundsAvailable = false

    if paymentType == "bank" then
        if xPlayer.getAccount('bank').money >= price then
            xPlayer.removeAccountMoney('bank', price)
            fundsAvailable = true
            TriggerClientEvent("zerwyx_location:showNotification", source, "success", _U('bank_success', price))
        else
            TriggerClientEvent("zerwyx_location:showNotification", source, "error", _U('bank_error'))
        end
    elseif paymentType == "money" then
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            fundsAvailable = true
            TriggerClientEvent("zerwyx_location:showNotification", source, "success", _U('cash_success', price))
        else
            TriggerClientEvent("zerwyx_location:showNotification", source, "error", _U('cash_error'))
        end
    end
    
    if fundsAvailable then
        TriggerClientEvent("zerwyx_location:spawnVehicle", source, model, spawnLocation)
    end
end)
