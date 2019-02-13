lsantos = createMarker (1684.8001,-1945.016,14.546,"arrow",1.5,255,0,255,170)
redcount = createMarker (2821.217529,26.683252,21.520315,"arrow",1.5,255,0,255,170)
flintcount = createMarker (-108.1111,-1136.6705,2.535,"arrow",1.5,255,0,255,170)
lascolin = createMarker (2295.0698,-1140.041015,27.794,"arrow",1.5,255,0,255,170)
market = createMarker (826.20697,-1353.6049,14.536,"arrow",1.5,255,0,255,170)

addEvent ("pencere", true)
function markerHit (hitPlayer, matchingDimension)
  if (source == lsantos) then
   if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("pencere", hitPlayer)
	end
	elseif (source == redcount) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("pencere", hitPlayer)
	end	
   elseif (source == flintcount) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("pencere", hitPlayer)
	end	
	  elseif (source == lascolin) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("pencere", hitPlayer)
	end	
  elseif (source == market) then
	 if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("pencere", hitPlayer)
	end		
  end
end
addEventHandler ("onMarkerHit", getRootElement(), markerHit)


addEvent ("trenseferleri",true)
addEventHandler ("trenseferleri",getRootElement (),
function(name,cost,x,y,z)
  if (isPedInVehicle (source)) then
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Arabadan ininiz.")
    else
    if (getPlayerMoney(source) >= tonumber(cost)) then
      local vehicle = createVehicle (570,x,y,z,x+3,y-3,0,"TREN")
      takePlayerMoney (source,tonumber(cost))
	  setVehicleLocked (tren,true)
      setTrainDerailable(vehicle, false)
	  setTrainDerailed ( vehicle, false )
	  setTrainSpeed ( vehicle, 0 )
      fadeCamera (source,false,1.0)
      setTimer (setElementInterior,1000,1,source,0)
      setTimer (setElementDimension,1000,1,source,0)
      setTimer (warpPedIntoVehicle,1000,1,source,vehicle)
      setTimer (fadeCamera,1500,1,source,true,1.0)
	  triggerClientEvent ("pkapat",source)
      setTimer (setControlState,3000,1,source,"enter_exit",true)
      setTimer (destroyElement,5000,1,vehicle)
    else
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Sefer Ucreti: " .. tostring(cost) .." TL\nAncak sende " .. tostring (getPlayerMoney(source)) .. " TL Var!")
    end
  end
end)

