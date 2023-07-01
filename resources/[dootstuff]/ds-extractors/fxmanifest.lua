fx_version 'cerulean'
game 'gta5'

description 'DS-extractors'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts{
    'config.lua',
}

client_scripts{
    'client.lua',
}

server_scripts{
    'server.lua',
    '@oxmysql/lib/MySQL.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/lib/loading-bar/loading-bar.min.css',
    'html/lib/loading-bar/loading-bar.min.js',
}

lua54 'yes'
