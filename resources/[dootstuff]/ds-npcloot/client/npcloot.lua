QBCore = exports['qb-core']:GetCoreObject()
local bones = {"RB_R_ThighRoll", "RB_L_ThighRoll", "SKEL_Pelvis", "SKEL_R_Thigh", "SKEL_R_Thigh", "4103", "11816"}

RegisterNetEvent('ds-npcloot:client:checkBody', function(entity)
    print("checkBody")
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