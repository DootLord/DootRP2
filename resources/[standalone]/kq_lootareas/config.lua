Config = {}

Config.debug = false



--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = true,
    oldEsx = false,
    -- Whether or not to use the new ESX export method
    useNewESXExport = false,
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it
}

Config.target = {
    enabled = false,
    system = 'qb-target' -- 'qtarget' or 'qb-target' or 'ox_target'  (Other systems might work as well)
}

Config.keybinds = {
    collect = 'E',
}
