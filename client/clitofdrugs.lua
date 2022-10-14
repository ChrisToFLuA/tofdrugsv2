local soldped = {}
local afkfarm = false
local NextState = 0
local NextAction = 0
local animselldgs = false
drugpeds = {}
a = 0

lib.locale()

rc('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
    local act = 'init'
    ts('tofdrugs:pingcli', act)
end)

rc('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)


---------------------------------------------------------------------------------------------
-- Markers
---------------------------------------------------------------------------------------------

rc('tofdrugs:marker1', function(coord, type)
    Model(type)
    local group = 'drugs'
    drugped = genped(type, coord, group)
    local drugpedid = NetworkGetNetworkIdFromEntity(drugped)
    a = a + 1
    table.insert(drugpeds, a, drugpedid)
    if debug then print('^2[DEBUG]^7 - ^2Genrated^7 Marker ^3Type 1 ^2[DONE]^7') end
end)

rc('tofdrugs:marker2', function(coord, type, item, label, timer, act)
    Model(type)
    local group = 'drugs'
    drugped = genped(type, coord, group)
    local drugpedid = NetworkGetNetworkIdFromEntity(drugped)
    a = a + 1
    table.insert(drugpeds, a, drugpedid)
    if debug then print('^2[DEBUG]^7 - ^2Genrated^7 Marker ^3Type 2 ^2[DONE]^7') end 
	while true do
		cw(0)
		local dist = distcoord(PlayerPedId(), coord)
		if dist > 20 then 
			cw(3000)
		elseif dist > 3 then
			inrange = false
			cw(10)
		elseif dist <= 3 then
            inrange = true
	        DrawText3D(coord.x, coord.y, coord.z + 1.10, locale('interactaction'))
            local pedveh = IsPedInAnyVehicle(PlayerPedId(), true)
            if IsControlJustPressed(0, 38) and not pedveh then
                te('tofdrugs:dispatchmarker_c', act, item, label, timer)
            end
		end
	end
end)

rc('tofdrugs:marker3', function(marker, coord)
    if debug then print('^2[DEBUG]^7 - ^2Genrated^7 Marker ^3Type 3 ^2[DONE]^7') end
	while true do
		cw(0)
		local dist = distcoord(PlayerPedId(), coord)
		if dist > 20 then 
			cw(3000)     
		elseif dist > 3 then
			DrawMarker(marker, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.18, 0.18, 0.18, 255, 0, 0, 200, true, true, 2, true, nil, nil, false)
            inrange = false
			cw(10)
		elseif dist <= 3 then
			DrawMarker(marker, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.18, 0.18, 0.18, 255, 0, 0, 200, true, true, 2, true, nil, nil, false)
            inrange = true
		end
	end
end)

rc('tofdrugs:marker4', function(marker, coord, item, label, timer, act)
    if debug then print('^2[DEBUG]^7 - ^2Genrated^7 Marker ^3Type 4 ^2[DONE]^7') end
	while true do
		cw(0)
		local dist = distcoord(PlayerPedId(), coord)
		if dist > 20 then 
			cw(3000)
		elseif dist > 3 then
			DrawMarker(marker, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 255, 0, 0, 200, true, true, 2, true, nil, nil, false)
			inrange = false
			cw(10)
		elseif dist <= 3 then
			DrawMarker(marker, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 255, 0, 0, 200, true, true, 2, true, nil, nil, false)
            inrange = true
	        DrawText3D(coord.x, coord.y, coord.z, locale('interactaction'))
            local pedveh = IsPedInAnyVehicle(PlayerPedId(), true)
            if IsControlJustPressed(0, 38) and not pedveh then
                te('tofdrugs:dispatchmarker_c', act, item, label, timer)
            end
		end
	end
end)

rc('tofdrugs:dispatchmarker_c', function(act, item, label, timer)
    dispatchmarker(act, item, label, timer)
    if debug then print('^2[DEBUG]^7 - Event ^3dispatch marker ^2[Done]^7') end
end)

---------------------------------------------------------------------------------------------
-- state
---------------------------------------------------------------------------------------------

rc('tofdrugs:afkfarmstate', function()
    if afkdgscfg then
        if GetGameTimer() > NextState then
            afkfarm = not afkfarm
            if afkfarm == false then 
                te('tofdrugs:notifsdgs', 'stopaction', 'inform', 0, '', 0)
            end
            SetNextState(2000)
        else
            print('stop spam state !')
        end
    end
end)

rc('tofdrugs:resetNextAction', function()
    NextAction = 0
end)

---------------------------------------------------------------------------------------------
-- NPC
---------------------------------------------------------------------------------------------
rc('tofdrugs:pedinfront', function()
        while true do
            ped = GetPedInFront()
            cw(4000)
        end
end)

rc('tofdrugs:loopnpc', function()
    while true do
        sellnpcqtoff()
        cw(10)
    end 
end)


rc('tofdrugs:actionsellnpcqtoff_c', function(item, lblitem, count, timer, pay, entity)
	if GetGameTimer() > NextAction and animselldgs == false then
		local ped = NetworkGetNetworkIdFromEntity(entity)
		ts('tofdrugs:actionsellnpcqtoff_s', tkcdgs, actc4dgs, item, lblitem, count, timer, pay, entity)
		table.insert(soldped, ped)
		SetNextAction(timer)
	else
		-- notif spam
	end
end)

---------------------------------------------------------------------------------------------
-- Animations
---------------------------------------------------------------------------------------------

rc('tofdrugs:animharvest', function(timer, item)
	if timer ~= nil then
        if debug then print('^2[DEBUG]^7 - started ^3Anim Harvest ^2[Done]^7') end
		if item == 'drug_cannabis' or item == 'drug_opium' or item == 'cocaleaves' then
			TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', 0, false)
			cw(timer)
			clri(PlayerPedId())
		else
			TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
			cw(timer)
			clri(PlayerPedId())
		end
        if debug then print('^2[DEBUG]^7 - End ^3Anim Harvest ^2[Done]^7') end
	else
        if debug then print('^2[DEBUG]^7 - Timer or Item ^3[ERROR]^7') end
    end
end)

rc('tofdrugs:animcraft', function(timer)
	if timer then
        if debug then print('^2[DEBUG]^7 - started ^3Anim Craft ^2[Done]^7') end
		TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, false)
		cw(timer)
		clri(PlayerPedId())
        if debug then print('^2[DEBUG]^7 - End ^3Anim Craft ^2[Done]^7') end
	else
        if debug then print('^2[DEBUG]^7 - Timer or Entity ^3[ERROR]^7') end
    end
end)

