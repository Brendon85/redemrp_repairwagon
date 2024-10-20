RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:wagonrepairkit")
AddEventHandler("RegisterUsableItem:wagonrepairkit", function(source)
    local _source = source
    local ItemData = data.getItem(_source ,  "wagonrepairkit")
    TriggerClientEvent("redemrp_repair", _source)
end)
