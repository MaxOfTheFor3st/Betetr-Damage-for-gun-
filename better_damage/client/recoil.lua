local isShaking = false
local shooting = 0

Citizen.CreateThread(function()
	while true do
		Wait(100)
		local ped = PlayerPedId()
		if(IsPedDoingDriveby(ped) and GetSelectedPedWeapon(ped) ~= -1569615261) and GetGameTimer() > shooting then
			local veh = GetVehiclePedIsIn(ped)
			if(GetEntitySpeed(veh) > 30) then
				ShakeGameplayCam('SKY_DIVING_SHAKE', GetEntitySpeed(veh)/5)
			else
				ShakeGameplayCam('SKY_DIVING_SHAKE', GetEntitySpeed(veh)/10)
			end
			isShaking = true
		elseif(isShaking) and GetGameTimer() > shooting then
			local veh = GetVehiclePedIsIn(ped)
			StopGameplayCamShaking(true)
			isShaking = false
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()

		if IsPedShooting(ped) and (IsPedDoingDriveby(ped) and GetSelectedPedWeapon(ped) ~= -1569615261) then
			local veh = GetVehiclePedIsIn(ped)
			shooting = GetGameTimer() + 500
			ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', GetEntitySpeed(veh)/800)
		end

	end
end)
