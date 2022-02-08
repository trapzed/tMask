fx_version 'cerulean'

author 'TrapZed#1725'
description 'tMask'
version '1.0'

game 'gta5'


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

shared_scripts {
    "shared/sh_config.lua",
}

client_scripts{
    '@es_extended/locale.lua',
    "client/cl_tmask.lua",
}

server_scripts{
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    "server/sv_tmask.lua",
}
