addEventHandler ("onResourceStart", getResourceRootElement(getThisResource()),
function ()
	giris = createMarker (1154.7305,-1440.1540,17, "arrow", 1.5, 255, 255, 0, getRootElement()) 
	islem = createMarker (-23.354976654053,-55.630935668945,1002, "cylinder", 1.5, 255, 255, 0, getRootElement())
    cikis = createMarker (-27.530195236206,-58.058551178833,1004.65, "arrow", 1.5, 255, 255, 0, getRootElement()) 	
    setElementInterior (islem, 6)
	setElementInterior (cikis, 6)
	blip = createBlip (1154.7305,-1440.1540,17, 41, 0, 0, 0, 255,0,0, 150, getRootElement())
	ped = createPed (12, -23.430368,-57.325855255,1003.546)
	setElementInterior (ped, 6)
end)

addEvent ("guiwina", true)
addEventHandler ("onMarkerHit", getRootElement(),
function  (hitPlayer, matchingDimension)
    if (source == cikis) then
      if (isPedInVehicle (hitPlayer)) then
	  triggerClientEvent ("lolmodOpenInfoWindow",hitPlayer,"Araba ile giremezsiniz.")
	  else
	  toggleControl (hitPlayer, "fire", true)
        setElementInterior (hitPlayer, 0, 1151.3524169922,-1440.4248046875,15.796875)
end
	  elseif (source == giris) then
	    if  (isPedInVehicle (hitPlayer)) then
	  triggerClientEvent ("lolmodOpenInfoWindow",hitPlayer,"Araba ile giremezsiniz.")
       else		
		toggleControl (hitPlayer, "fire", false)
		setElementInterior (hitPlayer, 6, -27.255502700806,-55.174411773682,1003.546)
end		
	  elseif (source == islem) then
	  if (isPedInVehicle (hitPlayer)) then
	  	  triggerClientEvent ("lolmodOpenInfoWindow",hitPlayer,"Araba ile giremezsiniz.")
else
		triggerClientEvent ("guiwina", hitPlayer)
end
		end
end)

function aracabin ()
 showPlayerHudComponent (source, "radar",true)
 end
 addEventHandler ("onPlayerVehicleEnter", getRootElement(), aracabin)
 
 function aracain ()
 showPlayerHudComponent (source, "radar",false)
 end
 addEventHandler ("onPlayerVehicleExit", getRootElement(), aracain)