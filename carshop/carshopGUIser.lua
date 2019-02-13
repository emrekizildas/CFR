carShopMarker = createMarker (2132.04882, -1151.098266, 24.0874, "cylinder", 3, 255, 0, 0, 127)
--carShopMarker2 = createMarker (-1953.68, 304.57, 34.46875, "cylinder", 1, 255, 0, 0, 127)

addEvent ("viewGUI", true)
function markerHit (hitPlayer, matchingDimension)
  if (source == carShopMarker) then
   if  (isPedInVehicle (hitPlayer)) then
triggerClientEvent (source, "lolmodOpenInfOWindow", "Arabaniz ile giremezsiniz" )
else 
    triggerClientEvent ("viewGUI", hitPlayer)
    --outputChatBox ("Araba Galerisine Ho�geldiniz!", hitPlayer, 255, 0, 0)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba Galerisine Hosgeldiniz.")
  end
 end 
end
addEventHandler ("onMarkerHit", getRootElement(), markerHit)

addEvent ("carShopCarBuy", true)
addEventHandler ("carShopCarBuy", getRootElement(), 
function(id, cost, name)
  if (getPlayerMoney (source) >= tonumber(cost)) then
    --outputChatBox ("Hay�rl� Olsun! " .. name .. " sat�n ald�n.", source, 255, 0, 0, false)
    --outputChatBox ("ID: " .. id, source, 255, 0, 0, false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Hayirli Olsun! " .. name .. " satin aldin\nUcret:" .. cost)
    --outputChatBox ("�cret: " .. cost, source, 255, 0, 0, false)
    takePlayerMoney (source, tonumber (cost))
	if  not (isGuestAccount (getPlayerAccount (source))) then
    if (isPedInVehicle (source)) then
      if (getElementID(getPedOccupiedVehicle(source)) == getAccountName (getPlayerAccount(source))) then
        setElementHealth (getElementData (source, "hisCar"), 0)
        destroyElement (getPedOccupiedVehicle (source))
        removeElementData (source, "hisCar")
        --outputChatBox ("Car Destroyed.", source, 255, 0, 0)
      else
        --outputChatBox ("This not your car!", source, 255, 0, 0)
      end
    elseif (not (isPedInVehicle (source))) and (getElementData (source, "hisCar")) and (getElementData (source, "hisCar") ~= nil) then
      destroyElement (getElementData (source, "hisCar"))
      --outputChatBox ("Car Destroyed.", source, 255, 0, 0)
      removeElementData (source, "hisCar")
    end
  end
    setAccountData (getPlayerAccount (source), "arabasi", tonumber(id))
    setAccountData (getPlayerAccount (source), "paintjob", 3)
    setAccountData (getPlayerAccount (source), "modifiye", 0)
	 local carID = getAccountData (getPlayerAccount (source), "arabasi")
     local x,y,z = getElementPosition (source)
     local vehicle = createVehicle (carID, x +2, y, z +1)
 else
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Paraniz yeterli degil.")
  end
end)


-- �ok h�zl� vurunca motor drmas�

function uitMetDamage (loss)
  if loss >= 90 then
    setVehicleEngineState (source, false)
	outputChatBox ("(( Arac�n�z �ok hasar ald�.L�tfen tamirci �a��r�n�z. ))", source, 255, 122, 61)
  end
end
addEventHandler ("onVehicleDamage", getRootElement(), uitMetDamage)