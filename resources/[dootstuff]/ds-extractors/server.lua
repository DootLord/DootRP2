QBCore = exports['qb-core']:GetCoreObject()

extractorReferences = {};
-- Add Item Listener

QBCore.Functions.CreateUseableItem("metalextractor", function(source)
  TriggerClientEvent("ds-extractors:client:useExtractor", source)
end)

-- Server Logic Listeners

RegisterNetEvent('ds-extractors:server:placeExtractor', function()
  local extractorModel = `p_oil_pjack_02_s`
  print(extractorModel);
  local Player = QBCore.Functions.GetPlayer(source)

  if not Player then print("No Player") return end

  if not HasModelLoaded(extractorModel) then
    RequestModel(extractorModel)
    print("Requsting Model")
    while not HasModelLoaded(extractorModel) do
      Citizen.Wait(1)
      print("waiting")
    end
  end

  print("Creating Object")
  local extractor = CreateObject(extractorModel, Player.PlayerData.coords.x, Player.PlayerData.coords.y, Player.PlayerData.coords.z, true, true, false)

  
end)