fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

name 'radius-viewer'
version '1.1.0'
description 'Admin radius viewer - draws a circle around the player'

dependencies {
    'rsg-core',
}

shared_scripts {
    'config.lua',
    'locale.lua',
    'languages/*.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}
