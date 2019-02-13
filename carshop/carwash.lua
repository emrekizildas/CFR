local temizleme = createMarker (2453.257,-1461.0783,23,"cylinder",7,255,255,0,0)

function markers (hitPlayer, matchingDimension)
 if (getElementType (hitPlayer) == "player") then
 if (source == temizleme) then
 local theVehicle = getPedOccupiedVehicle ( hitPlayer )
 if (isPedInVehicle (hitPlayer)) then
 setTimer (fadeCamera, 500,1, hitPlayer,false)
 setTimer (setElementPosition, 1500,1, theVehicle, 2468.45751,-1460.0671,24.0924)
 setTimer (fixVehicle, 1300,1, theVehicle)
 --setTimer (setVehicleColor, 1300,1, theVehicle, math.random(0,126),math.random(0,126),math.random(0,126),math.random(0,126))
 setTimer (fadeCamera, 2000,1,hitPlayer, true)
 end
 end
 end
 end
 addEventHandler ("onMarkerHit",getRootElement(),markers)
 