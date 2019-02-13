addEventHandler ("onPlayerChat",getRootElement(),
function(message,type)
  if (string.find (message,"SIKERIM")) then
    local newmessage = string.gsub (message,"SIKERIM","Uygunsuz mesaj yazdigi için 120 Saniye Mutelendi!")
    --message = outputChatBox (getPlayerNametagText(source) .. " " .. message,getRootElement(),255,0,0,true)
	message = newmessage
	setPlayerMuted (source, true)
	setTimer ( setPlayerMuted, 120000, 1, source, false)
  elseif (string.find (message,"sikerim")) then
    local newmessage = string.gsub (message,"sikerim","#ff000Bu mesaj uygunsuz kelimeler içerdigi için yayinlanmadi!")
    message = nil
    message = newmessage
  -- end
  -- if (type == 0) then
    -- local r,g,b = getPlayerNametagColor (source)
    -- if r and g and b then
      -- outputChatBox (getPlayerNametagText(source) .. ":#FFFFFF " .. message,getRootElement(),r,g,b,true)
      -- cancelEvent()
    -- else
      -- outputChatBox (getPlayerNametagText(source) .. ":#FFFFFF " .. message,getRootElement(),0,0,0,true)
    -- end
  -- elseif (type == 1) then
    -- outputChatBox ("* " .. getPlayerNametagText(source) .. " " .. message,getRootElement(),255,0,255,false)
    -- cancelEvent()
  -- elseif (type == 2) then
    -- local r,g,b = getPlayerNametagColor (source)
    -- if r and g and b then
      -- outputChatBox ("TELSIZ".. getPlayerNametagText(source) .. " :#FFFFFF " .. message,getRootElement(),r,g,b,true)
      -- cancelEvent()
    -- else
      -- outputChatBox ("[TELSIZ]".. getPlayerNametagText(source) .. " :#FFFFFF " .. message,getRootElement(),0,0,0,true)
    -- end
  end
end)

-- Interiors
-- addEventHandler ("onResourceStart",getResourceRootElement(getThisResource()),
-- function()
  --interieuren
  -- ammuEntMarker = createMarker (2159.13,943.13,11.42,"arrow",1.5,255,255,0,128,getRootElement())
  -- createBlip (2159.13,943.13,11.42,6, 0, 0, 0, 255,0,0, 150, getRootElement())
  -- ammuExitMarker = createMarker (286.14,-40.64,1002.51,"arrow",1.5,255,255,0,128,getRootElement())
  -- setElementInterior (ammuExitMarker,1)
  -- setElementDimension (ammuExitMarker,1)
  -- bincoEntMarker = createMarker (-2374.98,910.15,46.45,"arrow",1.5,255,255,0,128,getRootElement())
  -- createBlip (-2374.98,910.15,46.45,45, 0, 0, 0, 255,0,0, 150, getRootElement())
  -- bincoExitMarker = createMarker (207.68,-110.81,1006.13,"arrow",1.5,255,255,0,128,getRootElement())
  -- setElementInterior (bincoExitMarker,15)
  -- setElementDimension (bincoExitMarker,1)
  -- bincoClothesMarker = createMarker (217.46,-97.97,1004.25,"cylinder",2,255,0,0,getRootElement())
  -- setElementInterior (bincoClothesMarker,15)
  -- setElementDimension (bincoClothesMarker,1)
  
 -- Fix marker voor SUPERTUBE
  -- SUPERTUBEfixMarker = createMarker (2756.01,-1838.24,703.92,"corona",10,0,255,0,128,getRootElement())
  -- SUPERTUBEendFixMarker = createMarker (2603.53,-1547.57,13.85,"corona",10,255,0,0,128,getRootElement())
-- end)

-- function warpplayerToInterior (player,x,y,z,interior,dimension)
  -- fadeCamera (player,false,1.0)
  -- setTimer (setPedFrozen,750,1,player,true)
  -- setTimer (setElementInterior,1000,1,player,interior)
  -- setTimer (setElementPosition,1000,1,player,x,y,z)
  -- setTimer (setElementDimension,1000,1,player,dimension)
  -- setTimer (setPedFrozen,1500,1,player,false)
  -- setTimer (fadeCamera,1500,1,player,true,1.0)
-- end 

