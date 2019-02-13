addEventHandler ("onResourceStart", getResourceRootElement(getThisResource()),
function()
  local allGreenzones = getElementsByType ("radararea")
  for i,v in ipairs (allGreenzones) do
    local r,g,b,a = getRadarAreaColor (v)
    if (r == 0) and (g == 255) and (b == 0) and (a == 127) then
      local x,y = getElementPosition (v)
      local sx,sy = getRadarAreaSize (v)
      local col = createColCuboid (x,y, -50, sx,sy, 7500)
      setElementID (col, "greenzoneColshape")
    end
  end
end)

addEventHandler ("onColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
  if (getElementType (hitElement) == "player") and (getElementID (source) == "greenzoneColshape") then
    --outputChatBox ("You entered the greenzone", hitElement, 255, 0, 0, false)
    toggleControl (hitElement, "fire", false)
    toggleControl (hitElement, "next_weapon", false)
    toggleControl (hitElement, "previous_weapon", false)
    toggleControl (hitElement, "sprint", false)
    toggleControl (hitElement, "aim_weapon", false)
    toggleControl (hitElement, "vehicle_fire", false)
  -- elseif (getElementID (source) == "greenzoneColshape") and (getElementType (hitElement) == "vehicle") then
    -- blowVehicle (hitElement)
	-- outputChatBox ("Buraya aracýnýz ile giremezsiniz!", hitElement, 255, 0, 0, false)
  end
end)

addEventHandler ("onColShapeLeave", getRootElement(), 
function(leaveElement, matchingDimension)
  if (getElementType (leaveElement) == "player") and (getElementID (source) == "greenzoneColshape") then
    --outputChatBox ("You left the greenzone", leaveElement, 255, 0, 0, false)
    toggleControl (leaveElement, "fire", true)
    toggleControl (leaveElement, "next_weapon", true)
    toggleControl (leaveElement, "previous_weapon", true)
    toggleControl (leaveElement, "sprint", true)
    toggleControl (leaveElement, "aim_weapon", true)
    toggleControl (leaveElement, "vehicle_fire", true)
  end
end)