rc('tofdrugs:animsell', function(timer)
    if timer then
        if debug then print('^2[DEBUG]^7 - started ^3Anim Sell Narcos ^2[Done]^7') end
	    loaddict('mp_common')
	    local count = round(timer / 1800)
	    for n = 1,count,1 do
		    playerAnim(PlayerPedId(), 'mp_common', 'givetake1_a')
		    cw(1800)
	    end
	    clri(PlayerPedId())
        if debug then print('^2[DEBUG]^7 - End ^3Anim Sell Narcos ^2[Done]^7') end
    else
        if debug then print('^2[DEBUG]^7 - Timer ^3[ERROR]^7') end
    end
end)

rc('tofdrugs:animsellnpc', function(timer, entity)
	if timer and entity then
        if debug then print('^2[DEBUG]^7 - started ^3Anim Sell NPC ^2[Done]^7') end
        animselldgs = true
        loaddict('mp_common')
	    local count = round(timer / 1800)
	    clri(entity)
	    TaskSetBlockingOfNonTemporaryEvents(entity, true)						
	    TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
	    TaskTurnPedToFaceEntity(PlayerPedId(), entity, -1)
	    cw(1000)
	    freeze(PlayerPedId())
	    freeze(entity)
	    for n = 1,count,1 do
		    playerAnim(PlayerPedId(), 'mp_common', 'givetake1_a')
		    cw(200)
		    playerAnim(entity, 'mp_common', 'givetake1_a')
		    cw(1800)
	    end
	    playerAnim(PlayerPedId(), 'mp_ped_interaction', 'hugs_guy_a')
	    playerAnim(entity, 'mp_ped_interaction', 'hugs_guy_a')
	    cw(2500)
	    clri(PlayerPedId())
	    clri(entity)
	    dfreeze(PlayerPedId())
	    dfreeze(entity)
	    RemovePedElegantly(entity)
        animselldgs = false
        if debug then print('^2[DEBUG]^7 - End ^3Anim Sell NPC ^2[Done]^7') end
    else
        if debug then print('^2[DEBUG]^7 - Timer or Entity ^3[ERROR]^7') end
    end
end)

rc('tofdrugs:timeranim', function(timer)
    lib.progressCircle({
        duration = timer,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
    })
end)

---------------------------------------------------------------------------------------------
-- Alerte lspd
---------------------------------------------------------------------------------------------

rc('tofdrugs:alertlspd_c', function()
	local coordP = GetEntityCoords(PlayerPedId())
	if debug then print('^2[DEBUG]^7 - send ServerEvent ^3check Cops to Alert ^2[Done]^7') end
    ts('tofdrugs:alertlspd_s', coordP)
end)

