QBCore = exports['qb-core']:GetCoreObject()
local butchering = false
local animals = {
    name = "Cow",
    model = "a_c_cow",
    meatItem = "meat"
}

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

function GetClosestNPC(coords)
	local pedPool = GetGamePool("CPed")
	local coords = coords or GetEntityCoords(PlayerPedId())
	local closestPed = -1
	local closestDist = -1
	for _, ped in pairs(pedPool) do
		if not IsPedAPlayer(ped) and IsPedDeadOrDying(ped) and GetPedType(ped) == 28 then 
			local distance = #(coords - GetEntityCoords(ped))
			if closestDist == -1 or distance < closestDist then
				closestPed = ped
				closestDist = distance
			end
		end
	end
	return closestPed, closestDist
end

RegisterNetEvent('ds-butcher:client:startButcher', function()    
    local animDict = "timetable@gardener@clean_pool@";
    local animName = "base_gardener"
    local ped = PlayerPedId()
    local closestPed = GetClosestNPC()

    if(closestPed == -1 or GetPedType(closestPed) ~= 28) then
        QBCore.Functions.Notify("No Dead Animal Found!", 'error')
        return;
    end
    
    TriggerServerEvent('ds-butcher:server:butcherAnimal')
    DeletePed(GetClosestNPC());
end)

RegisterNetEvent('ds-butcher:client:butcherEnd', function(num)
    QBCore.Functions.Notify("You butchered " .. num .. " meat!")
end)





