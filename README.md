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
### harvest item example
* you can use marker or ped, you can modify coord, quantity, timer etc.
```
{item = 'drug_cannabis', label = 'Weed', qty = 6, timer = 60000, coord = {x = 325.19, y = 6626.65, z = 28.71, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act = 'harvest'},
```
### Labo example
* you can use marker or ped, you can modify coord, timer etc.
```
{item = 'drug_lean', label = 'Lean', timer = 30000, coord = {x = -1363.08, y = -756.03, z = 22.31, h = 274.960}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
```
### craft recipes example
* you can use marker or ped, you can modify coord, quantity, timer etc.
* never remove empty fields
```
{item = 'drug_lean', label = 'Lean', qtyfinal = 6, item1 = 'codein', item2 = 'ice', item3 = 'drink_sprunk', item4 = '', item5 = '', item6 = '', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 0, qty5 = 0, qty6 = 0, act ='craft'},
```
### sell to Narcos example
* you can use marker or ped, you can modify coord, quantity, timer etc.
```
{item = 'drug_cannabis', label = 'Weed', pricemin = 40, pricemax = 50, qtysell = 100, timer = 60000, coord = {x = -1691.27, y = -1071.257, z = 1.831, h = 141.732}, ped = true, type = 'a_m_m_og_boss_01', marker = 31, act ='sell'},
```
### sell to NPC
* you can modify all fields
```
{item = 'drug_cannabis', label = 'Weed', pricemin = 75, pricemax = 90, timer = 15000, act ='sellnpc'},
```
### integrate teleport functionnality
* you can modify all fields
```
---------------------------------------------------- Teleport functions ---------------------------------------------------
-- configure here zones of teleportation
-- entdepart => starting point for entry -------- entarriv => arrival point for entry
-- exitdepart => starting point for exit -------- exitarriv => arrival point for exit
-- ==> DO NOT OVERLAP THE POINTS
---------------------------------------------------------------------------------------------------------------------------

Options.teleport = true                 -- (true | false)

tppoints = {
    ---------------------------------------------------------------------------------------------------------------------------
    {zone = 'zone1', entdepart = {x= 723.38,y=-697.98,z=27.54}, entarriv = {x=998.64,y=-3195.60,z=-38.39}, exitdepart = {x=996.82,y=-3200.56,z=-37.39}, exitarriv = {x=723.41,y=-706.36,z=25.73}},
    ---------------------------------------------------------------------------------------------------------------------------
    {zone = 'zone2', entdepart = {x=1207.47,y=-3122.56,z=4.54}, entarriv = {x=1088.69,y=-3191.37,z=-39.99}, exitdepart = {x=1088.68,y=-3187.56,z=-39.99}, exitarriv = {x=1203.04,y=-3119.71,z=4.54}},
    ---------------------------------------------------------------------------------------------------------------------------
 }

```