rc('tofdrugs:blip', function(coordP, id)
    if debug then print('^2[DEBUG]^7 - started ^3Blip Diffusion ^2[Done]^7') end
	if trackingBlip[id] then
		SetBlipCoords(trackingBlip[id], coordP.x, coordP.y, coordP.z)
	else
		trackingBlip[id] = AddBlipForCoord(coordP.x, coordP.y, coordP.z)
		SetBlipSprite(trackingBlip[id], 51)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("drugstracking")
		EndTextCommandSetBlipName(trackingBlip[id])
	end
	cw(delayblipdgscfg)
	RemoveBlip(trackingBlip[id])
    if debug then print('^2[DEBUG]^7 - Remove ^3Blips ^2[Done]^7') end
end)

---------------------------------------------------------------------------------------------
-- notifs
---------------------------------------------------------------------------------------------

rc('tofdrugs:notifsdgs', function(text, type, qty, label, pay)
    local textnotif = locale(text)
    if qty and label and pay and qty > 0 and label ~= '' and pay > 0 then
        local text = tostring(textnotif..' '..qty..' x '..label..' + '..pay..'$')
        notif(text, type)
    elseif qty and label and qty > 0 and label ~= '' then
        local text = tostring(textnotif..' '..qty..' x '..label)
        notif(text, type)
    elseif not qty and not label and pay and pay > 0 then
        local text = tostring(textnotif..' '..pay..'$')
        notif(text, type)
    else
        notif(textnotif, type)
    end
    if debug then print('^2[DEBUG]^7 - Notification ^3Send ^2[Done]^7') end
end)

---------------------------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------------------------

function SetNextAction(timer)
    NextAction = GetGameTimer() + timer 
end

function SetNextState(timerstate)
    NextState = GetGameTimer() + timerstate
end

function markers(table)
    for k, v in ipairs(table) do
        local marker = v.marker 
        local coord = v.coord
        local pedON = v.ped
        local type = v.type
        local item = v.item
        local label = v.label
        local timer = v.timer
        local action = v.act
        if action == 'harvest' then act = actc1dgs end
        if action == 'craft' then act = actc2dgs end
        if action == 'sell' then act = actc3dgs end        
        if pedON and oxtdgscfg then
            te('tofdrugs:marker1', coord, type)
        end
        if pedON and not oxtdgscfg then
            te('tofdrugs:marker2', coord, type, item, label, timer, act)
        end
        if not pedON and oxtdgscfg then
            te('tofdrugs:marker3', marker, coord)
        end
        if not pedON and not oxtdgscfg then
            te('tofdrugs:marker4', marker, coord, item, label, timer, act)
        end
    end
end

function target(table)
    for a = 1,#table, 1 do
        local coord = table[a].coord
        local item = table[a].item
        local itemlbl = table[a].label
        local timer = table[a].timer
        local actions = table[a].act
        local namezone = tostring('zone'..a)
        local minz = coord.z - 1.0
        local maxz = coord.z + 2.0
        if actions == 'harvest' then act = actc1dgs end
        if actions == 'craft' then act = actc2dgs end
        if actions == 'sell' then act = actc3dgs end
        te('tofdrugs:targetmenus', namezone, coord, item, itemlbl, timer, act)
    end
end

actiontarget = function(act, item, label, timer)
    local pedveh = IsPedInAnyVehicle(PlayerPedId(), true)
    if not pedveh then
        local timer = tonumber(timer)
        te('tofdrugs:dispatchmarker_c', act, item, label, timer)
    end
end

rc('tofdrugs:targetmenus', function(namezone, coord, item, label, timer, act)
    if oxtdgscfg == true then
        exports.ox_target:addBoxZone({
            coords = vec3(coord.x, coord.y, coord.z),
            size = vec3(3, 3, 3),
            rotation = coord.h,
            debug = drawZones,
            options = {
                {
                    name = namezone,
                    icon = 'fa-solid fa-cube',
                    label = locale('interact'),
                    onSelect = function(data)

                        actiontarget(act, item, label, timer)
                    end,
                    distance = 2.0,
                }
            }
        })
    end
end)

