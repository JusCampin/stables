fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
author 'BCC Team'

dependency 'feather-menu'

shared_scripts {
    'configs/main.lua',
    'debug_init.lua',
    'configs/stables.lua',
    'configs/breeds/index.lua',
    'locale.lua',
    'languages/*.lua'
}

client_scripts {
    'configs/horses_loader.lua',
    'client/client_init.lua',
    'client/main.lua',
    'client/menus/stable_main.lua',
    'client/menus/feather_menu.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server_init.lua',
    'server/main.lua'
}

files {
    'configs/breeds/*.lua'
}

version '1.0.0'