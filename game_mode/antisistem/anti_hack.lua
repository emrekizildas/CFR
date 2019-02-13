-- Anti Hack
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), 
function ( prevID, curID )
  if (curID == 35) then
    kickHaxingNoob (source, curID)
  elseif (curID == 36) then
    kickHaxingNoob (source, curID)
  elseif (curID == 37) then
    kickHaxingNoob (source, curID)
  elseif (curID == 38) then
    kickHaxingNoob (source, curID)
  end
end)