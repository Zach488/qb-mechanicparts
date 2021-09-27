fx_version 'cerulean'
game 'gta5'

author 'DrB1ackBeard'
description 'qb-mechanicparts for QBCore Created By DrB1ackBeard'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua'
}

server_script 'server/main.lua'
