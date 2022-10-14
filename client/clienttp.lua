
rc('tofdrugs:pointsoftp', function(ent1, ent2, exit1, exit2)
    while true do
        local dist1 = distcoord(PlayerPedId(), ent1)
        local dist2 = distcoord(PlayerPedId(), exit1)      
        if dist1 < 1.5 then
            SetEntityCoords(PlayerPedId(), ent2.x, ent2.y, ent2.z, true)
        end
        if dist2 < 1.5 then
            SetEntityCoords(PlayerPedId(), exit2.x, exit2.y, exit2.z, true)
        end
        if dist1 > 10 or dist2 > 10 then
            Citizen.Wait(2000)
        end
        cw(500)
    end
end)

rc('tofdrugs:tppoints', function()
    for k,v in ipairs(pointstp)do
        te('tofdrugs:pointsoftp', v.entdepart, v.entarriv, v.exitdepart, v.exitarriv)
    end
end)
