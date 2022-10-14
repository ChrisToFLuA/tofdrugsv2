# tofdrugsv2
* Complete Drugs System with security tokens and other features
* Resmon : 0.02 ms

## Dependencies
* toflib : https://github.com/ChrisToFLuA/toflib/releases
* ox_lib : https://github.com/overextended/ox_lib/releases

## Compatible with
* ox_inventory : https://github.com/overextended/ox_inventory/releases
* ox_target : https://github.com/overextended/ox_target/releases

## Install
* Others dependencies and optionnal scripts must start before tofdrugsv2 in the order of the server.cfg

## Config /server/drugsconfig.lua
### general parameters
```
Options.Debug = false               -- Config here the debug mode (true | false)
Options.afkf = false                -- config if the afk farm is allow (true | false)
Options.inventory = 'default'       -- config your inventory here (oxinventory | default)
Options.oxtarget = false            -- config if you want to use oxtarget

Options.mincopsh = 0                -- config here the minimum number of cops to harvest
Options.mincopsc = 0                -- config here the minimum number of cops to craft
Options.mincopss = 0                -- config here the minimum number of cops to sell to narcos
Options.mincopsnpc = 0              -- config here the minimum number of cops to sell to npc

Options.alertlspdw = 10             -- config here the % of chance that cops will be alerted when there's wholesale sell
Options.alertlspdnpc = 20           -- config here the % of chance that cops will be alerted when there's npc sell
Options.delayblip = 60000           -- config here the delay of the blip lspd when there' npc sell

Options.nonpc = 20                  -- config here the % of chance that npc refuse a sell
```
### webhooks
it is advisable to create your webhooks on a discord different from the main discord 
* webhook cheat = webhook with information needed to ban offline a cheater (triggers research etc.)
* webhook stats = to let you know where is illegal on your server. When a player disconnects, global stats for manufacturing, processing, sales, etc. on your discord (can also be useful for refunds etc.).
```
Options.webhook = true
Options.webhookcheat = 'https://discord.com/api/webhooks/1029500625890857051/61XVRkRpSq6YRKaNAxMB3vuOjH1ShzbHDhKzSmaeL8RRhb79hgrP0H54KkkFhHxYMRxl'
Options.webhookstat = 'https://discord.com/api/webhooks/1029500625890857051/61XVRkRpSq6YRKaNAxMB3vuOjH1ShzbHDhKzSmaeL8RRhb79hgrP0H54KkkFhHxYMRxl'
```
