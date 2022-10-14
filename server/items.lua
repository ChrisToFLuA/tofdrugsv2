
rs('tofdrugs:verifitemsbdd', function()
    verifitem = false
    MySQL.Async.fetchAll('SELECT * FROM items', function(result)
        if result and result ~= {} then
            additem = 0
            for f = 1,#itemstocreate, 1 do
                create = true
                name = itemstocreate[f].name
                label = itemstocreate[f].label
                weight = tonumber(itemstocreate[f].weight)
                for k,v in pairs(result) do
                    if name == v.name and label == v.label and weight == v.weight then create = false end
                    if name == v.name and (label ~= v.label or weight ~= v.weight) then
                        create = false
                        updateitem(name, label, weight) 
                    end                  
                end
                if create then createitem(name, label, weight) else print('^2[INFO]^5 '..name..'^7 exist in DB ^2[OK]^7') end 
            end
        else
            print(' ^3[ITEM BDD]^7 items table is empty or does not exist ^3[KO]^7 ' )
        end
    end)
    verifitem = true
end)

function createitem(name, label, weight)
    additem = 1
    MySQL.Async.insert('INSERT INTO items (name, label, weight) VALUES (@name, @label, @weight)',
        {['name'] = name, ['label'] = label, ['weight'] = weight},
        print(' ^1[ADD ITEM BDD]^5 ' ..name..'^7 add to items table ^2[OK]^7 ')
    )
    print ('^3[ REBOOT ]^7 Reboot the server now to use new items ! ^3[REBOOT]^7')
end

function updateitem(name, label, weight)
    additem = 1
    MySQL.Async.execute('UPDATE items SET label=@label, weight=@weight WHERE name=@name',
        {['name'] = name, ['label'] = label, ['weight'] = weight},
        print(' ^1[UPDATE ITEM BDD]^5 ' ..name.. '^7 update in DB ^2[OK]^7 ' )
    )
    print ('^3[ REBOOT ]^7 Reboot the server now to use new items ! ^3[REBOOT]^7')
end