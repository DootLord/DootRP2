QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ds-extractors:client:useExtractor', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData() 
    QBCore.Functions.Progressbar("use_extractor", "Placing Extractor!", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bbq@male@idle_a",
        anim = "idle_a",
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@idle_a", "idle_a", 1.0)
        print("Triggered Client")
        createObject(PlayerData)
        TriggerServerEvent("ds-extractors:server:placeExtractor")
    end)
end)

function createObject(player) 
    local extractorModel = `p_oil_pjack_02_s`
    print(extractorModel);
  
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
    local extractor = CreateObject(extractorModel, player.position.x, player.position.y, player.position.z, false, false, false)
end

