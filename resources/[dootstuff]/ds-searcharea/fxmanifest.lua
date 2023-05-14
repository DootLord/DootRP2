fx_version 'cerulean'
game 'gta5'

description 'DS-SearchArea'
version '1.0.0'

shared_scripts{
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua',
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}

lua54 'yes'
