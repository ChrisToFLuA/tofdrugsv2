tks = {}
acts = {}

rs('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        te('toflib:pingkeysdrugs')
    end
end)

rs('tofdrugs:inittk', function(tofdrugsv2tks, tofdrugsv2acts)
    keysdrugsloaded = false
    for k,v in ipairs(tofdrugsv2tks) do
        tks['tk'..k] = v
    end
    for k,v in ipairs(tofdrugsv2acts) do
        acts['act'..k] = v
    end
    tkdgs = (tks.tk1)
    act1dgs = (acts.act1)
    act2dgs = (acts.act2)
    act3dgs = (acts.act3)
    act4dgs = (acts.act4)
    act5dgs = (acts.act5)
    act6dgs = (acts.act6)
    local resource = 'tofdrugsv2'
    te('toflib:ping', resource)
    te('tofdrugs:configsrv')
    keysdrugsloaded = true
end)

rs('tofdrugs:pingrenewkeys', function()
    te('toflib:renewdrugs')
    print('^2[KEYS RENEW]^7 PinG ReneW KeyS from LiB')
end)

rs('tofdrugs:pingcli', function(act)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    pingkeysdrugs = false
    if act and act == 'init' then
        while true do
            if keysdrugsloaded == true and pingkeysdrugs == false then
                tc('tofdrugs:inittof', xPlayer.source, tkdgs, act1dgs, act2dgs, act3dgs, act4dgs, act5dgs, act6dgs)
                print('^2[KEYS INIT]^7 IniT KeYs ChecK Client - ^3ID: ^2'..id..'^7 - ^2'..nameP..'^7')
                if pingkeysdrugs == true then break end  
            end
            cw(500)
        end
    else
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    end
end)

rs('tofdrugs:checkcli', function(act, tkcdgs, actc1dgs, actc2dgs, actc3dgs, actc4dgs, actc5dgs, actc6dgs)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    if act and act == 'checktof' then
        local check = nego(tkcdgs, tkdgs)
        cw(200)
        if check == true then 
            print('^2[TK]^7 KeYs ChecK ^2[OK]^3 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
            if actc1dgs == act1dgs and actc2dgs == act2dgs and actc3dgs == act3dgs and actc4dgs == act4dgs and actc5dgs == act5dgs and actc6dgs == act6dgs then
                print('^2[ACTS]^7 ActS ChecK ^2[OK]^3 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
                te('tofdrugs:configsendcli', xPlayer.source)
                pingkeysdrugs = true
            else
                print('^3[ACTS]^7 ActS ChecK ^3[**KO**]^3 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license)
            end
        else
            print('^3[TK]^7 KeYChecK ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license)
        end
    else
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    end
end)

rs('tofdrugs:configsendcli', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local debug = Options.Debug
    local afk = Options.afkf
    local oxt = Options.oxtarget
    local tp = Options.teleport
    local blipcopsdelay = Options.delayblip
    tc('tofdrugs:configcli', xPlayer.source, debug, afk, oxt, drugsharvest, drugscraft, drugssellnarcos, zonenointeract, blipcopsdelay, tp, tppoints)
    print('^2[CONFIG]^7 Send Config Data to Client ^3ID: ^2'..id..'^7 - ^2'..nameP..'^7')
end)

rs('tofdrugs:pingconfig', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    print('^2[CONFIG]^7 Config Data ReveiveD ^2[OK]^7 ^3ID: ^2'..id..'^7 - ^2'..nameP..'^7')
end)

rs('tofdrugs:dataplayer', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    print(xPlayer.job.name)
    if Options.Debug then print('^2[DEBUG]^7 - Check Job ^3to Load Script ^2[DONE]^7') end
    if xPlayer.job.name ~= 'police' or xPlayer.job.name ~= 'ambulance' then
        tc('tofdrugs:playerdata', xPlayer.source)
        if Options.Debug then print('^2[DEBUG]^7 - Your Job ^3allow you to Load Script ^2[DONE]^7') end
    else
        --if Options.Debug then print('^2[DEBUG]^7 - Your Job ^3doesn\'t allow you to Load Script [WARNING]^7') end
    end
end)

AddEventHandler('playerDropped', function (reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in ipairs(drugsharvest) do
        count = 0
        for j,u in ipairs(harvesthook) do
            if u[1] == xPlayer.source then
                if u[2] == v.item then
                    count = count + u[3]
                end 
            end
        end
        nameitem = v.label
        if count and nameitem and count > 0 and nameitem ~= '' then
            te('tofdrugs:webhookharvest', xPlayer.source, nameitem, count)
        end
    end
    for k,v in ipairs(drugscraft) do
        count = 0
        for j,u in ipairs(crafthook) do
            if u[1] == xPlayer.source then
                if u[2] == v.item then
                    count = count + u[3]
                end 
            end
        end
        nameitem = v.label
        if count and nameitem and count > 0 and nameitem ~= '' then
            te('tofdrugs:webhookcraft', xPlayer.source, nameitem, count)
        end
    end
    for k,v in ipairs(drugssellnarcos) do
        count = 0
        price = 0
        for j,u in ipairs(sellwhook) do
            if u[1] == xPlayer.source then
                if u[2] == v.item then
                    count = count + u[3]
                    price = price + u[4]
                end 
            end
        end
        nameitem = v.label
        if count and price and nameitem and count > 0 and price > 0 and nameitem ~= '' then
            te('tofdrugs:webhooksellw', xPlayer.source, nameitem, count, price)
        end
    end
    for k,v in ipairs(drugssellNPC) do
        price = 0
        for j,u in ipairs(sellnpchook) do
            if u[1] == xPlayer.source then
                if u[2] == v.item then
                    price = price + u[3]
                end 
            end
        end
        nameitem = v.label
        if price and nameitem and price > 0 and nameitem ~= '' then
            te('tofdrugs:webhooksellnpc', xPlayer.source, nameitem, price)
        end
    end
end)

---- Github Updater ----

function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local CurrentVersion = GetCurrentVersion()
local resourceName = "^4["..GetCurrentResourceName().."]^0"

PerformHttpRequest('https://raw.githubusercontent.com/ChrisToFLuA/tofdrugsv2/main/VERSION', function(Error, NewestVersion, Header)
	print("###############################")
    if CurrentVersion == NewestVersion then
	    print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    elseif CurrentVersion ~= NewestVersion then
        print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
        print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/ChrisToFLuA/tofdrugsv2/releases/tag/v'.. NewestVersion .. '^0')
    end
	print("###############################")
end)