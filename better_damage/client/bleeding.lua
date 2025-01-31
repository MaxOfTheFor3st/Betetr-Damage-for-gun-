
local isBleeding = false

CreateThread(function()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)

end)



function func_522(x, y, z)
    local fVar1;
    local fVar0 = math.sqrt(x * x + y * y + z * z)
    local vParam0
  
    if (fVar0 ~= 0.0) then
      fVar1 = (1.0 / fVar0);
      vParam0 = vector3(x, y, z) * vector3(fVar1, fVar1, fVar1)
    end
  
    return vParam0 or vector3(0.0, 0.0, 0.0);
  end








function stopbleed(ped)
    isBleeding = false
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end



local bleedingTimes = 0
function lightbleeding(ped)
    isBleeding = true
    Citizen.CreateThread(function()
        while isBleeding do
            
            doRagdoll()
            SetEntityHealth(ped, GetEntityHealth(ped) - 5)
            StartScreenEffect('FadeOut', 0, true)
            StartScreenEffect('SuccessTrevor', 0, true)
            StartScreenEffect('HeistLocate', 100, false)
            StartScreenEffect('RampageOut', 300, false)
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
            local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.2, -1.0)
            AddDecal(1030, coords.x, coords.y, coords.z, -- pos
                    0.0, 0.0, -1.0, -- unk
                    func_522(0.0, 1.0, 0.0), --unk
                    1.0, 1.0, --width, height
                    0.196, 0.0, 0.0, -- rgb
                    1.0, -1.0, -- opacity,timeout
                    0, 0, 0 -- unk
            )
           Wait(10000) 
        end
    end)
end

function doRagdoll()
    bleedingTimes = bleedingTimes + 1
    if bleedingTimes % 2 == 0 then
      if (GetDisarmOffsetsForPed(GetPlayerPed(-1))) then
        SetPedToRagdoll(GetPlayerPed(-1), 9000, 2000, 3, 0, 0, 0)
      end
    end
  end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(700)
        local player = PlayerPedId()
        local Armour = GetPedArmour(player)

        if HasPedBeenDamagedByWeapon(player, 0, 2) and not HasPedBeenDamagedByWeapon(player, 0, 1) then
            if Armour == 0 and not HasPedBeenDamagedByWeapon(player, GetHashKey("WEAPON_STUNGUN")) then
                if not isBleeding then
                    lightbleeding(player)
                end
                ClearEntityLastDamageEntity(player)
            else
                ClearEntityLastDamageEntity(player)
                stopbleed(player)
            end
        end
    end
end)
function GetDisarmOffsetsForPed (ped)
    local v
  
    if IsPedSprinting(ped) then
      v = true
    elseif IsPedRunning(ped) then
      v = true
    else
      v = false
    end
  
    return v
  end




RegisterNetEvent("stopbleednoanim", function()
    print("bleedingstopped")
    bleedingTimes = 0
    isBleeding = false
    StopScreenEffect('SwitchShortTrevorIn')
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    
    ClearEntityLastDamageEntity(PlayerPedId())
end)

RegisterCommand("bleedingtest", function()
    local ped = PlayerPedId()
    lightbleeding(ped)
end)

RegisterNetEvent("stopbleedanim", function()
    if not isBleeding then
        lib.notify({
            title = 'Medikace',
            description = 'Musíš krvácet proto aby si použil bandáž.',
            type = 'error'
        })
        return
    end
    bleedingTimes = 0
    ClearEntityLastDamageEntity(PlayerPedId())
    TriggerServerEvent("removebandage")
    isBleeding = false
    if lib.progressBar({
        duration = 10000,
        label = 'Obvazuješ se',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            combat = true,
        },
        anim = { dict = 'anim@heists@prison_heistunfinished_biztarget_idle', clip = 'target_idle'},
        prop = { model = 'prop_ld_health_pack', bone = 60309, pos = vec3(0.025, 0.01, 0.045), rot = vec3(-38.0, 0.0, 0.0) },

}) then
lib.notify({
    title = 'Již nekrvácíš',
    description = '',
    type = 'success'
})
StopScreenEffect('SwitchShortTrevorIn')
SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
local player = PlayerPedId()
stopbleed(player)
else
    lib.notify({
        title = 'Stala se chyba',
        description = '',
        type = 'error'
    })
end
end)