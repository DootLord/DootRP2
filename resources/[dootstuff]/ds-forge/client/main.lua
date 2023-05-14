QBCore = exports['qb-core']:GetCoreObject()

-- Create Forge Zone
forgeZone = {
    isInside = false,
    zone = BoxZone:Create(Config.ForgePos, 10, 10, {
      name="Forge",
      minZ = Config.ForgePos.z-1.0,
      maxZ = Config.ForgePos.z+1.0,
      debugPoly=true
    })
}
forgeZone.zone:onPlayerInOut(function(isPointInside)
  forgeZone.isInside = isPointInside
  if forgeZone.isInside then
    QBCore.Functions.Notify("Fart")

    -- if k==random then
    --   CreateThread(function()
    --     while grapeZones[k].isInside and k==random do
    --       exports['qb-core']:DrawText(Lang:t("task.start_task"),'right')
    --       if not IsPedInAnyVehicle(PlayerPedId()) and IsControlJustReleased(0,38) then
    --         PickAnim()
    --         pickProcess()
    --         exports['qb-core']:HideText()
    --         random = 0
    --       end
    --       Wait(1)
    --     end
    --   end)
    -- end
  end
end)