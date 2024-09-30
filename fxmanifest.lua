fx_version 'cerulean'
game 'gta5'

description 'Vehicle Rental ZeRwYX System'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

shared_scripts {
    '@es_extended/imports.lua', 
    'config.lua'
}

files {
    'web/index.html',
    'web/script.js',
    'web/style.css',
    'web/img/*.png',
    'locales/*.json'

}

ui_page 'web/index.html'
