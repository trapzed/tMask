ESX = nil 

TriggerEvent(Config.Events["esx:getSharedObject"], function(obj) ESX = obj end)

RegisterNetEvent("tMask:buy")
AddEventHandler("tMask:buy", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Price
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source,  "Vous avez payé ~g~"..price.."$")
        TriggerClientEvent('tMask:save', source)
    else 
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez d'argent")
    end
end)

print("")
print("[^5tMask^7] - Made by TrapZed#1725^7")
print("")