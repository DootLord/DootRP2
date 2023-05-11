QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ds-npcloot:server:checkBody', function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("meat", 1)
end)