fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'QBCore Tsunami'
name 'qb-tsunami'
website 'https://qbcore-framework.github.io/qb-docs/'
developer 'ActuallyStrez, QBCore Discord'
version 'V2'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

escrow_ignore {
    'client/main.lua',  -- Only ignore one file
    'server/main.lua', -- Works for any file, stream or code
}