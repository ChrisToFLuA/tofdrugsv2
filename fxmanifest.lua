fx_version 'cerulean'
games {'gta5'}

lua54 'yes'

name         'tofdrugsv2'
version      '1.0.0'
description  'Complete Drugs system V2'
author       'ChrisToF#0851'
repository   'https://github.com/ChrisToFLuA/tofdrugsv2'

dependency {
	'toflib',
	'ox_lib'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@toflib/server/functionssrv.lua',
	'server/tdgsinit.lua',
	'server/functionstofdrugs.lua',
	'server/drugsconfig.lua',
	'server/items.lua',
	'server/srvtofdrugs.lua',
	'server/serverdrugseffect.lua',
}

client_scripts {
	'@toflib/client/functionscli.lua',
	'client/tdgsinit.lua',
	'client/clitofdrugs.lua',
	'client/clientdrugseffect.lua',
	'client/clienttp.lua',
}

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'shared/*.lua'
}

files{
    'locales/*.json'
}
