fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "id_mainmenu"
description "Main Menu | Responsive UI"
author "grandson#6863"
version "1.0.1"

client_scripts {
    'client/*.lua',
    'shared/*.lua',
}

server_scripts {
    --'@oxmysql/lib/MySQL.lua',
    --'server/*.lua',
    --'shared/*.lua',
}

ui_page "web/index.html"

files {
    'web/index.html',
    'web/script.js',
    'web/style.css',
    'web/img/*.png',
}

dependencies {
	--'oxmysql',
	'/onesync'
}