QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ds-butcher:server:butcherAnimal', function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local meatAmount = math.random(1, 10);
    
    Player.Functions.AddItem("meat", meatAmount);
    TriggerClientEvent('ds-butcher:client:butcherEnd', meatAmount)
end)