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

