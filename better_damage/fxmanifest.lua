fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Maxo'
description 'Better Gun damage for your server'

shared_script "@ox_lib/init.lua"

client_scripts {
    'config.lua',
    'client/*.lua'
}
server_scripts {
	'server/*.lua'
}