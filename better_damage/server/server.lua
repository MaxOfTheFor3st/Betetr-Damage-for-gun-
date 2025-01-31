ESX = exports.es_extended:getSharedObject()


RegisterNetEvent("removebandage", function()
local source = source
local xPlayer = ESX.GetPlayerFromId(source)

xPlayer.removeInventoryItem("bandage", 1)

end)

