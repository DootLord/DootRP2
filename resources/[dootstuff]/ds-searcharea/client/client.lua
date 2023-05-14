QBCore = exports['qb-core']:GetCoreObject()

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

RegisterNetEvent('ds-searcharea:client:startSearch', function()
    
    local animDict = "timetable@gardener@clean_pool@";
    local animName = "base_gardener"
    local ped = PlayerPedId()
    local closestPed = GetClosestNPC()
    print(closestPed);
    print(GetPedType(closestPed));
    if(closestPed == -1) then
        QBCore.Functions.Notify("No Dead Animal Found!", 'error')
        return;
    end
    QBCore.Functions.Notify("Attempting to Butcher!")
    TriggerServerEvent('ds-butcher:server:butcherAnimal')
    DeletePed(GetClosestNPC());

    if(searching == false) then
        searching = true;
        QBCore.Functions.Progressbar("searching_area", "Searching Area", 2500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('ds-search:server:getSearchResult')
            searching = false
            TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        end, function() -- Cancel
            searching = false
            TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        end)

        CreateThread(function()
            while searching do
                loadAnimDict(animDict)
                TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
                Wait(2500)
            end
        end)

    else
        QBCore.Functions.Notify("Already Searching!", 'error')
    end
end)

CreateThread(function()
    exports['qb-target']:AddTargetBone(bones, {
        options = {
            ["Check Body"] = {
                icon = "fas fa-cube",
                label = "Check Body",
                action = function(entity)
                    TriggerEvent('ds-npcloot:server:checkBody', entity)
                end,
                distance = 5
            }
        }
    })
end)