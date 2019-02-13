--Car 4 all:D
function playerLoginGiveCar (thePreviousAccount, theCurrentAccount, autoLogin)
  if  not (isGuestAccount (theCurrentAccount)) then
    local accountData = getAccountData (theCurrentAccount, "arabasi")
    if not (accountData) then
      carID = setAccountData (theCurrentAccount, "arabasi", 481)
    end
  end
end
addEventHandler ("onPlayerLogin", getRootElement(), playerLoginGiveCar)

--autodestroyer als hij kapoet is
function destroyOnExplode ()
	setTimer (destroyElement, 2500, 1, source)
	setAccountData (theCurrentAccount, "arabasi", 481)
end
addEventHandler ("onVehicleExplode", getRootElement(), destroyOnExplode)


addEventHandler ("onResourceStart", getRootElement(), 
function()
  for i,v in ipairs (getElementsByType ("player")) do
    bindKey (v, "o", "down", engineSwitch, v)
    bindKey (v, "l", "down", lockSwitch, v)
  end
end)

addEventHandler ("onPlayerLogin", getRootElement(), 
function()
  bindKey (source, "o", "down", engineSwitch, source)
  bindKey (source, "l", "down", lockSwitch, source)
end)  

local chatRadius = 5
		
function engineSwitch (thePlayer)
  if (isPedInVehicle (thePlayer)) then
    if (getVehicleEngineState (getPedOccupiedVehicle (thePlayer)) == true) then
      setVehicleEngineState (getPedOccupiedVehicle (thePlayer), false)
	  	    local posX, posY, posZ = getElementPosition( thePlayer )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
		local isim = getPlayerNametagText (thePlayer)
        destroyElement( chatSphere )
         for index, nearbyPlayer in ipairs( nearbyPlayers ) do
             outputChatBox( "#9b9ba3(( #ffffff"..isim.." #9b9ba3aracýn anahtarýný çevirerek motoru durdurur. ))" , nearbyPlayer,0,0,0,true)
         end
      --outputChatBox ("(( "..getPlayerNametagText(thePlayer).." aracýn anahtarýný çevirerek motoru durdurur. ))", thePlayer, 255, 0, 0)
	 -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba istop etti.")
    elseif (getVehicleEngineState (getPedOccupiedVehicle (thePlayer)) == false) then
      setVehicleEngineState (getPedOccupiedVehicle (thePlayer), true)
	  	  	    local posX, posY, posZ = getElementPosition( thePlayer )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
		local isim = getPlayerNametagText (thePlayer)
        destroyElement( chatSphere )
	    for index, nearbyPlayer in ipairs( nearbyPlayers ) do
      outputChatBox ("#9b9ba3(( #ffffff"..getPlayerNametagText(thePlayer).." #9b9ba3anahtarý takarak aracý çalýþtýrýr. ))", nearbyPlayer,0,0,0,true)
         end
	  --triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba calistirildi")
    end
  else
    --outputChatBox ("You aren't in a vehicle!", thePlayer, 255, 0, 0)
  end
end

function lockSwitch (thePlayer)
  if (isPedInVehicle (thePlayer)) then
    if not (isVehicleLocked (getPedOccupiedVehicle (thePlayer))) then
      setVehicleLocked (getPedOccupiedVehicle (thePlayer), true)
      setVehicleDoorsUndamageable (getPedOccupiedVehicle(thePlayer), true)
      setVehicleDoorState (getPedOccupiedVehicle(thePlayer), 0, 0)
      setVehicleDoorState (getPedOccupiedVehicle(thePlayer), 1, 0)
      setVehicleDoorState (getPedOccupiedVehicle(thePlayer), 2, 0)
      setVehicleDoorState (getPedOccupiedVehicle(thePlayer), 3, 0) 
	  	local posX, posY, posZ = getElementPosition( thePlayer )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
	    for index, nearbyPlayer in ipairs( nearbyPlayers ) do
      outputChatBox ("#9b9ba3(( #ffffff"..getPlayerNametagText(thePlayer).." #9b9ba3aracýn kapýsýndaki düðmeye basarak kapýlarý kilitler. ))", nearbyPlayer,0,0,0,true)
         end
	  --triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba kilitlendi")
    elseif (isVehicleLocked (getPedOccupiedVehicle (thePlayer))) then
      setVehicleLocked (getPedOccupiedVehicle (thePlayer), false)
      setVehicleDoorsUndamageable (getPedOccupiedVehicle(thePlayer), false)
	  	local posX, posY, posZ = getElementPosition( thePlayer )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
	    for index, nearbyPlayer in ipairs( nearbyPlayers ) do
      outputChatBox ("#9b9ba3(( #ffffff"..getPlayerNametagText(thePlayer).." #9b9ba3aracýn kapýsýndaki düðmeyi çekerek kilidi açar. ))", nearbyPlayer,0,0,0,true)
         end
      --outputChatBox ("(( "..getPlayerNametagText(thePlayer).." aracýn kapýsýndaki düðmeye çekerek kilidi açar. ))", thePlayer, 255, 0, 0)
	  --triggerClientEvent ("lolmodOpenInfoWindow",source,"Aracinin kilidi acildi")
    end
  else
    --outputChatBox ("You aren't in a vehicle!", thePlayer, 255, 0, 0)
  end
end
 
-- locked check, if auto is van hem sta het toe!
addEventHandler ("onVehicleStartEnter", getRootElement(), 
function(player, seat, jacked, door)
  if (isVehicleLocked (source) == true) then
    local mannetjeNaam = getAccountName (getPlayerAccount (player))
    local autoNaam = getElementID (source)
    if (mannetjeNaam == autoNaam) then
      setVehicleLocked (source, false)
      --outputChatBox ("Vehicle unlocked!", player, 255, 0, 0, false)
	  triggerClientEvent ("lolmodOpenInfoWindow",source,"Aracini kilidi acildi")
    end
  end
end)