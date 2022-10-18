# tofdrugsv2
### Download link For FREE : https://titoff-prod.tebex.io/category/free-scripts
* Complete Drugs System with security tokens and other features
* Resmon : 0.02 ms
* 7 drugs, recipes and effects preconfigured ! you have just to change points or you can custom all drugs as you like ;-)
* if you have any problems to use it, active Options.Debug in config.
* video preview : https://www.youtube.com/watch?v=zF6-1DPqsbM&ab_channel=ChriSToF-LUAScripts-Fivem-ReDM
* discord : https://discord.gg/B45FXcrqCt 
* forum : https://forum.cfx.re/t/free-complete-drugs-script-v2-fully-configurable-esx-legacy-0-02-ms/4928306/2

# Wiki
* https://github.com/ChrisToFLuA/tofdrugsv2/wiki
## Dependencies
* toflib : https://github.com/ChrisToFLuA/toflib/releases
* ox_lib : https://github.com/overextended/ox_lib/releases
* ESX Legacy

## Compatible with
* ox_inventory : https://github.com/overextended/ox_inventory/releases
* ox_target : https://github.com/overextended/ox_target/releases

## Install
* Others dependencies and optionnal scripts must start before tofdrugsv2 in the order of the server.cfg
## Security
* functions and triggers rewrited
* tokens to identify resource and client / server actions
* events server securised
* just restart the resource and tokens change if you need (tokens are generated at every restart of your server or of your resource.
* it's not fort knox, but it makes it harder for little kids who like to cheat and research triggers.

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
* don't modify 'act' at the end of lines.
```
{item = 'drug_cannabis', label = 'Weed', qty = 6, timer = 60000, coord = {x = 325.19, y = 6626.65, z = 28.71, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act = 'harvest'},
```
### Labo example
* you can use marker or ped, you can modify coord, timer etc.
* don't modify 'act' at the end of lines.
```
{item = 'drug_lean', label = 'Lean', timer = 30000, coord = {x = -1363.08, y = -756.03, z = 22.31, h = 274.960}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
```
### craft recipes example
* you can use marker or ped, you can modify coord, quantity, timer etc.
* never remove empty fields
* don't modify 'act' at the end of lines.
```
{item = 'drug_lean', label = 'Lean', qtyfinal = 6, item1 = 'codein', item2 = 'ice', item3 = 'drink_sprunk', item4 = '', item5 = '', item6 = '', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 0, qty5 = 0, qty6 = 0, act ='craft'},
```
### sell to Narcos example
* you can use marker or ped, you can modify coord, quantity, timer etc.
* don't modify 'act' at the end of lines.
```
{item = 'drug_cannabis', label = 'Weed', pricemin = 40, pricemax = 50, qtysell = 100, timer = 60000, coord = {x = -1691.27, y = -1071.257, z = 1.831, h = 141.732}, ped = true, type = 'a_m_m_og_boss_01', marker = 31, act ='sell'},
```
### sell to NPC
* don't modify 'act' at the end of lines.
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
### Manage Items in Database with script
```
---------------------------------------------------------------------------------------------------------------------------
-- configure here if you want the script manage the item's script in DB, so you will modify here the field of these items
-- and the script manage the update and the creation of these items in your database.
-- ** the database must contain at least fields : 'name' - 'label' - 'weight' **
---------------------------------------------------------------------------------------------------------------------------
-- if you use ox_inventory, the tremendous work of the overextended team means that the ox_inventory will automatically
-- download new items added to the db into the items.lua file.
---------------------------------------------------------------------------------------------------------------------------

Options.ManageDB = false     -- (true | false)

itemstocreate = {
    -------------------------------------------------------------------- Items BDD -------------------------------------------------------------------
    {name = 'drug_cannabis', label = 'Weed', weight = 100},
    {name = 'drug_opium', label = 'Opium', weight = 100},
    {name = 'drug_lean', label = 'Lean', weight = 100},
    {name = 'drug_cocaine', label = 'Cocaine', weight = 100},
    {name = 'drug_lsd', label = 'LSD', weight = 100},
    {name = 'drug_ecstasy', label = 'Ecstasy', weight = 50},
    {name = 'drug_meth', label = 'Methamphetamine', weight = 100},
    {name = 'codein', label = 'Codeine', weight = 50},
    {name = 'ice', label = 'ice', weight = 50},
    {name = 'drink_sprunk', label = 'Sprunk', weight = 50},
    {name = 'cocaleaves', label = 'Coca Leaves', weight = 50},
    {name = 'gasoline', label = 'Gasoline', weight = 50},
    {name = 'solvent', label = 'Solvent', weight = 50},
    {name = 'carbon', label = 'Carbon', weight = 50},
    {name = 'hydrogen', label = 'Hydrogen', weight = 50},
    {name = 'oxygen', label = 'Oxygen', weight = 50},
    {name = 'nitrogen', label = 'Nitrogen', weight = 50},
    {name = 'jolly_ranchers', label = 'Jolly ranchers', weight = 50},
    {name = 'red_sulfur', label = 'Red sulfur', weight = 50},
    {name = 'liquid_sulfur', label = 'Liquid sulfur', weight = 50},
    {name = 'muriatic_acid', label = 'Muriatic acid', weight = 50},
    {name = 'ammonium_nitrate', label = 'Ammonium nitrate', weight = 50},
    {name = 'sodium_hydroxide', label = 'Sodium hydroxide', weight = 50},
    {name = 'pseudoefedrine', label = 'Pseudoefedrine', weight = 50},
    --------------------------------------------------------------------------------------------------------------------------------------------------
}
```
