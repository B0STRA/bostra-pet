fx_version "cerulean"
game "gta5"

description "Pet Cats and Dogs, or chickens or whatever?"

author 'Bostra'

version '1.0'

lua54 'yes'

client_script 'client.lua'
server_script 'server.lua'
shared_script 'config.lua'
dependencies {
    'qb-target',
    'qb-core',
}