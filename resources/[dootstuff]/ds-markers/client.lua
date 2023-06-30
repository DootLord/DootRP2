QBCore = exports['qb-core']:GetCoreObject()

local markers = {
    {x = 448.41, y = -1017.28, z = 28.55, type = 36, color = 1, size = 1.0, id = 1}, --Police Garage
}
vector3(448.87, -1017.4, 28.55)
Citizen.CreateThread(function()
    while true do
        local sleep = 2500
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, 448.41, -1017.28, 28.55, true)

        if dist < 30.0 then
            sleep = 0
            print("Drawing Markers")
            DrawMarker(36, 448.41, -1017.28, 28.55 , 0.0, 0.0, 0.0, 0.0, 0, 0.0, 2.0, 2.0, 2.0, 40, 60, 150, 200, false, true, 2, nil, nil, false)
        end

        Citizen.Wait(sleep)
    end
end)