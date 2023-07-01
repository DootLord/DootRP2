fx_version 'cerulean'
game 'gta5'

description 'DS-Core'
version '1.0.0'

shared_scripts{
    'config.lua',
}

client_scripts{
    'client/main.lua',
}

server_scripts{
    'server/locations.lua',
    'server/helper.lua',
}

lua54 'yes'
