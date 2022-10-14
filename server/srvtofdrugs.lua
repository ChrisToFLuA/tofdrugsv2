local q = 0
sellnpchook = {}

rs('tofdrugs:nbcops', function(tkcdgs, act, item, label, timer)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3check NB Cops ^2[START]^7') end
    local xPlayer = ESX.GetPlayerFromId(source)
    local check = nego(tkdgs, tkcdgs)
    local job = 'police'
    local nbcops = nbjob(job)
    local harvestaction = false
    local craftaction = false
    local sellaction = false
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    if check == true then
        print('^2[TK]^7 KeYChecK - Event ** Drugs NB Cops ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        if not act or act ~= act1dgs and act ~= act2dgs and act ~= act3dgs then
            print('^3[ACT]^7 AcTChecK - Event ** Drugs NB Cops ** ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
            te('tofdrugs:webhookcheat', xPlayer.source)
            cw(1000)
            te('tofdrugs:kickplayer', xPlayer.source)
        else
            print('^2[TK]^7 AcTChecK - Event ** Drugs NB Cops ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        end
        if nbcops >= Options.mincopsh then harvestaction = true end
        if nbcops >= Options.mincopsc then craftaction = true end
        if nbcops >= Options.mincopss then sellaction = true end    
        if act == act1dgs and harvestaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3OK to Harvest ^2[DONE]^7') end
            te('tofdrugs:dispatchcops', xPlayer.source, act, item, label, timer)
        elseif act == act1dgs and not harvestaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3KO to Harvest ^2[DONE]^7') end
            tc('tofdrugs:notifsdgs', xPlayer.source, 'nbcops', 'inform', 0, '', 0)
            tc('tofdrugs:resetNextAction', xPlayer.source)
        end
        if act == act2dgs and craftaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3OK to Craft ^2[DONE]^7') end
            te('tofdrugs:dispatchcops', xPlayer.source, act, item, label, timer)
        elseif act == act2dgs and not craftaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3KO to Craft ^2[DONE]^7') end
            tc('tofdrugs:notifsdgs', xPlayer.source, 'nbcops', 'inform', 0, '', 0)
            tc('tofdrugs:resetNextAction', xPlayer.source)
        end
        if act == act3dgs and sellaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3OK to Sell Narcos ^2[DONE]^7') end
            te('tofdrugs:dispatchcops', xPlayer.source, act, item, label, timer)
        elseif act == act3dgs and not sellaction then
            if Options.Debug then print('^2[DEBUG]^7 - NB Cops - ^3KO to Sell Narcos ^2[DONE]^7') end
            tc('tofdrugs:notifsdgs', xPlayer.source, 'nbcops', 'inform', 0, '', 0)
            tc('tofdrugs:resetNextAction', xPlayer.source)
        end
    else
        print('^3[TK]^7 KeYChecK - Event ** Drugs NB Cops ** ^3[**KO**]^7 ID: ^3'..xPlayer.source..'^7 - ^3'..nameP..'^7 - License: ^3'..license)
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    end
end)

rs('tofdrugs:dispatchcops', function(source, act, item, label, timer)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3dispatch actions ^2[START]^7') end
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    if not act or act ~= act1dgs and act ~= act2dgs and act ~= act3dgs then
        print('^3[ACT]^7 AcTChecK - Event ** Drugs Dispatch ** ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    else
        print('^2[TK]^7 AcTChecK - Event ** Drugs Dispatch ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
    end

    if act == act1dgs then
        if Options.Debug then print('^2[DEBUG]^7 - Call function - ^3Harvest ^2[DONE]^7') end
        harvestaction_s(source, item, label, timer)
    end
    if act == act2dgs then
        if Options.Debug then print('^2[DEBUG]^7 - Call function - ^3craft ^2[DONE]^7') end
        craftaction_s(source, item, label, timer)
    end
    if act == act3dgs then
        if Options.Debug then print('^2[DEBUG]^7 - Call function - ^3Sell Narcos ^2[DONE]^7') end
        sellaction_s(source, item, label, timer)
    end
end)

rs('tofdrugs:nbcopsnpc', function(tkcdgs, act, sellcount, closestPed)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Nb Cops Sell NPC ^2[START]^7') end
    local xPlayer = ESX.GetPlayerFromId(source)
    local check = nego(tkcdgs, tkdgs)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local jobname = 'police'
    local nbcops = nbjob(jobname)
    if check == true then
        print('^2[TK]^7 KeYChecK - Event ** Drugs NB Cops NPC ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        if not act or act ~= act4dgs then
            print('^3[ACT]^7 AcTChecK - Event ** Drugs NB Cops NPC ** ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
            te('tofdrugs:webhookcheat', xPlayer.source)
            cw(1000)
            te('tofdrugs:kickplayer', xPlayer.source)
        else
            print('^2[TK]^7 AcTChecK - Event ** Drugs NB Cops NPC ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        end
        if act == act4dgs then
            if nbcops >= Options.mincopsnpc then
                local refuse = math.random(1, 100)
                if refuse > Options.nonpc then
                    te('tofdrugs:sellnpcchoice', xPlayer.source, sellcount, closestPed)
                else
                    tc('tofdrugs:notifsdgs', xPlayer.source, 'refusenpc', 'inform', 0, '', 0)
                end
            else
                tc('tofdrugs:notifsdgs', xPlayer.source, 'nbcops', 'inform', 0, '', 0)
                tc('tofdrugs:resetNextAction', xPlayer.source)
            end
        end
    else
        print('^3[TK]^7 KeYChecK - Event ** Drugs NB Cops NPC ** ^3[**KO**]^7 ID: ^3'..xPlayer.source..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    end
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Nb Cops Sell NPC ^2[DONE]^7') end
end)

rs('tofdrugs:sellnpcchoice', function(source, count, entity)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Drug Choice ^2[START]^7') end
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local drugssellable = {}
        local itemdrugs = ''
        for z = 1,#drugssellNPC,1 do
            local item = drugssellNPC[z].item
            local qtyinv = itemcount(xPlayer.source, item)
            if qtyinv and qtyinv >= count then
                table.insert(drugssellable, item)
            end
        end
        local nbdrugs = #drugssellable
        if nbdrugs and nbdrugs > 0 then
            local choice = math.random(1, nbdrugs)
            for k, v in pairs(drugssellable) do
                if k == choice then
                    itemdrugs = v
                end
            end
            local act = act4dgs
            if itemdrugs and itemdrugs ~= '' then
                for y = 1,#drugssellNPC,1 do
                    if drugssellNPC[y].item == itemdrugs then
                        local item = drugssellNPC[y].item
                        local lblitem = drugssellNPC[y].label
                        local pricemin = drugssellNPC[y].pricemin
                        local pricemax = drugssellNPC[y].pricemax
                        local timer = drugssellNPC[y].timer
                        local pricefinal = math.random(pricemin, pricemax)
                        local pay = (pricefinal * count)
                        tc('tofdrugs:actionsellnpcqtoff_c', xPlayer.source, item, lblitem, count, timer, pay, entity)
                    end
                end 
            else
                tc('tofdrugs:notifsdgs', xPlayer.source, 'nbdrugs', 'inform', 0, '', 0)
            end
        else
            tc('tofdrugs:notifsdgs', xPlayer.source, 'nbdrugs', 'inform', 0, '', 0)
        end
    end
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Drug Choice ^2[DONE]^7') end
end)

rs('tofdrugs:actionsellnpcqtoff_s', function(tkcdgs, act, item, lblitem, count, timer, pay, entity)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Action Sell NPC ^2[START]^7') end
    local xPlayer = ESX.GetPlayerFromId(source)
    local check = nego(tkcdgs, tkdgs)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local alertlspd = math.random(1,100)
    if check == true then
        print('^2[TK]^7 KeYChecK - Event ** Drugs Action Sell NPC ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        if not act or act ~= act4dgs then
            print('^3[ACT]^7 AcTChecK - Event ** Drugs Action Sell NPC ** ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
            te('tofdrugs:webhookcheat', xPlayer.source)
            cw(1000)
            te('tofdrugs:kickplayer', xPlayer.source)
        else
            print('^2[TK]^7 AcTChecK - Event ** Drugs Action Sell NPC ** ^2[OK]^7 ID: ^2'..id..'^7 - ^2'..nameP..'^7')
        end
        if act == act4dgs then
            if xPlayer then
                tc('tofdrugs:animsellnpc', xPlayer.source, timer, entity)
                tc('tofdrugs:timeranim', xPlayer.source, timer)
                if alertlspd <= Options.alertlspdnpc then
                    tc('tofdrugs:alertlspd_c', xPlayer.source)
                end
            end
            cw(timer)
            removeitem(xPlayer.source, item, count)
            tc('tofdrugs:notifsdgs', xPlayer.source, 'sell', 'success', count, lblitem, pay)
            xPlayer.addAccountMoney('black_money', pay)
            q = q+1
            local a = {xPlayer.source, item, pay}
            table.insert(sellnpchook, q, a)
        end
    else
        print('^3[TK]^7 KeYChecK - Event ** Drugs Action Sell NPC ** ^3[**KO**]^7 ID: ^3'..id..'^7 - ^3'..nameP..'^7 - License: ^3'..license..'^7')
        te('tofdrugs:webhookcheat', xPlayer.source)
        cw(1000)
        te('tofdrugs:kickplayer', xPlayer.source)
    end
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Action Sell NPC ^2[DONE]^7') end
end)

rs('tofdrugs:alertlspd_s', function(coord)
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Alert LSPD ^2[START]^7') end     
    local jobsource = nbjobact('police')
    if jobsource ~= {} then
        for k, v in pairs(jobsource) do
            tc('tofdrugs:blip', v, coord, source)
            if Options.Debug then print('^2[DEBUG]^7 - Send Blip - ^3Alert LSPD ^2[DONE]^7') end
            tc('tofdrugs:notifsdgs', v, 'alertlspd', 'error', 0, '', 0)
            if Options.Debug then print('^2[DEBUG]^7 - Send Notification - ^3Alert LSPD ^2[DONE]^7') end
        end
    end
    if Options.Debug then print('^2[DEBUG]^7 - Server Event - ^3Alert LSPD ^2[DONE]^7') end     
end)

rs('tofdrugs:kickplayer', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    DropPlayer(xPlayer.source, 'trigger search')
end)

rs('tofdrugs:webhookcheat', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    if ip and fivem and discord and license and nameP and id then
        local content = {
            {
                ["color"] = '5015295',
                ["title"] = "**Kick Payer - Trigger Research**",
                ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Discord** : '..discord..'\n**Fivem** : '..fivem..'\n**ip** : '..ip..'',
            }
        }
        PerformHttpRequest(Options.webhookcheat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
    elseif fivem and discord and license and nameP and id then
        local content = {
            {
                ["color"] = '5015295',
                ["title"] = "**Kick Payer - Trigger Research**",
                ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Discord** : '..discord..'\n**Fivem** : '..fivem..'',
            }
        }
        PerformHttpRequest(Options.webhookcheat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
    elseif discord and license and nameP and id then
        local content = {
            {
                ["color"] = '5015295',
                ["title"] = "**Kick Payer - Trigger Research**",
                ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Discord** : '..discord..'',
            }
        }
        PerformHttpRequest(Options.webhookcheat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
    elseif license and nameP and id then
        local content = {
            {
                ["color"] = '5015295',
                ["title"] = "**Kick Payer - Trigger Research**",
                ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'',
            }
        }
        PerformHttpRequest(Options.webhookcheat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
    end
end)

rs('tofdrugs:webhookharvest', function(source, lbl, qty)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**Harvest Items**",
            ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Item** : '..lbl..'\n**Qty** : '..qty..'',
        }
    }
    PerformHttpRequest(Options.webhookstat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
end)

rs('tofdrugs:webhookcraft', function(source, lbl, qty)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**Craft Items**",
            ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Item** : '..lbl..'\n**Qty** : '..qty..'',
        }
    }
    PerformHttpRequest(Options.webhookstat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
end)

rs('tofdrugs:webhooksellw', function(source, lbl, qty, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**Sell Narcos**",
            ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Item** : '..lbl..'\n**Qty** : '..qty..'\n**Amount** : '..price..'',
        }
    }
    PerformHttpRequest(Options.webhookstat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
end)

rs('tofdrugs:webhooksellnpc', function(source, lbl, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id, nameP, license, discord, fivem, ip = infoP(xPlayer.source)
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**Sell NPC**",
            ["description"] = "**ID**: "..id..'\n **Name** : '..nameP..'\n**License** : '..license..'\n**Item** : '..lbl..'\n**Amount** : '..price..'',
        }
    }
    PerformHttpRequest(Options.webhookstat, function(err, text, headers) end, 'POST', json.encode({username = 'tofdrugsv2', embeds = content}), { ['Content-Type'] = 'application/json' })
end)