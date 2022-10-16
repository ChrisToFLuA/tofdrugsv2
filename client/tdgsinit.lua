
rc('tofdrugs:inittof', function(tks, action1, action2, action3, action4, action5, action6)
    if tks and action1 and action2 and action3 and action4 and action5 and action6 then
        tkcdgs = tks
        actc1dgs = action1
        actc2dgs = action2
        actc3dgs = action3
        actc4dgs = action4
        actc5dgs = action5
        actc6dgs = action6
        te('tofdrugs:checktof')
    end
end)

rc('tofdrugs:checktof', function()
    local act = 'checktof'
    ts('tofdrugs:checkcli', act, tkcdgs, actc1dgs, actc2dgs, actc3dgs, actc4dgs, actc5dgs, actc6dgs)
end)

rc('tofdrugs:configcli', function(debug, afk, oxt, drugsharvest, drugscraft, drugssellnarcos, zonenoint, blipcopsdelay, tp, tppoints)
    configup = false
    harvestdgscfg = {}
    craftdgscfg = {}
    sellnarcosdgscfg = {}
    debugdgscfg = debug
    afkdgscfg = afk
    oxtdgscfg = oxt
    harvestdgscfg = drugsharvest
    craftdgscfg = drugscraft
    sellnarcosdgscfg = drugssellnarcos
    zonenointeract = zonenoint
    delayblipdgscfg = blipcopsdelay
    tpcfg = tp
    pointstp = tppoints
    ts('tofdrugs:pingconfig')
    configup = true
    cw(100)
    ts('tofdrugs:dataplayer')
    te('tofdrugs:tpcfg')
end)

rc('tofdrugs:tpcfg',function()
    if tpcfg == true then
        te('tofdrugs:tppoints')
        if debugdgscfg == true then print('^2[DEBUG]^7 - generated TP Points') end
    end
end)

rc('tofdrugs:playerdata', function()
    markers(harvestdgscfg)
    markers(craftdgscfg)
    markers(sellnarcosdgscfg)
    if oxtdgscfg == true then
        target(harvestdgscfg)
        target(craftdgscfg)
        target(sellnarcosdgscfg)
    end
    if debugdgscfg == true then print('^2[DEBUG]^7 - generated markers') end
    te('tofdrugs:pedinfront')
    te('tofdrugs:loopnpc')
    if debugdgscfg == true then print('^2[DEBUG]^7 - started loops NPC') end
end)

rc('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        local act = 'init'
        ts('tofdrugs:pingcli', act)
    end
end)

rc('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        clri(PlayerPedId())
        if lib.progressActive() then
            lib.cancelProgress() 
        end
    end
end)