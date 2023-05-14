fx_version 'cerulean'
game 'gta5'

description 'DS-Forge'
version '1.0.0'

shared_scripts{
    'config.lua',
}

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/main.lua',
}

server_scripts{
    'server/main.lua',
}

lua54 'yes'
