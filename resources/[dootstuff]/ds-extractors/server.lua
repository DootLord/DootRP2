QBCore = exports['qb-core']:GetCoreObject()
local extractors = {}

extractorReferences = {};
-- Add Item Listener

QBCore.Functions.CreateUseableItem("metalextractor", function(source)
  TriggerClientEvent("ds-extractors:client:useExtractor", source)
end)

-- Server Logic Listeners

RegisterNetEvent("ds-extractors:server:placeExtractor", function(playerCoords, player)
  print("Extractor Logic Server Triggered")

  local player = QBCore.Functions.GetPlayer(source)
  local extractorModel = `p_oil_pjack_02_s`
  local extractor = CreateObjectNoOffset(extractorModel, playerCoords.x, playerCoords.y, playerCoords.z, true)
  table.insert(extractors, extractor);
  local extractorId = exports["ds-core"]:uuid()
  print("Extractor ID: " .. extractorId)
  MySQL.insert('INSERT INTO extractor (id, x, y, z, max, resource, owner) VALUES (?, ?, ?, ?, ?, ?, ?)', {
    extractorId,
    playerCoords.x,
    playerCoords.y,
    playerCoords.z,
    100,
    "copper",
    player.PlayerData.citizenid
  })

  -- TODO: Check if this is consistant!
  local lastId = MySQL.query.await("SELECT LAST_INSERT_ID() AS id")
  print(lastId[1].id);
  print(extractors);
end)