fx_version 'cerulean'
game 'gta5'

description 'QBCore Tsunami'
name 'qb-tsunami'
website 'https://qbcore-framework.github.io/qb-docs/'
developer 'ActuallyStrez, QBCore Discord'
version 'V1'

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core',
    'qb-phone'
}

lua54 'yes'
