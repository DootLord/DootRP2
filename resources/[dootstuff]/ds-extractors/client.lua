QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onClientMapStart', function()
    Citizen.CreateThread(function()
      TriggerEvent('ds-extractors:DisplayUI', false)
    end)
end)

RegisterNetEvent('ds-extractors:DisplayUI')

AddEventHandler('ds-extractors:DisplayUI', function(value)
    SendNUIMessage({
      type = "ui",
      display = value
    })
end)

-- Player activating a extractor inventory item
RegisterNetEvent('ds-extractors:client:useExtractor', function()
    local ped = PlayerPedId()
    
    QBCore.Functions.Progressbar("use_extractor", "Placing Extractor!", 500, false, true, {
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
        createObject()
        
    end)
end)

RegisterNetEvent("ds-extractors:client:openExtractor", function(event)
    print(event)
    print("Attemmpting to open extractor")
end)

-- Create the extractor object in the world
-- TODO: Check this actually appears in the world for other players
function createObject() 
    local playerCoords = GetEntityCoords(PlayerPedId());
    local extractorModel = `p_oil_pjack_02_s`
    -- Object needs to be loaded before we create it
    requestFiveMModel(extractorModel)
    -- Create the object
    print("TRIGGERING SERVER")
    TriggerServerEvent("ds-extractors:server:placeExtractor", playerCoords, QBCore.PlayerData)

    -- Setup Targeting/Interaction
    exports["qb-target"]:AddBoxZone("extractor", playerCoords, 2, 5, {
        name = "extractor",
        heading = 11,
        debugPoly = true,
      },{
        options = {
            {   
                type = "client",
                event = "ds-extractors:client:openExtractor",
                
            },
        },
        distance = 5  
      })
end

function SetExtractorInteraction(extractor) 

end

-- Trigger HTML UI
function loadUI(bool) 
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
end

-- Helper shorthand for requesting a FiveM model
function requestFiveMModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
          Citizen.Wait(1)
        end
    end
end

-- Callback for HTML extract event
RegisterNUICallback('extract', function(data, cb)
    loadUI(false);
    cb('ok')
end)


