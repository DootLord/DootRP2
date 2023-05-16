QBCore = exports['qb-core']:GetCoreObject()

-- Forces all players in first person if they're aiming a gun
if Config.NonVehicle then
    CreateThread(function()
        while true do
            sleep = 1000
            local _, weapon = GetCurrentPedWeapon(PlayerPedId())
            if weapon == `WEAPON_UNARMED` or weapon == `WEAPON_FLASHLIGHT` then
                sleep = 1000
            else
                sleep = 1
                if IsPlayerFreeAiming(PlayerId()) then
                    SetFollowPedCamViewMode(4)
                else
                    SetFollowPedCamViewMode(0)
                end
            end
        Wait(sleep)
        end
    end)
end

if Config.InCar then
    CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local _, weapon = GetCurrentPedWeapon(ped)
            local unarmed = `WEAPON_UNARMED`
            local inVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                sleep = 1000
            if IsPedInAnyVehicle(PlayerPedId()) and weapon ~= unarmed then
                sleep = 1
                if IsPedDoingDriveby(PlayerPedId()) then
                    SetFollowVehicleCamViewMode(4)
                else
                    SetFollowVehicleCamViewMode(0)
                    end
                end
                Wait(sleep)
            end
        end)
    end
    
    
    if Config.InBike then
        CreateThread(function()
            while true do
                sleep = 1000
                local _, weapon = GetCurrentPedWeapon(PlayerPedId())
                local unarmed = `WEAPON_UNARMED`
                if IsPedOnAnyBike(PlayerPedId()) and weapon ~= unarmed then
                    sleep = 1
                    if IsControlJustPressed(0, 25) then
                        SetCamViewModeForContext(2, 4)
                    elseif IsControlJustReleased(0, 25) then
                        SetCamViewModeForContext(2, 0)
                    end
                else
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)
    end