function dispatchmarker(act, item, label, timer)
    if debug then print('^2[DEBUG]^7 - Started Function ^3dispatch ^2[Done]^7') end
    if not act or act ~= actc1dgs and act ~= actc2dgs and act ~= actc3dgs then
        ts('tofdrugs:webhookalert', tkcdgs)
    end
    te('tofdrugs:afkfarmstate')
    if afkdgscfg == true then
        if debug then print('^2[DEBUG]^7 - started ^3AFK Farm condition ^2[TRUE]^7') end
        if act and (act == actc1dgs or act == actc2dgs) then
            if debug then print('^2[DEBUG]^7 - ^3Harvest and Craft Condiion ^2[Done]^7') end
            local timerext = timer + 2000
            if GetGameTimer() > NextAction then
                while afkfarm do
                    if debug then print('^2[DEBUG]^7 - started ^3AFK Farm loop ^2[Done]^7') end
                    if inrange then
                        if debug then print('^2[DEBUG]^7 - ^3IN Range Condition ^2[TRUE]^7') end
                        ts('tofdrugs:nbcops', tkcdgs, act, item, label, timer)
                        if debug then print('^2[DEBUG]^7 - send ServerEvent ^3check NB Cops ^2[Done]^7') end
                        SetNextAction(timerext)
                        if debug then print('^2[DEBUG]^7 - Set ^3NexTAction Timer ^2[Done]^7') end
                        cw(timerext)
                        cw(0)
                    else
                        if debug then print('^2[DEBUG]^7 - ^3IN Range Condition ^2[FALSE]^7') end
                        if debug then print('^2[DEBUG]^7 - Set ^3AFKFARM State and RESET NextAction Timer ^2[FALSE]^7') end
                        te('tofdrugs:afkfarmstate')
                        te('tofdrugs:resetNextAction')

                    end
                    cw(0)
                end
            end
        end
        if act and act == actc3dgs then
            if debug then print('^2[DEBUG]^7 - ^3Sell Narcos Condiion ^2[Done]^7') end
            if GetGameTimer() > NextAction then
                ts('tofdrugs:nbcops', tkcdgs, act, item, label, timer)
                if debug then print('^2[DEBUG]^7 - send ServerEvent ^3check NB Cops ^2[Done]^7') end
                SetNextAction(timer)
            end
        end
    end
	if afkdgscfg == false then
        if debug then print('^2[DEBUG]^7 - started ^3AFK Farm condition ^2[TRUE]^7') end
        if act and (act == actc1dgs or act == actc2dgs or act == actc3dgs) then
            if GetGameTimer() > NextAction then
                ts('tofdrugs:nbcops', tkcdgs, act, item, label, timer)
                if debug then print('^2[DEBUG]^7 - send ServerEvent ^3check NB Cops ^2[Done]^7') end
                SetNextAction(timer)
            end
        end
    end
end

function verifsoldped(ped)
    local pedv = NetworkGetNetworkIdFromEntity(ped)
    if soldped ~= {} then
        for z,t in ipairs(soldped) do
            local oldPed = t 
            if oldPed == pedv then 
                pedtosell = false
            end
        end
    end
end

function GetPedInFront()
    local pedtoact = true
	local plyPed = PlayerPedId()
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 3.0, 12, plyPed, 7)
    local _, _, _, _, ped = GetShapeTestResult(rayHandle)
    local pedv = NetworkGetNetworkIdFromEntity(ped)
    if drugpeds ~= {} then
        for k,v in ipairs(drugpeds) do
            local peddgs = v
            if peddgs == pedv then 
                pedtoact = false
            end
        end
    end
    if pedtoact == true then
        return ped
    end
end

function sellnpcqtoff()
    if DoesEntityExist(ped) then
        pedtosell = true
        local playerInveh = IsPedInAnyVehicle(PlayerPedId(), false)
        local playerDead = IsPedDeadOrDying(PlayerPedId())
        local playerRagdoll = IsPedRagdoll(PlayerPedId())
        local cuffed = IsPedCuffed(PlayerPedId())
        local swim = IsPedSwimming(PlayerPedId())
        if playerInveh or playerDead or playerRagdoll or cuffed or swim then
            cw(4000)
        else
            local distnpc = distent(PlayerPedId(), ped)
            local pedType = GetPedType(ped)
            local pedDead = IsPedDeadOrDying(ped)
            local pedPlayer = IsPedAPlayer(ped)
            local pedInveh = IsPedInAnyVehicle(ped, true)
            if distnpc <= 2 and not pedDead and not pedPlayer and not pedInveh and pedType ~= 6 and pedType ~= 27 and pedType ~= 28 and pedType ~= 29 then   
                local coordPed = GetEntityCoords(ped)
                DrawText3D(coordPed.x, coordPed.y, coordPed.z, locale('interactsellaction'))
                if IsControlJustPressed(0, 74) then
                    verifsoldped(ped)
                    local sellcount = math.random(1, 12)
                    if pedtosell then
                        if debug then print('^2[DEBUG]^7 - send ServerEvent ^3check NB Cops NPC ^2[Done]^7') end
                        ts('tofdrugs:nbcopsnpc', tkcdgs, actc4dgs, sellcount, ped)
                    elseif not pedtosell then
                        te('tofdrugs:notifsdgs', 'refusenpc', 'inform', 0, '', 0)
                    end
                end 
            end
        end
    end
end