-- addEventHandler ("onMarkerHit",getRootElement(),
-- function(hitElement,matchingDimension)
  -- if (getElementType (hitElement) == "player") and (not isPedInVehicle (hitElement)) then
    -- if (source == bincoEntMarker) then
      -- warpplayerToInterior (hitElement,207.72,-108.91,1005.13,15,1)
    -- elseif (source == bincoExitMarker) then
      -- warpplayerToInterior (hitElement,-2375.24,913.20,45.45,0,0)
    -- elseif (source == gatExitMarker) then
      -- warpplayerToInterior (hitElement,-2047.77,253.51,35.59,0,0)
    -- elseif (source == bincoClothesMarker) then
      -- toggleControl (hitElement,"next_weapon",false)
      -- toggleControl (hitElement,"previous_weapon",false)
      -- toggleControl (hitElement,"forwards",false)
      -- toggleControl (hitElement,"backwards",false)
      -- toggleControl (hitElement,"jump",false)
      -- toggleControl (hitElement,"sprint",false)
      -- toggleControl (hitElement,"chrouch",false)
      -- toggleControl (hitElement,"left",false)
      -- toggleControl (hitElement,"right",false)
      -- toggleControl (hitElement,"walk",false)
      -- toggleControl (hitElement,"fire",false)
      -- bindKey (hitElement,"arrow_l","down",selectPlayerClothesBindKeyLeft)
      -- bindKey (hitElement,"arrow_r","down",selectPlayerClothesBindKeyRight)
      -- bindKey (hitElement,"enter","down",selectPlayerClothesBindKeyEnter)
      -- triggerClientEvent ("lolmodOpenInfoWindow",hitElement,"Welcome to the clothesshop!\nAre you fed up of your clothes? or just want something else?\nHERES THE SOLUTION!\nYou can change your clothes with the arrows ( <- and -> ) and when you think it's OK, press Enter/Return.\nAfter you've done this you can continiue the game.\nYou don't pay for chaning your clothes.\nHave a nice day!")
    -- elseif (source == ammuEntMarker) then
      -- warpplayerToInterior (hitElement,288.91,-40.47,1001.51,1,1)
    -- elseif (source == ammuExitMarker) then
      -- warpplayerToInterior (hitElement,2159.13,941,11.42,0,0)
    -- end
  -- elseif ((getElementType (hitElement) == "vehicle")) then
    -- if (source == SUPERTUBEfixMarker) then
      -- setVehicleDamageProof (hitElement,true)
      -- outputChatBox ("The timer starts now, make sure you are down in 3 minutes. Else you lose your damage-proof.",getVehicleOccupant (hitElement),255,0,0,false)
      -- setTimer (setVehicleDamageProof,180000,1,false)
    -- elseif (source == SUPERTUBEendFixMarker) then
      -- setVehicleDamageProof (hitElement,false)
    -- end
  -- end
-- end)

-- function selectPlayerClothesBindKeyLeft (player,key,state)
  -- if (isCursorShowing (player) == false) then  local skin = getElementModel (player)
    -- if (skin == 0) then setElementModel (player,288)
    -- elseif (skin == 7) then setElementModel (player,0)
    -- elseif (skin == 9) then setElementModel (player,7)
    -- elseif (skin == 43) then setElementModel (player,41)
    -- elseif (skin == 66) then setElementModel (player,64)
    -- elseif (skin == 75) then setElementModel (player,73)
    -- elseif (skin == 87) then setElementModel (player,85)
    -- elseif (skin == 120) then setElementModel (player,118)
    -- elseif (skin == 150) then setElementModel (player,148)
    -- elseif (skin == 209) then setElementModel (player,207)
    -- elseif (skin == 274) then setElementModel (player,164)
    -- else setElementModel (player,skin -1)
    -- end
  -- end
-- end

-- function selectPlayerClothesBindKeyRight (player,key,state)
  -- if (isCursorShowing (player) == false) then
    -- local skin = getElementModel (player)
    -- if (skin == 288) then setElementModel (player,0)
    -- elseif (skin == 0) then setElementModel (player,7)
    -- elseif (skin == 7) then setElementModel (player,9)
    -- elseif (skin == 41) then setElementModel (player,43)
    -- elseif (skin == 64) then setElementModel (player,66)
    -- elseif (skin == 73) then setElementModel (player,75)
    -- elseif (skin == 85) then setElementModel (player,87)
    -- elseif (skin == 118) then setElementModel (player,150)
    -- elseif (skin == 148) then setElementModel (player,148)
    -- elseif (skin == 207) then setElementModel (player,209)
    -- elseif (skin == 264) then setElementModel (player,274)
    -- else setElementModel (player,skin +1)
    -- end
  -- end
-- end 

-- function selectPlayerClothesBindKeyEnter (player,key,state)
  -- if (isCursorShowing (player) == false) then
    -- triggerClientEvent ("lolmodOpenInfoWindow",player,"Your skin is changed now!\nYou can start playing again!")
    -- toggleControl (player,"next_weapon",true)
    -- toggleControl (player,"previous_weapon",true)
    -- toggleControl (player,"forwards",true)
    -- toggleControl (player,"backwards",true)
    -- toggleControl (player,"jump",true)
    -- toggleControl (player,"sprint",true)
    -- toggleControl (player,"chrouch",true)
    -- toggleControl (player,"left",true)
    -- toggleControl (player,"right",true)
    -- toggleControl (player,"walk",true)
    -- toggleControl (player,"fire",true)
    -- unbindKey (player,"arrow_l","down",selectPlayerClothesBindKeyLeft)
    -- unbindKey (player,"arrow_r","down",selectPlayerClothesBindKeyRight)
    -- unbindKey (player,"enter","down",selectPlayerClothesBindKeyEnter)
  -- end
