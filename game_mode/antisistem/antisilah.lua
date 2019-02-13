function weaponSwitchDisableMinigun ( previousWeaponID, currentWeaponID )
     if currentWeaponID == 38 and 37 and 36 and 35 and 16 and 17 and 18 and 39 then
          toggleControl ( source, "fire", false )
     else --otherwise
          toggleControl ( source, "fire", true )
     end
end
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), weaponSwitchDisableMinigun )