rs('tofdrugs:configsrv', function()
    configloaddgs = false
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------
-------------- general parameters -----------------
---------------------------------------------------
Options =  {}
Options.Debug = true                -- Config here the debug mode (true | false)
Options.afkf = true     -- config if the afk farm is allow (true | false)
Options.inventory = 'oxinventory'-- config your inventory here (oxinventory | default)
Options.oxtarget = true         -- config if you want to use oxtarget

Options.mincopsh = 0            -- config here the minimum number of cops to harvest
Options.mincopsc = 0             -- config here the minimum number of cops to craft
Options.mincopss = 0             -- config here the minimum number of cops to sell to narcos
Options.mincopsnpc = 0          -- config here the minimum number of cops to sell to npc

Options.alertlspdw = 10        -- config here the % of chance that cops will be alerted when there's wholesale sell
Options.alertlspdnpc = 20        -- config here the % of chance that cops will be alerted when there's npc sell
Options.delayblip = 60000    -- config here the delay of the blip lspd when there' npc sell

Options.nonpc = 20              -- config here the % of chance that npc refuse a sell

---------------------------------------------------------- WebHook --------------------------------------------------------
-- it is advisable to create your webhooks on a discord different from the main discord
-- webhook cheat = webhook with information needed to ban offline a cheater (triggers research etc.)
-- webhook stats = to let you know where is illegal on your server. When a player disconnects, global stats for manufacturing,
-- processing, sales, etc. on your discord (can also be useful for refunds etc.)
---------------------------------------------------------------------------------------------------------------------------

Options.webhook = true
Options.webhookcheat = 'https://discord.com/api/webhooks/1029500625890857051/61XVRkRpSq6YRKaNAxMB3vuOjH1ShzbHDhKzSmaeL8RRhb79hgrP0H54KkkFhHxYMRxl'
Options.webhookstat = 'https://discord.com/api/webhooks/1029500625890857051/61XVRkRpSq6YRKaNAxMB3vuOjH1ShzbHDhKzSmaeL8RRhb79hgrP0H54KkkFhHxYMRxl'

-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- config harvest items -------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drugsharvest = {
    ------------------------------------------------------------------------- Weed ------------------------------------------------------------------
    {item = 'drug_cannabis', label = 'Weed', qty = 6, timer = 60000, coord = {x = 325.19, y = 6626.65, z = 28.71, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act = 'harvest'},
    ------------------------------------------------------------------------- Opium -----------------------------------------------------------------
    {item = 'drug_opium', label = 'Opium', qty = 6, timer = 60000, coord = {x = -94.01, y = 2893.87, z = 51.58, h = 167.244}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    ------------------------------------------------------------------------- Lean ------------------------------------------------------------------
    {item = 'codein', label = 'Codein', qty = 9, timer = 60000, coord = {x = 157.16, y = 6657.42, z = 31.56, h = 65.196}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    ----------------------------------------------------------------------- Cocaine -----------------------------------------------------------------
    {item = 'cocaleaves', label = 'Coca Leaves', qty = 8, timer = 60000, coord = {x = 3680.08, y = 4528.90, z = 24.81, h = 201.259}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    {item = 'gasoline', label = 'Gasoline', qty = 8, timer = 60000, coord = {x = 2758.04, y = 1478.64, z = 30.79, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    {item = 'solvent', label = 'Solvent', qty = 8, timer = 60000, coord = {x = 1050.85, y = -2483.52, z = 29.43, h = 351.496}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    --------------------------------------------------------------------- LSD / Ecstasy --------------------------------------------------------------
    {item = 'carbon', label = 'Carbon', qty = 8, timer = 60000, coord = {x = 2632.26, y = 2935.41, z = 40.42, h = 62.362}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    {item = 'hydrogen', label = 'Hydrogen', qty = 8, timer = 60000, coord = {x = 561.26, y = -485.30, z = 24.98, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    {item = 'oxygen', label = 'Oxygen', qty = 8, timer = 60000, coord = {x = 319.33, y = -560.18, z = 28.74, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
    {item = 'nitrogen', label = 'Nitrogen', qty = 8, timer = 60000, coord = {x = -190.13, y = 6067.82, z = 31.38, h = 104.881}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     ------------------------------------------------------------------------ Meth -------------------------------------------------------------------
     {item = 'red_sulfur', label = 'Red Sulfur', qty = 8, timer = 60000, coord = {x = -540.923, y = 2021.063, z = 203.007, h = 257.952}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     {item = 'liquid_sulfur', label = 'Liquid Sulfur', qty = 8, timer = 60000, coord = {x = -602, y = 2088.65, z = 132.69, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     {item = 'muriatic_acid', label = 'Muriatic Acid', qty = 8, timer = 60000, coord = {x = 2675.7, y = 3499.38, z = 54.30, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     {item = 'ammonium_nitrate', label = 'Ammonium Nitrate', qty = 8, timer = 60000, coord = {x = 3560.89, y = 3674.34, z = 28.12, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     {item = 'sodium_hydroxide', label = 'Sodium Hydroxide', qty = 8, timer = 60000, coord = {x = 3538.20, y = 3660.09, z = 28.12, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     {item = 'pseudoefedrine', label = 'pseudoefedrine', qty = 8, timer = 60000, coord = {x = 249.41, y = -1374.78, z = 39.53, h = 221.103}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='harvest'},
     -------------------------------------------------------------------------------------------------------------------------------------------------
}

-------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- config craft labos -------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drugscraft = {
    ------------------------------------------------------------------------ Lean -------------------------------------------------------------------
    {item = 'drug_lean', label = 'Lean', timer = 30000, coord = {x = -1363.08, y = -756.03, z = 22.31, h = 274.960}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
    ----------------------------------------------------------------------- Cocaine -----------------------------------------------------------------
    {item = 'drug_cocaine', label = 'Cocaine', timer = 30000, coord = {x = 1091.74, y = -3196.88, z = -38.99, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
    ----------------------------------------------------------------------- LSD ---------------------------------------------------------------------
    {item = 'drug_lsd', label = 'LSD', timer = 30000, coord = {x = 1389.20, y = 3605.03, z = 38.94, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
    ------------------------------------------------------------------- Ecstasy ---------------------------------------------------------------------
    {item = 'drug_ecstasy', label = 'Ecstasy', timer = 30000, coord = {x = 2329.04, y = 2571.28, z = 46.68, h = 0.00}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
    ------------------------------------------------------------------- Meth ---------------------------------------------------------------------
    {item = 'drug_meth', label = 'Methamphetamine', timer = 30000, coord = {x = 1009.65, y = -3194.97, z = -38.99, h = 11.338}, ped = false, type = 'a_m_m_rurmeth_01', marker = 31, act ='craft'},
    -------------------------------------------------------------------------------------------------------------------------------------------------
}

-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- config craft recipes -------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drugscraftrecipes = {
    ------------------------------------------------------------------------ Lean -------------------------------------------------------------------
    {item = 'drug_lean', label = 'Lean', qtyfinal = 6, item1 = 'codein', item2 = 'ice', item3 = 'drink_sprunk', item4 = '', item5 = '', item6 = '', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 0, qty5 = 0, qty6 = 0, act ='craft'},
    ----------------------------------------------------------------------- Cocaine -----------------------------------------------------------------
    {item = 'drug_cocaine', label = 'Cocaine', qtyfinal = 6, item1 = 'cocaleaves', item2 = 'gasoline', item3 = 'solvent', item4 = '', item5 = '', item6 = '', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 0, qty5 = 0, qty6 = 0, act ='craft'},
    ----------------------------------------------------------------------- LSD ---------------------------------------------------------------------
    {item = 'drug_lsd', label = 'LSD', qtyfinal = 6, item1 = 'carbon', item2 = 'hydrogen', item3 = 'oxygen', item4 = 'nitrogen', item5 = '', item6 = '', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 6, qty5 = 0, qty6 = 0, act ='craft'},
    -------------------------------------------------------------------- Ecstasy --------------------------------------------------------------------
    {item = 'drug_ecstasy', label = 'Ecstasy', qtyfinal = 6, item1 = 'carbon', item2 = 'hydrogen', item3 = 'oxygen', item4 = 'nitrogen', item5 = 'jolly_ranchers', item6 ='', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 6, qty5 = 6, qty6 = 0, act ='craft'},
    ---------------------------------------------------------------------- Meth ---------------------------------------------------------------------
    {item = 'drug_meth', label = 'Methamphetamine', qtyfinal = 6, item1 = 'red_sulfur', item2 = 'liquid_sulfur', item3 = 'muriatic_acid', item4 = 'ammonium_nitrate', item5 = 'sodium_hydroxide', item6 = 'pseudoefedrine', qty1 = 6, qty2 = 6, qty3 = 6, qty4 = 6, qty5 = 6, qty6 = 6, act ='craft'},
    -------------------------------------------------------------------------------------------------------------------------------------------------
}

-------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- config sell items --------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

drugssellnarcos = {
    ------------------------------------------------------------------------ Lean -------------------------------------------------------------------
    {item = 'drug_cannabis', label = 'Weed', pricemin = 40, pricemax = 50, qtysell = 100, timer = 60000, coord = {x = -1691.27, y = -1071.257, z = 1.831, h = 141.732}, ped = true, type = 'a_m_m_og_boss_01', marker = 31, act ='sell'},
    ----------------------------------------------------------------------- Opium -------------------------------------------------------------------
    {item = 'drug_opium', label = 'Opium', pricemin = 50, pricemax = 60, qtysell = 100, timer = 60000, coord = {x = -298.852, y = -2768.716, z = 2.185, h = 320.314}, ped = true, type = 'a_m_o_salton_01', marker = 31, act ='sell'},
    ----------------------------------------------------------------------- Lean ---------------------------------------------------------------------
    {item = 'drug_lean', label = 'Lean', pricemin = 100, pricemax = 120, qtysell = 100, timer = 60000, coord = {x = 1554.197, y = -2710.193, z = 3.88, h = 124.724}, ped = true, type = 'a_m_y_genstreet_01', marker = 31, act ='sell'},
    ---------------------------------------------------------------------- Cocaine -------------------------------------------------------------------
    {item = 'drug_cocaine', label = 'Cocaine', pricemin = 150, pricemax = 180, qtysell = 100, timer = 60000, coord = {x = 2771.432, y = -727.147, z = 7.830, h = 218.267}, ped = true, type = 'a_m_y_genstreet_0', marker = 31, act ='sell'},
    -------------------------------------------------------------------------- LSD -------------------------------------------------------------------
    {item = 'drug_lsd', label = 'LSD', pricemin = 280, pricemax = 320, qtysell = 100, timer = 60000, coord = {x = 3760.839, y = 4580.545, z = 3.516, h = 256.118}, ped = true, type = 'a_m_y_mexthug_01', marker = 31, act ='sell'},
    ---------------------------------------------------------------------- Ecstasy -------------------------------------------------------------------
    {item = 'drug_ecstasy', label = 'Ecstasy', pricemin = 300, pricemax = 360, qtysell = 100, timer = 60000, coord = {x = 1579.305, y = 6663.046, z = 2.792, h = 59.527}, ped = true, type = 'a_m_y_vindouche_01', marker = 31, act ='sell'},
    -------------------------------------------------------------------------- Meth -------------------------------------------------------------------
    {item = 'drug_meth', label = 'Methamphetamine', pricemin = 400, pricemax = 480, qtysell = 100, timer = 60000, coord = {x = -2279.802, y = 4394.320, z = 17.097, h = 79.370}, ped = true, type = 'a_m_m_rurmeth_01', marker = 31, act ='sell'},
    --------------------------------------------------------------------------------------------------------------------------------------------------
}

drugssellNPC = {
    ------------------------------------------------------------------------ Weed -------------------------------------------------------------------
    {item = 'drug_cannabis', label = 'Weed', pricemin = 75, pricemax = 90, timer = 15000, act ='sellnpc'},
    ----------------------------------------------------------------------- Opium -------------------------------------------------------------------
    {item = 'drug_opium', label = 'Opium', pricemin = 80, pricemax = 95, timer = 15000, act ='sellnpc'},
    ----------------------------------------------------------------------- Lean ---------------------------------------------------------------------
    {item = 'drug_lean', label = 'Lean', pricemin = 180, pricemax = 250, timer = 15000, act ='sellnpc'},
    ---------------------------------------------------------------------- Cocaine -------------------------------------------------------------------
    {item = 'drug_cocaine', label = 'Cocaine', pricemin = 300, pricemax = 350, timer = 15000, act ='sellnpc'},
    -------------------------------------------------------------------------- LSD -------------------------------------------------------------------
    {item = 'drug_lsd', label = 'LSD', pricemin = 550, pricemax = 650, timer = 15000, act ='sellnpc'},
    ---------------------------------------------------------------------- Ecstasy -------------------------------------------------------------------
    {item = 'drug_ecstasy', label = 'Ecstasy', pricemin = 650, pricemax = 750, timer = 15000, act ='sellnpc'},
    -------------------------------------------------------------------------- Meth -------------------------------------------------------------------
    {item = 'drug_meth', label = 'Methamphetamine', pricemin = 900, pricemax = 1050, timer = 15000, act ='sellnpc'},
    --------------------------------------------------------------------------------------------------------------------------------------------------
 }

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
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
    configloaddgs = true
    print('^2[CONFIG]^7 Drugs Config Loaded ServeR SidE ')
    if Options.ManageDB == true then
        te('tofdrugs:verifitemsbdd') 
    end
end)