lspdic = createMarker (249.87, 68.581, 1004.64,"arrow",1.5,255,255,0,255)

addEventHandler ("onResourceStart", getRootElement(),
function ()
setElementInterior (lspdic, 6)
end)

addEvent ("aruhsat", true)
addEvent ("sruhsat",true)
addEvent ("ehlika", true)

function aracruhsat ( )
      local playeraccount = getPlayerAccount ( source )
      if ( playeraccount ) then
	    -- if (getPlayerMoney(source) == 2000) then
            setAccountData ( playeraccount, "arabaruhsat", var )
			-- else
		-- outputChatBox ("Araba ehliyet&ruhsat sarýn almak için 2000 TL olmasý gerekir",source,255,0,0)
      -- end
  end
end
addEventHandler ("aruhsat", getRootElement(), aracruhsat)
 
function silahruhsat ( )
      local playeraccount = getPlayerAccount ( source )
      if ( playeraccount ) then
	    --if (getPlayerMoney(source) == 2500) then
            setAccountData ( playeraccount, "silahruhsat", var )
		--	else
		--outputChatBox ("Silah ruhsatý sarýn almak için 2500 TL olmasý gerekir",source,255,0,0)
      --end
  end
end
addEventHandler ("sruhsat", getRootElement(), aracruhsat)

addEvent ("ehliac", true)
function markerHit (hitPlayer, matchingDimension)
  if (source == lspdic) then
   if (isPedInVehicle(hitPlayer)) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba ile giremezsiniz.")
	else
    triggerClientEvent ("ehliac", hitPlayer)
	end	
  end
end
addEventHandler ("onMarkerHit", getRootElement(), markerHit)
