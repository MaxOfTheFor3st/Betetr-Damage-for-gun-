ESX = exports["es_extended"]:getSharedObject()

local disableHeadShotDamage = false

local WeaponsDamage = {
    [`WEAPON_PISTOL`] = {model = `WEAPON_PISTOL`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_PISTOL_MK2`] = {model = `WEAPON_PISTOL_MK2`, modifier = 0.50, disableCriticalHits = false},
    [`WEAPON_COMBATPISTOL`] = {model = `WEAPON_COMBATPISTOL`, modifier = 0.45, disableCriticalHits = false},
    [`WEAPON_PISTOL50`] = {model = `WEAPON_PISTOL50`, modifier = 0.7, disableCriticalHits = false},
    [`WEAPON_HEAVYPISTOL`] = {model = `WEAPON_HEAVYPISTOL`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_REVOLVER`] = {model = `WEAPON_REVOLVER`, modifier = 0.3, disableCriticalHits = false},
    [`WEAPON_REVOLVER_MK2`] = {model = `WEAPON_REVOLVER_MK2`, modifier = 0.5, disableCriticalHits = false},
    [`WEAPON_DOUBLEACTION`] = {model = `WEAPON_DOUBLEACTION`, modifier = 0.42, disableCriticalHits = false},
    [`WEAPON_MARKSMANPISTOL`] = {model = `WEAPON_MARKSMANPISTOL`, modifier = 0.09, disableCriticalHits = false},
    [`WEAPON_APPISTOL`] = {model = `WEAPON_APPISTOL`, modifier = 0.25, disableCriticalHits = false},
    [`WEAPON_MACHINEPISTOL`] = {model = `WEAPON_MACHINEPISTOL`, modifier = 0.39, disableCriticalHits = false},
    [`WEAPON_MICROSMG`] = {model = `WEAPON_MICROSMG`, modifier = 0.35, disableCriticalHits = false},
    [`WEAPON_MINISMG`] = {model = `WEAPON_MINISMG`, modifier = 0.28, disableCriticalHits = false},
    [`WEAPON_SMG`] = {model = `WEAPON_SMG`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_SMG_MK2`] = {model = `WEAPON_SMG_MK2`, modifier = 0.60, disableCriticalHits = false},
    [`WEAPON_COMPACTRIFLE`] = {model = `WEAPON_COMPACTRIFLE`, modifier = 0.45, disableCriticalHits = false},
    [`WEAPON_ASSAULTSMG`] = {model = `WEAPON_ASSAULTSMG`, modifier = 0.70, disableCriticalHits = false},
    [`WEAPON_COMBATPDW`] = {model = `WEAPON_COMBATPDW`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_ADVANCEDRIFLE`] = {model = `WEAPON_ADVANCEDRIFLE`, modifier = 0.65, disableCriticalHits = false},
    [`WEAPON_CARBINERIFLE`] = {model = `WEAPON_CARBINERIFLE`, modifier = 0.47, disableCriticalHits = false},
    [`WEAPON_CARBINERIFLE_MK2`] = {model = `WEAPON_CARBINERIFLE_MK2`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_ASSAULTRIFLE`] = {model = `WEAPON_ASSAULTRIFLE`, modifier = 0.5, disableCriticalHits = false},
    [`WEAPON_ASSAULTRIFLE_MK2`] = {model = `WEAPON_ASSAULTRIFLE_MK2`, modifier = 0.50, disableCriticalHits = false},
    [`WEAPON_BULLPUPRIFLE`] = {model = `WEAPON_BULLPUPRIFLE`, modifier = 0.6, disableCriticalHits = false},
    [`WEAPON_BULLPUPRIFLE_MK2`] = {model = `WEAPON_BULLPUPRIFLE_MK2`, modifier = 0.65, disableCriticalHits = false},
    [`WEAPON_SPECIALCARBINE`] = {model = `WEAPON_SPECIALCARBINE`, modifier = 0.65, disableCriticalHits = false},
    [`WEAPON_SPECIALCARBINE_MK2`] = {model = `WEAPON_SPECIALCARBINE_MK2`, modifier = 0.65, disableCriticalHits = false},
    [`WEAPON_MG`] = {model = `WEAPON_MG`, modifier = 0.75, disableCriticalHits = false},
    [`WEAPON_COMBATMG`] = {model = `WEAPON_COMBATMG`, modifier = 0.65, disableCriticalHits = false},
    [`WEAPON_COMBATMG_MK2`] = {model = `WEAPON_COMBATMG_MK2`, modifier = 0.70, disableCriticalHits = false},
    [`WEAPON_BULLPUPSHOTGUN`] = {model = `WEAPON_BULLPUPSHOTGUN`, modifier = 0.35, disableCriticalHits = false},
    [`WEAPON_PUMPSHOTGUN`] = {model = `WEAPON_PUMPSHOTGUN`, modifier = 0.3, disableCriticalHits = false},
    [`WEAPON_PUMPSHOTGUN_MK2`] = {model = `WEAPON_PUMPSHOTGUN_MK2`, modifier = 0.55, disableCriticalHits = false},
    [`WEAPON_SAWNOFFSHOTGUN`] = {model = `WEAPON_SAWNOFFSHOTGUN`, modifier = 0.4, disableCriticalHits = false},
    [`WEAPON_HEAVYSHOTGUN`] = {model = `WEAPON_HEAVYSHOTGUN`, modifier = 0.35, disableCriticalHits = false},
    [`WEAPON_ASSAULTSHOTGUN`] = {model = `WEAPON_ASSAULTSHOTGUN`, modifier = 0.35, disableCriticalHits = false},
    [`WEAPON_COMBATSHOTGUN`] = {model = `WEAPON_COMBATSHOTGUN`, modifier = 0.35, disableCriticalHits = false},
    [`WEAPON_MUSKET`] = {model = `WEAPON_MUSKET`, modifier = 0.1, disableCriticalHits = false},
}

CreateThread(function()
  while true do
      Wait(100)
      local playerPed = PlayerPedId()
      local weaponsConfig = WeaponsDamage[GetSelectedPedWeapon(playerPed)]
      SetPedSuffersCriticalHits(playerPed, false)
      if weaponsConfig then
            
            N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.modifier)
      else
          Wait(200)
      end
  end
end)

StatSetInt('MP0_SHOOTING_ABILITY', 100, true)