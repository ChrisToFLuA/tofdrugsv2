harvesthook = {}
crafthook = {}
sellwhook = {}
local n = 0
local o = 0
local p = 0

function harvestaction_s(source, item, label, timer)
    local xPlayer = ESX.GetPlayerFromId(source)
    cancarry = true
    for z = 1,#drugsharvest,1 do
        if item == drugsharvest[z].item then
            local qty = drugsharvest[z].qty
            tc('tofdrugs:animharvest', xPlayer.source, timer, item)
            tc('tofdrugs:timeranim', xPlayer.source, timer)
            cw(timer)
            addItems(source, item, qty)
            tc('tofdrugs:notifsdgs', xPlayer.source, 'harvestaction', 'success', qty, label, 0)
            cw(200)
            if not cancarry then tc('tofdrugs:afkfarmstate', xPlayer.source) end
            n = n+1
            local a = {source, item, qty}
            table.insert(harvesthook, n, a)
        end
    end
end

function craftaction_s(source, item, label, timer)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item1 = false
    local item2 = false
    local item3 = false
    local item4 = false
    local item5 = false
    local item6 = false
    local item1remove = true
    local item2remove = true
    local item3remove = true
    local item4remove = true
    local item5remove = true
    local item6remove = true
    cancarry = true
    for z = 1,#drugscraftrecipes,1 do
        if item == drugscraftrecipes[z].item then
            local lbl = drugscraftrecipes[z].label
            local qtyfinale = drugscraftrecipes[z].qtyfinal
            if drugscraftrecipes[z].item1 ~= '' and drugscraftrecipes[z].qty1 > 0 then
                local item1count = itemcount(xPlayer.source, drugscraftrecipes[z].item1)
                item1 = true
                if not item1count or item1count < drugscraftrecipes[z].qty1 then
                    item1remove = false
                end
            end
            if drugscraftrecipes[z].item2 ~= '' and drugscraftrecipes[z].qty2 > 0 then
                local item2count = itemcount(xPlayer.source, drugscraftrecipes[z].item2)
                item2 = true
                if not item2count or item2count < drugscraftrecipes[z].qty2 then
                    item2remove = false
                end
            end
            if drugscraftrecipes[z].item3 ~= '' and drugscraftrecipes[z].qty3 > 0 then
                local item3count = itemcount(xPlayer.source, drugscraftrecipes[z].item3)
                item3 = true
                if not item3count or item3count < drugscraftrecipes[z].qty3 then
                    item3remove = false
                end
            end
            if drugscraftrecipes[z].item3 ~= '' and drugscraftrecipes[z].qty4 > 0 then
                local item4count = itemcount(xPlayer.source, drugscraftrecipes[z].item4)
                item4 = true
                if not item4count or item4count < drugscraftrecipes[z].qty4 then
                    item4remove = false
                end
            end
            if drugscraftrecipes[z].item5 ~= '' and drugscraftrecipes[z].qty5 > 0 then
                local item5count = itemcount(xPlayer.source, drugscraftrecipes[z].item5)
                item5 = true
                if not item5count or item5count < drugscraftrecipes[z].qty5 then
                    item5remove = false
                end
            end
            if drugscraftrecipes[z].item6 ~= '' and drugscraftrecipes[z].qty6 > 0 then
                local item6count = itemcount(xPlayer.source, drugscraftrecipes[z].item6)
                item6 = true
                if not item6count or item6count < drugscraftrecipes[z].qty6 then
                    item6remove = false
                end
            end
            if item1remove and item2remove and item3remove and item4remove and item5remove and item6remove then
                tc('tofdrugs:animharvest', xPlayer.source, timer)
                tc('tofdrugs:timeranim', xPlayer.source, timer)
                cw(timer)
                if item1 then removeitem(xPlayer.source, drugscraftrecipes[z].item1, drugscraftrecipes[z].qty1) end
                if item2 then removeitem(xPlayer.source, drugscraftrecipes[z].item2, drugscraftrecipes[z].qty2) end
                if item3 then removeitem(xPlayer.source, drugscraftrecipes[z].item3, drugscraftrecipes[z].qty3) end
                if item4 then removeitem(xPlayer.source, drugscraftrecipes[z].item4, drugscraftrecipes[z].qty4) end
                if item5 then removeitem(xPlayer.source, drugscraftrecipes[z].item5, drugscraftrecipes[z].qty5) end
                if item6 then removeitem(xPlayer.source, drugscraftrecipes[z].item6, drugscraftrecipes[z].qty6) end
                addItems(xPlayer.source, item, qtyfinale)
                print('label : '..label)
                tc('tofdrugs:notifsdgs', xPlayer.source, 'craftaction', 'success', qtyfinale, label, 0)
                o = o+1
                local a = {source, item, qtyfinale}
                table.insert(crafthook, o, a)
                cw(200)
                if not cancarry then
                     tc('tofdrugs:afkfarmstate', xPlayer.source)
                     tc('tofdrugs:notifsdgs', xPlayer.source, 'nospace', 'error', 0, '', 0)
                end
            else
                tc('tofdrugs:afkfarmstate', xPlayer.source)
                tc('tofdrugs:notifsdgs', xPlayer.source, 'noitem', 'error', 0, '', 0)
                tc('tofdrugs:resetNextAction', xPlayer.source)
            end
        end
    end
end

function sellaction_s(source, item, label, timer)
    print('sellaction '..timer)
    local xPlayer = ESX.GetPlayerFromId(source)
    local alertlspd = math.random(1,100)
    for z = 1,#drugssellnarcos,1 do
        if item == drugssellnarcos[z].item then
            local itemcount = itemcount(xPlayer.source, item)
            local price = math.random(drugssellnarcos[z].pricemin, drugssellnarcos[z].pricemax)
            if itemcount and itemcount >= drugssellnarcos[z].qtysell then
                local pay = (drugssellnarcos[z].qtysell * price)
                tc('tofdrugs:animsell', xPlayer.source, timer)
                tc('tofdrugs:timeranim', xPlayer.source, timer)
                if alertlspd <= Options.alertlspdw then
                    tc('tofdrugs:alertlspd_c', xPlayer.source)
                end
                cw(timer)
                removeitem(xPlayer.source, item, drugssellnarcos[z].qtysell)
                tc('tofdrugs:notifsdgs', xPlayer.source, 'sellaction', 'inform', drugssellnarcos[z].qtysell, drugssellnarcos[z].label, pay)
                xPlayer.addAccountMoney('black_money', pay)
                p = p+1
                local a = {source, item, drugssellnarcos[z].qtysell, pay}
                table.insert(sellwhook, p, a)
            elseif itemcount and itemcount > 0 then
                local pay = (itemcount * price)
                tc('tofdrugs:animsell', xPlayer.source, timer)
                tc('tofdrugs:timeranim', xPlayer.source, timer)
                if alertlspd <= Options.alertlspdw then
                    tc('tofdrugs:alertlspd_c', xPlayer.source)
                end
                cw(timer)
                removeitem(xPlayer.source, item, itemcount)
                p = p+1
                local a = {source, item, itemcount, pay}
                table.insert(sellwhook, p, a)
                tc('tofdrugs:notifsdgs', xPlayer.source, 'sellaction', 'inform', itemcount, drugssellnarcos[z].label, pay)
                xPlayer.addAccountMoney('black_money', pay)
            else
                tc('tofdrugs:notifsdgs', xPlayer.source, 'noitem', 'error', 0, '', 0)
                tc('tofdrugs:resetNextAction', xPlayer.source)
            end
        end
    end
end