---@diagnostic disable: undefined-global

fx_version 'cerulean'
game 'gta5'

description 'QB Tsunami'
name 'qb-tsunami'
developer 'ActuallyStrez, Sky, Tofu, QBCore'
version 'V3'
lua54 'yes'

files {
	'flood.xml'
}

data_file 'WATER_FILE' 'flood.xml'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}


client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

escrow_ignore {
    'config.lua',
    'flood.xml',
    'water.xml',
    'client/main.lua',
    'server/main.lua',
}