glenpark = createMarker (1985.093261,-1269.3278808,24.984,"arrow",1.5,255,255,0,170)
idlewood = createMarker (2000.36315,-1456.39416,14.390,"arrow",1.5,255,255,0,170)
downtown = createMarker (1585.162231,-1307.811767,18.401,"arrow",1.5,255,255,0,170)
alsain = createMarker (1189.38781,-1298.70886,14.555,"arrow",1.5,255,255,0,170)
atlantis = createMarker (1116.034545,-1410.07775,14.413,"arrow",1.5,255,255,0,170)
verdant = createMarker (1250.2611,-2048.5700,61,"arrow",1.5,255,255,0,170)
marina = createMarker (822.78015,-1763.562,14.56,"arrow",1.5,255,255,0,170)
santam = createMarker (440.17535,-1776.63000,6.7,"arrow",1.5,255,255,0,170)
flint = createMarker (-106.122,-1134.217,2,"arrow",1.5,255,255,0,170)
rodeo = createMarker (479.90447,-1312.831,16,"arrow",1.5,255,255,0,170)
winewod = createMarker (810.903,-1135.26,23,"arrow",1.5,255,255,0,170)
willow = createMarker (1976.980,-2173.433,13,"arrow",1.5,255,255,0,170)
playa = createMarker (2866.602,-2004.424,12,"arrow",1.5,255,255,0,170)
ganton = createMarker (2414.727,-1724.254,14,"arrow",1.5,255,255,0,170)
colinas = createMarker (2294.5102,-1143.00671,28,"arrow",1.5,255,255,0,170)
dillimore = createMarker (672.6237,-581.2261,17,"arrow",1.5,255,255,0,170)

addEvent ("otopen", true)
function markerHit (hitPlayer, matchingDimension)
  if (source == glenpark) then
   if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end
	elseif (source == idlewood) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == downtown) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == alsain) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end		
	elseif (source == atlantis) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == verdant) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end		
	elseif (source == marina) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == santam) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == flint) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end		
	elseif (source == rodeo) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == winewod) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == willow) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == playa) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == ganton) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == colinas) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end	
	elseif (source == dillimore) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("otopen", hitPlayer)
	end		
  end
end
addEventHandler ("onMarkerHit", getRootElement(), markerHit)

addEvent ("otosefer",true)
addEventHandler ("otosefer",getRootElement (),
function(name,cost,x,y,z,rx,ry,rz)
  if (isPedInVehicle (source)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Arabadan ininiz.")
    else if (getPlayerMoney(source) >= tonumber(cost)) then
      local vehicle = createVehicle (431,x,y,z,rx,ry,rz,"Otobus")
      takePlayerMoney (source,tonumber(cost))
	  --setVehicleLocked (tren,true)
      --fadeCamera (source,false,1.0)
	  setTimer (fadeCamera, 500,1,source,false)
	  setTimer (fadeCamera,1500,1,source,true)
	  setTimer (setCameraMatrix, 1600,1,source,-220.12109375,-3295.947265625,395.67504882813,-207.12109375,-3295.947265625,385.67504882813,0,70)
	  otobus = createVehicle ( 431, -212.1689453125,-3298.7734375,385.80838012695,0,0,270  )
-- setTimer (setElementPosition, 2500,1, otobus, -197.89204406738, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 3000,1, otobus, -190.89204406738, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 3500,1, otobus, -183.89204406738, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 4000,1, otobus, -176.74494934082, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 4500,1, otobus, -169.98439025879, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 5000,1, otobus, -162.98439025879, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 5500,1, otobus, -155.98439025879, -3298.4411621094,385.92504882813)
-- setTimer (setElementPosition, 6000,1, otobus, -152.00798034668, -3298.4411621094,385.92504882813)
 setTimer (setElementVelocity,2250,1, otobus, 1,0, 0 )
 --setTimer (setElementVelocity, 1500,1, otobus, 0,0,0)
setTimer (fadeCamera, 3750,1,source,false)
	  setTimer (destroyElement,4000,1,otobus)
setTimer (fadeCamera, 5100,1,source,true)
      --setTimer (setElementInterior,8000,1,source,0)
      --setTimer (setElementDimension,8000,1,source,0)
      setTimer (warpPedIntoVehicle,5100,1,source,vehicle)
	  setTimer (setCameraTarget, 5100,1,source)
      --setTimer (fadeCamera,1500,1,source,true,1.0)
	  setVehicleEngineState (vehicle,false)
	  setVehicleColor (vehicle,math.random(0,126),math.random(0,126),math.random(0,126),math.random(0,126))
	  triggerClientEvent ("otopkapat",source)
      setTimer (setControlState,6100,1,source,"enter_exit",true)
      setTimer (destroyElement,8000,1,vehicle)
    else
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Binis Ucreti: " .. tostring(cost) .." TL\nAncak sende " .. tostring (getPlayerMoney(source)) .. " TL Var!")
    end
  end
end)