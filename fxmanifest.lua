fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'AG'
description 'AG Auto Revive System [QB]'
version 'V1'


client_script {
    'client.lua'
}

server_script {
    'server.lua'
}

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

dependency {
  'ox_lib',
  'qb-ambulancejob'
}