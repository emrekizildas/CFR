carShopMarker = createMarker (2132.04882, -1151.098266, 24.0874, "cylinder", 3, 255, 0, 0, 127)
--carShopMarker2 = createMarker (-1953.68, 304.57, 34.46875, "cylinder", 1, 255, 0, 0, 127)

addEvent ("viewGUI", true)
function markerHit (hitPlayer, matchingDimension)
  if (source == carShopMarker) then
   if  (isPedInVehicle (hitPlayer)) then
triggerClientEvent (source, "lolmodOpenInfOWindow", "Arabaniz ile giremezsiniz" )
else 
    triggerClientEvent ("viewGUI", hitPlayer)
    --outputChatBox ("Araba Galerisine Hoþgeldiniz!", hitPlayer, 255, 0, 0)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba Galerisine Hosgeldiniz.")
  end
 end 
end
addEventHandler ("onMarkerHit", getRootElement(), markerHit)

addEvent ("carShopCarBuy", true)
addEventHandler ("carShopCarBuy", getRootElement(), 
function(id, cost, name)
  if (getPlayerMoney (source) >= tonumber(cost)) then
    --outputChatBox ("Hayýrlý Olsun! " .. name .. " satýn aldýn.", source, 255, 0, 0, false)
    --outputChatBox ("ID: " .. id, source, 255, 0, 0, false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Hayirli Olsun! " .. name .. " satin aldin\nUcret:" .. cost)
    --outputChatBox ("Ücret: " .. cost, source, 255, 0, 0, false)
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


-- Çok hýzlý vurunca motor drmasý

function uitMetDamage (loss)
  if loss >= 90 then
    setVehicleEngineState (source, false)
	outputChatBox ("(( Aracýnýz çok hasar aldý.Lütfen tamirci çaðýrýnýz. ))", source, 255, 122, 61)
  end
end
addEventHandler ("onVehicleDamage", getRootElement(), uitMetDamage)