-- end 

addEventHandler ("onPlayerWasted",getRootElement(),
function(totalammo,killer,killwerweapon,bodypart,stealth)
  local x,y,z = getElementPosition (source)
  local sf = getDistanceBetweenPoints3D (x,y,z,-2655.16,639.467,14.4545)
  local lv = getDistanceBetweenPoints3D (x,y,z,1607.23,1816.24,10.82)
  local ls = getDistanceBetweenPoints3D (x,y,z,2035.995,-1403.73,17.27)
  if (sf < lv) then
    if (sf < ls) then
      setTimer (fadeCamera,1000,1,source,false,2.5) 
	  setTimer (spawnPlayer,1500,1,source,-2655.16,639.467,14.4545,0,getElementModel (source),0,0,nil) 
	  setTimer (setPlayerMoney, 1500,1,source, 250 )
	  setTimer(setAccountData, 1500,1 ,getPlayerAccount (source), "arabasi", 510)
	  setTimer (fadeCamera,2000,1,source,true,1.0)
	  setTimer (triggerClientEvent,1500,1,"lolmodOpenInfoWindow",source,"Maalesef "..getPlayerNametagText(source).." isimli karakteriniz oldu.\nBu nedenle tum bilgileriniz sifirlandi.")
    else
      setTimer (fadeCamera,1000,1,source,false,2.5) 
	  setTimer (spawnPlayer,1500,1,source,2035.995,-1403.73,17.27,0,getElementModel (source),0,0,nil) 
	  setTimer (setPlayerMoney, 1500,1,source, 250 )  
	   setTimer(setAccountData, 1500,1 ,getPlayerAccount (source), "arabasi", 510)
	  setTimer (fadeCamera,2000,1,source,true,1.0)
	  setTimer (triggerClientEvent,1500,1,"lolmodOpenInfoWindow",source,"Maalesef "..getPlayerNametagText(source).." isimli karakteriniz oldu.\nBu nedenle tum bilgileriniz sifirlandi.")
    end
  else
    if (lv < ls) then
      setTimer (fadeCamera,1000,1,source,false,2.5) 
	  setTimer (spawnPlayer,1500,1,source,1607.23,1816.24,10.82,0,getElementModel (source),0,0,nil) 
	  setTimer (setPlayerMoney, 1500,1,source, 250 )	
      setTimer(setAccountData, 1500,1 ,getPlayerAccount (source), "arabasi", 510)	  
	  setTimer (fadeCamera,2000,1,source,true,1.0)
	  setTimer (triggerClientEvent,1500,1,"lolmodOpenInfoWindow",source,"Maalesef "..getPlayerNametagText(source).." isimli karakteriniz oldu.\nBu nedenle tum bilgileriniz sifirlandi.")
    else
      setTimer (fadeCamera,1000,1,source,false,2.5) 
	  setTimer (spawnPlayer,1500,1,source,2035.995,-1403.73,17.27,0,getElementModel (source),0,0,nil) 
	  setTimer (setPlayerMoney, 1500,1,source, 250 )	  
	   setTimer(setAccountData, 1500,1 ,getPlayerAccount (source), "arabasi", 510)
	  setTimer (fadeCamera,2000,1,source,true,1.0)	  
	  setTimer (triggerClientEvent,1500,1,"lolmodOpenInfoWindow",source,"Maalesef "..getPlayerNametagText(source).." isimli karakteriniz oldu.\nBu nedenle tum bilgileriniz sifirlandi.")
    end
  end
end)

addEventHandler ("onPlayerWasted", getRootElement(), 
function (totalAmmo, killer, killerWeapon, bodypart, stealth)
  setPlayerWantedLevel (source, 0)
  if (getElementType(killer) == "player") and (killer) and (killer ~= source) and not (getPlayerNametagText (source) == "[COP]" .. getPlayerName (source)) then
    setPlayerWantedLevel (killer, getPlayerWantedLevel (killer) +1)
  elseif (getElementType(killer) == "player") and (killer) and (killer ~= source) and (getPlayerNametagText (source) == "[COP]" .. getPlayerName (source)) then
    setPlayerWantedLevel (killer, getPlayerWantedLevel (killer) +2)
  end
end)

--Blips:
--createBlip (693.5478515625,-1705.779296875,3.8194825649261,31)
--createBlip (693.7587890625,-1645.810546875,3.8194825649261,31)