--[[

Hello downloader:>

When you want to set something to the "character data", you need to do the following things

    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
    if (characterindex) then
      local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
      
      xmlNodeSetAttirbute (characterRoot,"tag",thingyouwanttosave) -- You can load with this
      
      local loadedpart = xmlNodeGetAttirbute (characterRoot,"tag") -- You can load with this
      
    end

]]--



addEvent ("lolmodLoginPlayer",true)
addEventHandler ("lolmodLoginPlayer",getRootElement(),
function(username,password)
  local account = getAccount (username,password)
  if (account) then
    logIn (source,account,password)
    local root = xmlLoadFile ("players.xml")
    if (xmlFindChild (root,"player",findPlayerIndexByName (tostring(username)))) then
      local playerNode = xmlFindChild (root,"player",findPlayerIndexByName (tostring(username)))
      --triggerClientEvent ("lolmodOpenInfoWindow",source,"Tekrar hosgeldin.\nKarakterini sec ve oyna!")
      local character = xmlNodeGetChildren (playerNode)
      if (character[3]) then
        triggerClientEvent (source,"lolmodOpenCharacterSelectWindow",source,username,xmlNodeGetAttribute(character[1],"name"),xmlNodeGetAttribute(character[2],"name"),xmlNodeGetAttribute(character[3],"name"))
      elseif (character[2]) then
        triggerClientEvent (source,"lolmodOpenCharacterSelectWindow",source,username,xmlNodeGetAttribute(character[1],"name"),xmlNodeGetAttribute(character[2],"name"))
      elseif (character[1]) then
        triggerClientEvent (source,"lolmodOpenCharacterSelectWindow",source,username,xmlNodeGetAttribute(character[1],"name"))
      else
        triggerClientEvent (source,"lolmodOpenCharacterSelectWindow",source,username)
      end
    else
      local playerNode = xmlCreateChild (root,"player")
      xmlNodeSetAttribute (playerNode,"name",tostring(username))
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Welcome!\nWe see it's your first time here, welcome to Lolmode!\nYou haven't got a character yet, but you can make one when you click New Character!\nGood luck in the game!")
      triggerClientEvent (source,"lolmodOpenCharacterSelectWindow",source,username)
      xmlSaveFile (root)
    end
    xmlUnloadFile (root)
  else
    triggerClientEvent (source,"girisyazisi",source,"Giris Hatali")
  end
end)

-- © JasperNL=D

-- addEvent ("lolmodRegisterPlayer",true)
-- addEventHandler ("lolmodRegisterPlayer",getRootElement(),
-- function(username,password)
  -- local account = getAccount (username)
  -- if (account) then
    -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Uzgunuz,bu isimle daha once kayit oldu")
  -- else
    -- addAccount (username,password)
    -- triggerClientEvent ("lolmodOpenInfoWindow",source,"That's all! Your account is registered! You can log in now by clicking the Log In! button! then you can create a character which you play the game with!\nGood luck!")
  -- end
-- end)

-- © JasperNL=D

addEvent ("lolmodSpawnCharacter",true)
addEventHandler ("lolmodSpawnCharacter",getRootElement(),
function(charactername)
  if (charactername) then
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
    if (characterindex) then
      local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
      spawnPlayer (source,tonumber(xmlNodeGetAttribute (characterRoot,"px")),tonumber(xmlNodeGetAttribute (characterRoot,"py")),tonumber(xmlNodeGetAttribute (characterRoot,"pz")),0,tonumber(xmlNodeGetAttribute (characterRoot,"skin")),tonumber(xmlNodeGetAttribute (characterRoot,"pi")),tonumber(xmlNodeGetAttribute (characterRoot,"pd")),nil)
      toggleControl (source,"chatbox",true)
      --createBlipAttachedTo (source,0,2,tonumber(xmlNodeGetAttribute (characterRoot,"cr")),tonumber(xmlNodeGetAttribute (characterRoot,"cg")),tonumber(xmlNodeGetAttribute (characterRoot,"cb")),255)
      setPlayerMoney (source,tonumber(xmlNodeGetAttribute (characterRoot,"cash")))
      setPlayerNametagText (source,tostring(xmlNodeGetAttribute (characterRoot,"name")))
      setPlayerNametagColor (source,tonumber(xmlNodeGetAttribute (characterRoot,"cr")),tonumber(xmlNodeGetAttribute (characterRoot,"cg")),tonumber(xmlNodeGetAttribute (characterRoot,"cb")))
      setPedArmor (source,tonumber(xmlNodeGetAttribute (characterRoot,"armor")))
      setElementHealth (source,tonumber(xmlNodeGetAttribute (characterRoot,"health")))
      local weapons = xmlFindChild (characterRoot,"weapons",0)
      if (weapons) then
        local weapon = xmlNodeGetAttributes (weapons)
        giveWeapon (source,weapon["w"],weapon["wammo"],true)
      end
      setCameraTarget (source,source)
      outputChatBox (getPlayerNametagText (source) .. "#FF0000 oyuna girdi.",getRootElement(),255,0,0,true)
      triggerClientEvent ("girisp", source)
	  local cash = xmlNodeGetAttribute (characterRoot,"cash")
      local bank = xmlNodeGetAttribute (characterRoot,"bank")
      local housenumber = xmlNodeGetAttribute (characterRoot,"house")
      if not (housenumber) then
        local housenumber = nil
        local housenumber = "No house Availible"
      end
      triggerClientEvent (source,"lolmodHideCharacterSelectWindow",source)
      triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,cash,bank,housenumber)
      xmlUnloadFile (root)
    end
  else
    triggerClientEvent ("lolmodOpenInfoWindow",source,"You need to select a character first!") 
  end
end)

-- © JasperNL=D

-- addEvent ("createNewCharacter",true)
-- addEventHandler ("createNewCharacter",getRootElement(),
-- function(skin,colred,colgreen,colblue,charactername,karakteryasi)
  -- local accountName = getAccountName (getPlayerAccount(source))
  -- if (getCharacterCount (accountName) < 3) then
    -- if not (checkCharacterNameIsFake(charactername) == "FAKE") then
      -- local root = xmlLoadFile ("players.xml")
      -- local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))
      -- local newCharacter = xmlCreateChild (playerRoot,"character")
      -- xmlNodeSetAttribute (newCharacter,"name",charactername)
      -- xmlNodeSetAttribute (newCharacter,"skin",skin)
      -- xmlNodeSetAttribute (newCharacter,"cr",colred)
      -- xmlNodeSetAttribute (newCharacter,"cg",colgreen)
      -- xmlNodeSetAttribute (newCharacter,"cb",colblue)
	  -- xmlNodeSetAttribute (newCharacter,"yasi",karakteryasi)
      -- xmlNodeSetAttribute (newCharacter,"px",2000.51)
      -- xmlNodeSetAttribute (newCharacter,"py",1567.37)
      -- xmlNodeSetAttribute (newCharacter,"pz",15.367185)
      -- xmlNodeSetAttribute (newCharacter,"pi",0)
      -- xmlNodeSetAttribute (newCharacter,"pd",0)
      -- xmlNodeSetAttribute (newCharacter,"cash",1000)
      -- xmlNodeSetAttribute (newCharacter,"bank",1500)
      -- setTimer (logOut,1000,1,source)
      -- xmlSaveFile (root)
      -- xmlUnloadFile (root)
    -- else
    -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, this character name is already in use.") 
    -- end
  -- else
    -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, the character max is 3 characters!\nYou have: 3 characters!\nYou can't add new ones any more!") 
  -- end
-- end)

-- © JasperNL=D

function getCharacterIndexByCharacterName (playeraccountname,charactername)
  local root = xmlLoadFile ("players.xml")
  local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (playeraccountname))
  local allCharacters = xmlNodeGetChildren (playerRoot)
  j = 0
  for i,v in ipairs (allCharacters) do
    j = j+1
    if (xmlNodeGetAttribute (v,"name") == charactername) then
      return j
    end
  end
  xmlUnloadFile (root)
end 

-- © JasperNL=D

function getCharacterCount (playeraccountname)
  local root = xmlLoadFile ("players.xml")
  local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (playeraccountname))
  local allCharacters = xmlNodeGetChildren (playerRoot)
	if (allCharacters) then
	  k = 0
	  for i,v in ipairs (allCharacters) do
		k = k+1
	  end
	  xmlUnloadFile (root)
	  return k
	else
    return 0
	end
end 

-- © JasperNL=D

function findPlayerIndexByName (playeraccountname)
  local root = xmlLoadFile ("players.xml")
  local allPlayers = xmlNodeGetChildren (root)
  local k = -1
  for i,v in ipairs (allPlayers) do
    k = k+1
    if (xmlNodeGetAttribute (v,"name") == playeraccountname) then
      return k
    end
  end
  xmlUnloadFile (root)
end 

-- © JasperNL=D

addEventHandler ("onPlayerQuit",getRootElement(),
function (type,reason,respelement)
  if (isPlayerSpawned (source)) then
    local charactername = getPlayerNametagText (source)
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))  
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    if (characterRoot) then
      local x,y,z = getElementPosition (source)
      --local int = getElementInterior (source)
      --local dim = getElementDimension (source)
      local money = getPlayerMoney (source)
      local skin = getElementModel (source)
      xmlNodeSetAttribute (characterRoot,"cash",money)
      xmlNodeSetAttribute (characterRoot,"health",getElementHealth (source))
      xmlNodeSetAttribute (characterRoot,"armor",getPedArmor (source))
      xmlNodeSetAttribute (characterRoot,"px",x)
      xmlNodeSetAttribute (characterRoot,"py",y)
      xmlNodeSetAttribute (characterRoot,"pz",z+1)
      --xmlNodeSetAttribute (characterRoot,"pi",int)
      --xmlNodeSetAttribute (characterRoot,"pd",dim)
      xmlNodeSetAttribute (characterRoot,"skin",skin)
      if (xmlFindChild (characterRoot,"weapons",0)) then
        xmlDestroyNode (xmlFindChild (characterRoot,"weapons",0))
        local characterWeaponsRoot = xmlCreateChild (characterRoot,"weapons")
        xmlNodeSetAttribute (characterWeaponsRoot,"w",getPedWeapon (source))
        xmlNodeSetAttribute (characterWeaponsRoot,"wammo",getPedTotalAmmo (source))
      else
        local characterWeaponsRoot = xmlCreateChild (characterRoot,"weapons")
        xmlNodeSetAttribute (characterWeaponsRoot,"w",getPedWeapon (source))
        xmlNodeSetAttribute (characterWeaponsRoot,"wammo",getPedTotalAmmo (source))
      end
      xmlSaveFile (root)
      xmlUnloadFile (root)
      outputChatBox (getPlayerNametagText (source) .. "#FF0000 Oyundan çýktý. [" .. type .. "]",getRootElement(),255,0,0,true)
      if (getAttachedElements(source)) then
        for i,v in ipairs (getAttachedElements (source)) do
          destroyElement (v)
        end
      end
    end
  end
end)

-- © JasperNL=D

function isPlayerSpawned (player)
  local x,y,z = getElementPosition (player)
  if (x == 0) and (y == 0) and (z == 0) then
    return false
  else
    return true
  end
end 

-- © JasperNL=D

addEvent ("logoutPlayer",true)
addEventHandler ("logoutPlayer",getRootElement(),
function()
  if (isPlayerSpawned (source)) then
    local charactername = getPlayerNametagText (source)
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))  
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    if (characterRoot) then
      local x,y,z = getElementPosition (source)
      local int = getElementInterior (source)
      local dim = getElementDimension (source)
      local money = getPlayerMoney (source)
      local skin = getElementModel (source)
      xmlNodeSetAttribute (characterRoot,"cash",money)
      xmlNodeSetAttribute (characterRoot,"health",getElementHealth (source))
      xmlNodeSetAttribute (characterRoot,"armor",getPedArmor (source))
      xmlNodeSetAttribute (characterRoot,"px",x)
      xmlNodeSetAttribute (characterRoot,"py",y)
      xmlNodeSetAttribute (characterRoot,"pz",z+1)
      xmlNodeSetAttribute (characterRoot,"pi",int)
      xmlNodeSetAttribute (characterRoot,"pd",dim)
      xmlNodeSetAttribute (characterRoot,"skin",skin)
      if (xmlFindChild (characterRoot,"weapons",0)) then
        xmlDestroyNode (xmlFindChild (characterRoot,"weapons",0))
        local characterWeaponsRoot = xmlCreateChild (characterRoot,"weapons")
        xmlNodeSetAttribute (characterWeaponsRoot,"w",getPedWeapon (source))
        xmlNodeSetAttribute (characterWeaponsRoot,"wammo",getPedTotalAmmo (source))
      else
        local characterWeaponsRoot = xmlCreateChild (characterRoot,"weapons")
        xmlNodeSetAttribute (characterWeaponsRoot,"w",getPedWeapon (source))
        xmlNodeSetAttribute (characterWeaponsRoot,"wammo",getPedTotalAmmo (source))
      end
      xmlSaveFile (root)
      xmlUnloadFile (root)
      --outputChatBox (getPlayerNametagText (source) .. "#FF0000 has left the game [Logged Out]",getRootElement(),255,0,0,true)
      if (getAttachedElements(source)) then
        for i,v in ipairs (getAttachedElements (source)) do
          destroyElement (v)
        end
      end
      logOut (source)
    end
  end
end)

-- © JasperNL=D

function checkCharacterNameIsFake (charactername)
  local root = xmlLoadFile ("players.xml")
  if (root) then
    local allPlayers = xmlNodeGetChildren (root)
    if allPlayers then
      for i,v in ipairs (allPlayers) do
        for j,w in ipairs (xmlNodeGetChildren(v)) do
          if (w) then
            if (charactername == xmlNodeGetAttribute (w,"name")) then
              return "FAKE"
            end
          end
        end
      end
    end
    xmlUnloadFile (root)
  end
end 

-- © JasperNL=D

-- BANK
addEventHandler ("onResourceStart",getResourceRootElement(getThisResource()),
function ()
  local root = xmlLoadFile ("banks.xml")
  local allBanks = xmlNodeGetChildren (root)
  for i,v in ipairs (allBanks) do
    local x = xmlNodeGetAttribute (v,"x")
    local y = xmlNodeGetAttribute (v,"y")
    local z = xmlNodeGetAttribute (v,"z")
    local bankname = xmlNodeGetValue  (v)
    createBlip (x,y,z,52, 0, 0, 0, 255,0,0, 150, getRootElement())
    local atmmarker = createMarker (x,y,z-1,"cylinder",2,0,255,0,100)
    local atm = createObject (2942,x,y+0.75,z-0.25)
    setElementData (atmmarker,"bank",bankname)
  end
  xmlUnloadFile (root)
  
-- © JasperNL=D

-- gedeelte greenzones
  -- setTimer (moneyZoneTimerFunction, 2500, 0)
  -- local allGreenzones = getElementsByType ("radararea")
  -- for i,v in ipairs (allGreenzones) do
    -- local r,g,b,a = getRadarAreaColor (v)
    -- if (r == 0) and (g == 255) and (b == 0) and (a == 127) then
      -- local x,y = getElementPosition (v)
      -- local sx,sy = getRadarAreaSize (v)
      -- local col = createColCuboid (x,y, -50, sx,sy, 7500)
      -- setElementID (col, "greenzoneColshape")
    -- end
  -- end
 end)

-- © JasperNL=D

addEventHandler ("onMarkerHit",getRootElement(),
function(hitEle,matchDim)
  if (getElementType (hitEle) == "player") and (getElementData (source,"bank")) then
    triggerClientEvent (hitEle,"openBankWindow",hitEle,getElementData (source,"bank"))
  end
end)

-- © JasperNL=D

addEvent ("bankStoreMoney",true)
addEventHandler ("bankStoreMoney",getRootElement(),
function(amount)
  local playerMoney = getPlayerMoney (source)
  if (playerMoney < amount) then
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, you can't store more as you have!") 
  else
    local charactername = getPlayerNametagText (source)
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))  
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    if (characterRoot) then
      local currentBank = xmlNodeGetAttribute (characterRoot,"bank")
      local newBank = tonumber (currentBank) + amount
      setPlayerMoney (source,getPlayerMoney (source) -amount)
      xmlNodeSetAttribute (characterRoot,"bank",newBank)
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Your money is stored succesfull!")       
      --local cash = xmlNodeGetAttribute (characterRoot,"cash")
      local bank = xmlNodeGetAttribute (characterRoot,"bank")
      triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,getPlayerMoney (source),bank)
      xmlSaveFile (root)
      xmlUnloadFile (root)
    end
  end
end)

-- © JasperNL=D

addEvent ("bankWithdrawMoney",true)
addEventHandler ("bankWithdrawMoney",getRootElement(),
function(amount)
  local charactername = getPlayerNametagText (source)
  local accountName = getAccountName(getPlayerAccount(source))
  local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
  if (characterindex) then
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    if (characterRoot) then
      local currentBank = xmlNodeGetAttribute (characterRoot,"bank")
      if (tonumber(currentBank) >= tonumber(amount)) then
        local newBank = tonumber (currentBank) - amount
        givePlayerMoney (source,amount)
        xmlNodeSetAttribute (characterRoot,"bank",newBank)
        triggerClientEvent ("lolmodOpenInfoWindow",source,"Para basariyla cekildi!") 
        local cash = xmlNodeGetAttribute (characterRoot,"cash")
        local bank = xmlNodeGetAttribute (characterRoot,"bank")
        triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,cash,bank)
        xmlSaveFile (root)
        xmlUnloadFile (root)
      else
        triggerClientEvent ("lolmodOpenInfoWindow",source,"HATA! Paraniz cekilmedi!") 
        local cash = xmlNodeGetAttribute (characterRoot,"cash")
        local bank = xmlNodeGetAttribute (characterRoot,"bank")
        triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,cash,bank)
        xmlSaveFile (root)
        xmlUnloadFile (root)
      end
    end
  end
end)

-- © JasperNL=D

-- Game Menu
addEvent ("gameMenuButtonClick",true)
addEventHandler ("gameMenuButtonClick",getRootElement(),
function(buttonname,arg1,arg2,arg3,arg4,arg5)
  -- if (buttonname == "fix") then
    -- if (getPlayerMoney (source) > 49) and (isPedInVehicle (source)) then
      -- takePlayerMoney (source,50)
      -- fixVehicle (getPedOccupiedVehicle(source))
      -- triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,getPlayerMoney (source))
    -- else  
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Araba tanþ\nYou've got just " .. tostring (getPlayerMoney(source)) .. "$!")
    -- end
  -- if (buttonname == "flip") then
    -- local rx,ry,rz = getVehicleRotation (getPedOccupiedVehicle (source))
    -- setVehicleRotation (getPedOccupiedVehicle (source),rx -180,ry,rz)

  if (buttonname == "getPlayerInfo") then
    if (findPlayerByNametagText (arg1)) then
      local accountName = getAccountName(getPlayerAccount(findPlayerByNametagText(arg1)))
      local characterindex = getCharacterIndexByCharacterName (accountName,arg1)
      local root = xmlLoadFile ("players.xml")
      local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
      if (characterindex) then
        local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
        local cash = getPlayerMoney (source)
        local bank = xmlNodeGetAttribute (characterRoot,"bank")
		local karakteryasi = xmlNodeGetAttribute (characterRoot,"yasi")
        if (getElementData (gotoPlayer,"gotostate") == true) then
          triggerClientEvent (source,"gameMenuShowPlayerInfo",source,tostring(accountName),tostring(arg1),tostring(cash),tostring(bank),"Acik!",tostring(karakteryasi))
        else
          triggerClientEvent (source,"gameMenuShowPlayerInfo",source,tostring(accountName),tostring(arg1),tostring(cash),tostring(bank),"Kapali",tostring(karakteryasi))
        end
        xmlUnloadFile (root)
      end
    else
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, this player isn't exist any more, he would play on another nametag or left the game.\n\nOr you haven't selected a player.\nPress refresh list for the current version of the list!")
    end
	
	-- elseif (findPlayerByNametagText (arg1)) then
      -- local accountName = getAccountName(getPlayerAccount(findPlayerByNametagText(arg1)))
      -- local characterindex = getCharacterIndexByCharacterName (accountName,arg1)
      -- local root = xmlLoadFile ("players.xml")
      -- local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
      -- if (characterindex) then
        -- local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
        -- local bank = xmlNodeGetAttribute (characterRoot,"bank")
		-- triggerClientEvent (source,"bankadegeri",source,tostring(bank))
		-- end
  -- elseif (buttonname == "carGotoPlayer") then
    -- local gotoPlayer = findPlayerByNametagText (arg1)
    -- if (gotoPlayer) and (getElementType (gotoPlayer) == "player") then
      -- if (getElementDimension(gotoPlayer) == 0) and (getElementInterior (gotoPlayer) == 0) and (isPedInVehicle(source)) and (getElementDimension(source) == 0) and (getElementInterior (source) == 0) then
        -- if (getElementData (gotoPlayer,"gotostate") == true) then
          -- local yourVehicle = getPedOccupiedVehicle (source)
          -- setVehicleFrozen (yourVehicle,true)
          -- fadeCamera (source,false,1.0)
          -- local x,y,z = getElementPosition (gotoPlayer)
          -- setTimer (setElementPosition,1000,1,yourVehicle,x+5,y-5,z)
          -- setTimer (fadeCamera,2500,1,source,true)
          -- setTimer (setVehicleFrozen,2500,1,yourVehicle,false)
        -- else
          -- triggerClientEvent ("lolmodOpenInfoWindow",source,"This player can't be warped because his goto state!\nHis gotostate is: NO!")
        -- end
      -- else
        -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, you can't go to this player, because he isn't in the same dimension or interior as you!")
      -- end
    -- else
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, this player isn't exist any more, he would play on another nametag or left the game.\n\nOr you haven't selected a player.\nPress refresh list for the current version of the list!")
    -- end
  -- elseif (buttonname == "gotoPlayer") then
    -- local gotoPlayer = findPlayerByNametagText (arg1)
    -- if (gotoPlayer) and (getElementType (gotoPlayer) == "player") then
      -- if (getElementData (gotoPlayer,"gotostate") == true) then
        -- setPedFrozen (source,true)
        -- fadeCamera (source,false,1.0)
        -- local x,y,z = getElementPosition (gotoPlayer)
        -- setTimer (setElementPosition,1000,1,source,x+0.75,y+0.75,z)
        -- setTimer (setElementDimension,1000,1,source,getElementDimension(gotoPlayer))
        -- setTimer (setElementInterior,1000,1,source,getElementInterior(gotoPlayer))
        -- setTimer (fadeCamera,2500,1,source,true)
        -- setTimer (setPedFrozen,2500,1,source,false)
      -- else
        -- triggerClientEvent ("lolmodOpenInfoWindow",source,"This player can't be warped because his goto state!\nHis gotostate is: NO!")
      -- end
    -- else
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Sorry, this player isn't exist any more, he would play on another nametag or left the game.\n\nOr you haven't selected a player.\nPress refresh list for the current version of the list!")
    -- end
  -- elseif (buttonname == "ammunationbuy") then
    -- local weaponName = arg1
    -- local weaponAmmo = arg2
    -- local weaponCost = arg3
    -- local weaponID = arg4
    -- if (getPlayerMoney(source) >= tonumber(weaponCost)) then
      -- giveWeapon (source,tonumber(weaponID),tonumber(weaponAmmo),true)
      -- takePlayerMoney (source,tonumber(weaponCost))
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Succesfully bought!\nWeapon:\n  " .. weaponName .. "\n  " .. weaponAmmo .. " ammo\n  " .. weaponCost .. "$\nCome back later.")
    -- else
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Poor guy :<\nYou are too poor to buy this weapon!")
    -- end
  -- elseif (buttonname == "warpToHouse") then
    -- if not (arg1 == "No house Availible") or not (arg1 == "No house bought!") then
      -- if (getPlayerMoney(source) > 249) then
        -- local pickup = getMarkerByHousenumber (arg1)
        -- local x,y,z = getElementPosition (pickup)
        -- takePlayerMoney (source,250)
        -- fadeCamera (source,false,1.0)
        -- setTimer (setElementInterior,1000,1,source,0)
        -- setTimer (setElementPosition,1000,1,source,x,y,z)
        -- setTimer (setElementDimension,1000,1,source,0)
        -- setTimer (fadeCamera,1500,1,source,true,1.0)
      -- else
        -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Poor guy :<\nYou are too poor take a own-home taxi!")
      -- end
    -- else
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"You can try it =D but you are too poor to buy a home ;)\nThat's why we can't teleport you!")
    -- end
	end
  end)
  

-- © JasperNL=D

-- TAXI!
addEvent ("bringPlayerToTaxiDestination",true)
addEventHandler ("bringPlayerToTaxiDestination",getRootElement (),
function(name,cost,x,y,z)
  if not (isPedInVehicle (source)) then
    if (getPlayerMoney(source) >= tonumber(cost)) then
      local vehicle = createVehicle (438,x,y,z,0,0,0,"JASPERNL")
      takePlayerMoney (source,tonumber(cost))
      setVehicleTaxiLightOn (vehicle,true)
      setVehicleLocked (vehicle,true)
      fadeCamera (source,false,1.0)
      setTimer (setElementInterior,1000,1,source,0)
      setTimer (setElementDimension,1000,1,source,0)
      setTimer (warpPedIntoVehicle,1000,1,source,vehicle,1)
      setTimer (fadeCamera,1500,1,source,true,1.0)
      setTimer (setControlState,3000,1,source,"enter_exit",true)
      setTimer (destroyElement,6000,1,vehicle)
    else
      triggerClientEvent ("lolmodOpenInfoWindow",source,"Taking this taxi costs " .. tostring(cost) .."$\nYou've got just " .. tostring (getPlayerMoney(source)) .. "$!")
    end
  else
    triggerClientEvent ("lolmodOpenInfoWindow",source,"Why take a taxi when you're inside a vehicle ?\nthats useless >_<")
  end
end)

-- © JasperNL=D

-- getPedWeapons
function getPedWeapons (player)
  local weapons = {}
  local playerweaponslot = getPedWeaponSlot (player)
  for i=1,11 do
    setPedWeaponSlot (player,i)
    if (getPedWeaponSlot (player) == i) and (getPedWeapon (player)) and (getPedTotalAmmo (player)) then
      weapons[i] = {getPedWeapon (player),getPedTotalAmmo (player)}
    else
      weapons[i] = {0,0}
    end
  end
  if (weapons) then
    return weapons
  else
    return nil
  end
  setPedWeaponSlot (player,playerweaponslot)
end

-- © JasperNL=D

function findPlayerByNametagText (nametag)
  for i,v in ipairs (getElementsByType("player")) do
    if (getPlayerNametagText (v) == nametag) then
      return v
    end
  end
end 


-- addCommandHandler ("nogoto",
-- function(player,command)
  -- setElementData (player,"gotostate",false)
  -- outputChatBox ("Goto state: People can't warp to you!",player,255,0,0,false)
-- end)

-- © JasperNL=D

-- addCommandHandler ("yesgoto",
-- function(player,command)
  -- setElementData (player,"gotostate",true)
  -- outputChatBox ("Goto state: People can warp to you!",player,255,0,0,false)
-- end)

-- addCommandHandler ("commands",
-- function (player,command)
  -- outputChatBox ("Commands",player,255,0,0,false)
  -- outputChatBox ("/nogoto or /yesgoto",player,255,0,0,false)
  -- outputChatBox ("  set your goto state",player,255,0,0,false)
  -- outputChatBox ("/flip - flip your car!",player,255,0,0,false)
-- end)

-- addCommandHandler ("flip",
-- function(player,command)
  -- local rx,ry,rz = getVehicleRotation (getPedOccupiedVehicle (player))
  -- setVehicleRotation (getPedOccupiedVehicle (player),rx -180,ry,rz)
-- end)

-- © JasperNL=D

-- piratenschip geld en greenzones (rechtstreeks gekopiëerd van funmode_v2
-- addEventHandler ("onResourceStart", getRootElement(), 
-- function()
-- end)

-- addEventHandler ("onColShapeHit", getRootElement(), 
-- function(hitElement, matchingDimension)
  -- if (getElementType (hitElement) == "player") and (getElementID (source) == "greenzoneColshape") then
    -- toggleControl (hitElement, "fire", false)
    -- toggleControl (hitElement, "next_weapon", false)
    -- toggleControl (hitElement, "previous_weapon", false)
    -- toggleControl (hitElement, "aim_weapon", false)
    -- toggleControl (hitElement, "vehicle_fire", false)
    -- showPlayerHudComponent (hitElement, "ammo", false)
    -- showPlayerHudComponent (hitElement, "weapon", false)
    -- triggerClientEvent (hitElement, "enableGodMode", hitElement)
  -- end
  -- if (source == moneyZoneCol) and (getElementType (hitElement) == "vehicle") then
    -- setElementVelocity (hitElement, 0, 0, 0)
    -- setElementPosition (hitElement, 2018.33, 1534.77, 12.37)
    -- setVehicleRotation (hitElement, 0,0,270)
    -- if (getVehicleOccupant (hitElement, 0)) then
      -- triggerClientEvent ("lolmodOpenInfoWindow",source,"Entering the Pirateship area with your car is disabled!\nPlease step out first.")
    -- end
  -- end
-- end)

-- © JasperNL=D

-- addEventHandler ("onColShapeLeave", getRootElement(), 
-- function(leaveElement, matchingDimension)
  -- if (getElementType (leaveElement) == "player") and (getElementID (source) == "greenzoneColshape") then
    -- toggleControl (leaveElement, "fire", true)
    -- toggleControl (leaveElement, "next_weapon", true)
    -- toggleControl (leaveElement, "previous_weapon", true)
    -- toggleControl (leaveElement, "aim_weapon", true)
    -- toggleControl (leaveElement, "vehicle_fire", true)
    -- showPlayerHudComponent (leaveElement, "ammo", true)
    -- showPlayerHudComponent (leaveElement, "weapon", true)
    -- triggerClientEvent (leaveElement, "disableGodMode", leaveElement)
  -- end
-- end)
-- moneyZoneCol = createColCuboid (1993.12, 1519.14, -100, 17.43, 54.24, 117)

-- function moneyZoneTimerFunction ()
  -- local allPlayersInCol = getElementsWithinColShape (moneyZoneCol, "player")
  -- for i,v in ipairs (allPlayersInCol) do
    -- givePlayerMoney (v, 5)
  -- end
-- end

-- einde greenzones script

-- © JasperNL=D

-- Home system
function loadAllHouses ()
  local root = xmlLoadFile ("homes.xml")
  local houseroot = xmlFindChild (root,"houses",0)
  if (houseroot) then
    allHouses = {}
    for i,v in ipairs (xmlNodeGetChildren(houseroot)) do
      local x = xmlNodeGetAttribute (v,"x")
      local y = xmlNodeGetAttribute (v,"y")
      local z = xmlNodeGetAttribute (v,"z")
      local number = xmlNodeGetAttribute (v,"num")
      if not (xmlNodeGetAttribute (v,"owner") == "") then
        local marker = createPickup (tonumber(x),tonumber(y),tonumber(z),3,1272,100)
        setElementData (marker,"housenumber",tonumber(number))
      else
        local marker = createPickup (tonumber(x),tonumber(y),tonumber(z),3,1273,100)
        setElementData (marker,"housenumber",tonumber(number))
      end
      outputDebugString ("House " .. tostring(number) .. " loaded!")
    end
  end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()), loadAllHouses)

-- © JasperNL=D

addEventHandler ("onPickupUse",getRootElement(),
function(hitElement)
  if (getElementType (hitElement) == "player") and not (isPedInVehicle (hitElement)) then
    if (getElementData (source,"housenumber")) then
      local housenumber = getElementData (source,"housenumber")
      local root = xmlLoadFile ("homes.xml")
      local houseHeadRootNode = xmlFindChild (root,"houses",0)
      local houseRootNode = xmlFindChild (houseHeadRootNode,"house",tonumber(housenumber))
      if (tostring(xmlNodeGetAttribute (houseRootNode,"owner")) == "") then
        triggerClientEvent (hitElement,"viewHouseGUIwindow",hitElement,"Sahipsiz!",tostring(xmlNodeGetAttribute (houseRootNode,"cost")),housenumber)
        xmlUnloadFile (root)
      else
        triggerClientEvent (hitElement,"viewHouseGUIwindow",hitElement,tostring(xmlNodeGetAttribute (houseRootNode,"owner")),tostring(xmlNodeGetAttribute (houseRootNode,"cost")),housenumber)
        xmlUnloadFile (root)
      end
    end
  end
end)

-- © JasperNL=D

addEvent("HouseSystemEnterHouse",true)
addEvent("HouseSystemBuyHouse",true)
addEvent("HouseSystemSellHouse",true)
addEvent("HouseSystemLeaveHouse",true)
addEvent("HouseSystemLockHouse",true)

addEventHandler ("HouseSystemLockHouse",getRootElement(),
function(nextLockState)
  local charactername = getPlayerNametagText (source)
  local accountName = getAccountName(getPlayerAccount(source))
  local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
  local root = xmlLoadFile ("players.xml")
  local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
  if (characterindex) then
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    local housenumber = xmlNodeGetAttribute (characterRoot,"house")
    local houseroot = xmlLoadFile ("homes.xml")
    local houseHeadRootNode = xmlFindChild (houseroot,"houses",0)
    local houseRootNode = xmlFindChild (houseHeadRootNode,"house",tonumber(housenumber))  
    xmlNodeSetAttribute (houseRootNode,"lockstate",nextLockState)
    --outputChatBox ("The house is " .. nextLockState .. "ed!",source,255,0,0,false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Evin ".. nextLockState .."ed!")
    xmlSaveFile (houseroot)
    xmlUnloadFile (houseroot)
    xmlUnloadFile (root)
  end
end)

-- © JasperNL=D

addEventHandler ("HouseSystemBuyHouse", getRootElement(),
function(housenumber)
  if not (isGuestAccount (getPlayerAccount(source))) then
    local charactername = getPlayerNametagText (source)
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
    if (characterindex) then
      local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
      if (xmlNodeGetAttribute (characterRoot,"house") == false) or (xmlNodeGetAttribute (characterRoot,"house") == "") then
        local houseroot = xmlLoadFile ("homes.xml")
        local houseHeadRootNode = xmlFindChild (houseroot,"houses",0)
        local houseRootNode = xmlFindChild (houseHeadRootNode,"house",tonumber(housenumber))  
        local price = xmlNodeGetAttribute (houseRootNode,"cost")
        local owner = xmlNodeGetAttribute (houseRootNode,"owner")
        if (owner == "") and (getPlayerMoney (source) >= tonumber(price)) then
          takePlayerMoney (source,tonumber(price))
          xmlNodeSetAttribute (houseRootNode,"owner",getPlayerNametagText(source))
          -- outputChatBox ("Congratulations, you are the new owner!",source,255,0,0,false)
          -- outputChatBox ("Price: ".. tostring(price) .. "$!",source,255,0,0,false)
		  triggerClientEvent ("lolmodOpenInfoWindow",source,"Tebrikler bu evin yeni sahibisin!\nUcret: ".. tostring(price) .." TL!")
          setPickupType (getMarkerByHousenumber(housenumber),3,1272)
          xmlNodeSetAttribute (characterRoot,"house",tostring(housenumber))
          triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,nil,nil,housenumber)
          xmlSaveFile (houseroot)
          xmlSaveFile (root)
        elseif not (owner == "") then
          -- outputChatBox ("Sorry, This house is already bought!",source,255,0,0,false)
		  triggerClientEvent ("lolmodOpenInfoWindow",source,"HATA!Bu ev senin degil!")
        elseif (getPlayerMoney (source) < tonumber(price)) then
          --outputChatBox ("Sorry, you are too poor!",source,255,0,0,false)
		  triggerClientEvent ("lolmodOpenInfoWindow",source,"Uzgunuz,cok fakirsin!")
        end
        triggerClientEvent (source,"hideHouseGuiWindow",source)
        xmlUnloadFile (houseroot)  
      else
        --outputChatBox ("Sorry, the house-limit is 1 house! Sell your old one first before buying a new one!",source,255,0,0,false)
		triggerClientEvent ("lolmodOpenInfoWindow",source,"Uzgunum,en fazla 1 ev alabilirsiniz.\nDigerini sat yeni birisini al!")
      end
      xmlUnloadFile (root)
    end
  end
end)

addEventHandler ("HouseSystemSellHouse", getRootElement(),
function(housenumber)
  local houseroot = xmlLoadFile ("homes.xml")
  local houseHeadRootNode = xmlFindChild (houseroot,"houses",0)
  local houseRootNode = xmlFindChild (houseHeadRootNode,"house",tonumber(housenumber))  
  local price = xmlNodeGetAttribute (houseRootNode,"cost")
  local owner = xmlNodeGetAttribute (houseRootNode,"owner")
  if not (isGuestAccount (getPlayerAccount(source))) then
    if (owner == getPlayerNametagText(source)) then
    local charactername = getPlayerNametagText (source)
    local accountName = getAccountName(getPlayerAccount(source))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName(accountName))
      if (characterindex) then
        local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
        if (xmlNodeGetAttribute (characterRoot,"house")) then
          xmlNodeSetAttribute (characterRoot,"house","")
        end
        triggerClientEvent (source,"lolmodRefreshBankInfoMenu",source,nil,nil,"No house bought!")
        givePlayerMoney (source,tonumber(price)/2)
        xmlNodeSetAttribute (houseRootNode,"owner","")
        -- outputChatBox ("Congratulations, you have sold the home!",source,255,0,0,false)
        -- outputChatBox ("Obtain: ".. tostring(price)/2 .. "$!",source,255,0,0,false)
		triggerClientEvent ("lolmodOpenInfoWindow",source,"Basarili!,evin satildi\nVerilen ucret: ".. tostring(price)-50000 .. " TL!")
        setPickupType (getMarkerByHousenumber(housenumber),3,1273)
        xmlSaveFile (houseroot)
        xmlSaveFile (root)
      elseif not (owner == getPlayerNametagText(source)) then
        --outputChatBox ("This isn't your house!",source,255,0,0,false)
		triggerClientEvent ("lolmodOpenInfoWindow",source,"Senin evin degil!")
      end
    xmlUnloadFile (root)
    end
  else
    -- outputChatBox ("Please log in!",source,255,0,0,false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Giris yap")
  end
  triggerClientEvent (source,"hideHouseGuiWindow",source)
  xmlUnloadFile (houseroot)  
end)

-- © JasperNL=D

addEventHandler ("HouseSystemEnterHouse",getRootElement(),
function(housenumber)
  local root = xmlLoadFile ("homes.xml")
  local houseHeadRootNode = xmlFindChild (root,"houses",0)
  local houseRootNode = xmlFindChild (houseHeadRootNode,"house",tonumber(housenumber))  
  local x,y,z = getElementPosition (source)
  if (xmlNodeGetAttribute (houseRootNode,"owner") == "") then
    setElementData (source,"posx",x)
    setElementData (source,"posy",y)
    setElementData (source,"posz",z)
    local interiornumber = xmlNodeGetAttribute (houseRootNode,"interior")
    local interiorRootNode = xmlFindChild (xmlFindChild (root,"interiors",0),"interior",tonumber(interiornumber))  
    setElementInterior (source,tonumber(xmlNodeGetAttribute (interiorRootNode,"id")),tonumber(xmlNodeGetAttribute (interiorRootNode,"x")),tonumber(xmlNodeGetAttribute (interiorRootNode,"y")),tonumber(xmlNodeGetAttribute (interiorRootNode,"z")))
    setElementDimension (source,xmlNodeGetAttribute(houseRootNode,"dim"))
    -- outputChatBox ("Welcome! This house isn't bought yet!",source,255,0,0,false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Hosgeldin,Ev senin degikl kurcalama!")
    triggerClientEvent (source,"enterHouseOpenGuiWindow",source,"unsold")
  elseif (getPlayerNametagText(source) == xmlNodeGetAttribute (houseRootNode,"owner")) then
    setElementData (source,"posx",x)
    setElementData (source,"posy",y)
    setElementData (source,"posz",z)
    local interiornumber = xmlNodeGetAttribute (houseRootNode,"interior")
    local interiorRootNode = xmlFindChild (xmlFindChild (root,"interiors",0),"interior",tonumber(interiornumber))  
    setElementInterior (source,tonumber(xmlNodeGetAttribute (interiorRootNode,"id")),tonumber(xmlNodeGetAttribute (interiorRootNode,"x")),tonumber(xmlNodeGetAttribute (interiorRootNode,"y")),tonumber(xmlNodeGetAttribute (interiorRootNode,"z")))
    setElementDimension (source,xmlNodeGetAttribute(houseRootNode,"dim"))
    -- outputChatBox ("Welcome to your house!",source,255,0,0,false)
	triggerClientEvent ("lolmodOpenInfoWindow",source,"Evine hosgeldin!")
    local lockstate = xmlNodeGetAttribute (houseRootNode,"lockstate")
    if (lockstate) then
      triggerClientEvent (source,"enterHouseOpenGuiWindow",source,lockstate)
    else
      xmlNodeSetAttribute (houseRootNode,"lockstate","lock")
      triggerClientEvent (source,"enterHouseOpenGuiWindow",source,"lock")
    end
  elseif not (getPlayerNametagText(source) == xmlNodeGetAttribute (houseRootNode,"owner")) then
    local lockstate = xmlNodeGetAttribute (houseRootNode,"lockstate")
    if (lockstate == "lock") then
      -- outputChatBox ("You aren't the owner of this home!",source,255,0,0,false)
	  triggerClientEvent ("lolmodOpenInfoWindow",source,"Bu evin sahibi degilsin.")
      triggerClientEvent (source,"hideHouseGuiWindow",source)
    elseif (lockstate == "unlock") then
      setElementData (source,"posx",x)
      setElementData (source,"posy",y)
      setElementData (source,"posz",z)
      local interiornumber = xmlNodeGetAttribute (houseRootNode,"interior")
      local interiorRootNode = xmlFindChild (xmlFindChild (root,"interiors",0),"interior",tonumber(interiornumber))  
      setElementInterior (source,tonumber(xmlNodeGetAttribute (interiorRootNode,"id")),tonumber(xmlNodeGetAttribute (interiorRootNode,"x")),tonumber(xmlNodeGetAttribute (interiorRootNode,"y")),tonumber(xmlNodeGetAttribute (interiorRootNode,"z")))
      setElementDimension (source,xmlNodeGetAttribute(houseRootNode,"dim"))
      -- outputChatBox ("Welcome!",source,255,0,0,false)
      triggerClientEvent (source,"enterHouseOpenGuiWindow",source,"unsold")
    end
  end
  xmlUnloadFile (root)
end)

-- © JasperNL=D

addEventHandler ("HouseSystemLeaveHouse",getRootElement(),
function()
  if (getElementInterior (source) ~= 0) and (getElementData (source,"posx")) and (getElementData (source,"posy")) and (getElementData (source,"posz")) then
    setElementPosition (source,getElementData (source,"posx"),getElementData (source,"posy"),getElementData (source,"posz"))
    setElementInterior (source,0)
    setElementDimension (source,0)
    removeElementData (source,"posx")
    removeElementData (source,"posy")
    removeElementData (source,"posz")
  end
end)

-- © JasperNL=D

addCommandHandler ("createhouse",
function(thePlayer,command,interiorid,dimension,price)
  if (interiorid) and (dimension) and (price) and (not isPedInVehicle(thePlayer)) then
    if (hasObjectPermissionTo (thePlayer,"command.aexec",false)) then
      local x,y,z = getElementPosition (thePlayer)
      local houseCount = tonumber(getHouseCount())
      local root = xmlLoadFile ("homes.xml")
      local housesRoot = xmlFindChild (root,"houses",0)
      local newHouse = xmlCreateChild (housesRoot,"house")
      xmlNodeSetAttribute (newHouse,"num",houseCount)
      xmlNodeSetAttribute (newHouse,"interior",interiorid)
      xmlNodeSetAttribute (newHouse,"x",x)
      xmlNodeSetAttribute (newHouse,"y",y)
      xmlNodeSetAttribute (newHouse,"z",z)
      xmlNodeSetAttribute (newHouse,"cost",price)
      xmlNodeSetAttribute (newHouse,"owner","")
      xmlNodeSetAttribute (newHouse,"dim",dimension) 
      outputChatBox ("The house will appear when you restart the resource!",thePlayer,255,0,0,false)  
      xmlSaveFile (root)   
      xmlUnloadFile (root)   
    else
      outputChatBox ("Admin only!",thePlayer,255,0,0,false)
    end
  else
    outputChatBox ("Wrong syntax, or get out of your vehicle!",thePlayer,255,0,0,false)
    outputChatBox ("SYNTAX: /createhouse [interior ID] [Dimension] [price in $]",thePlayer,255,0,0,false)
    outputChatBox (" Interior ID - standard 0-21 - the standard houses.",thePlayer,255,0,0,false)
    outputChatBox (" Dimension - number between 0 and 65535, always take another each interior!",thePlayer,255,0,0,false)
    outputChatBox (" Price - How much does the home cost?",thePlayer,255,0,0,false)
  end
end)

-- © JasperNL=D

function getHouseCount ()
  local root = xmlLoadFile ("homes.xml")
  local housesRoot = xmlFindChild (root,"houses",0)
  local allHouses = xmlNodeGetChildren (housesRoot)
  houses = 0
  for i,v in ipairs (allHouses) do
    houses = houses+1
  end
  xmlUnloadFile (root)
  return houses
end 

function getMarkerByHousenumber (housenumber)
  for i,v in ipairs (getElementsByType("pickup")) do
    if (getElementData (v,"housenumber") == tonumber(housenumber)) then
      return v
    end
  end
end


-- einde homesystem

-- © JasperNL=D

-- Car System
missionMarker = createMarker (-1947.10,266.23,34.47,"cylinder",1,255,0,0,127,getRootElement())

addEventHandler ("onMarkerHit",getRootElement(),
function(hitElement)
  if (source == missionMarker) and (getElementType(hitElement) == "player") then
    local charactername = getPlayerNametagText (hitElement)
    local accountName = getAccountName(getPlayerAccount(hitElement))
    local characterindex = getCharacterIndexByCharacterName (accountName,charactername)
    local root = xmlLoadFile ("players.xml")
    local playerRoot = xmlFindChild (root,"player",findPlayerIndexByName (tostring(accountName)))  
    local characterRoot = xmlNodeGetChildren (playerRoot,tonumber(characterindex)-1)
    if (characterRoot) then
      local lastmission = xmlNodeGetAttribute (characterRoot,"lastmission")
      if (lastmission) then
        startCarMission (tonumber(lastmission)+1)
      else
        startCarMission (0)
      end
    end
    xmlUnloadFile (root)
  end
end)

-- © JasperNL=D

function startCarMission (number)
  local root = xmlLoadFile ("carmissions.xml")
  local missionroot = xmlFindChild (root,"mission",number)
  local misAtt = xmlNodeGetAttributes (missionroot)
  local title = misAtt["title"]
  local x = tonumber(misAtt["x"])
  local y = tonumber(misAtt["y"])
  local z = tonumber(misAtt["z"])
  local time = tonumber(misAtt["time"])
  local description = xmlNodeGetValue (missionroot)
  xmlUnloadFile (root)
end 

-- Animasyon Server-Side
-- function anim ( thePlayer, block, anim )
   -- setPedAnimation ( thePlayer, block, anim, 0, true, true, true )
-- end
-- addEvent("animaatio", true )
-- addEventHandler("animaatio",getRootElement(), anim)


-- Araba Getirme

addEvent ("getirt", true)

function carSpawn ()
  if not (isGuestAccount (getPlayerAccount (source))) and not (isPedInVehicle(source)) then
    if (getElementData (source, "hisCar")) and (getElementData (source, "hisCar") ~= nil)  then --and (getElementType(getElementData (source, "hisCar")) == "vehicle")
      setElementVelocity (getElementData (source, "hisCar"), 0,0,0)
      local x,y,z = getElementPosition (source)
      setVehicleRotation (getElementData (source, "hisCar"), 0, 0, 0)
      setElementPosition (getElementData (source, "hisCar"), x+2,y,z +1)
      --outputChatBox ("Car spawned.", source, 255, 0, 0)
    elseif not (getElementData (source, "hisCar")) then
      local accountData = getAccountData (getPlayerAccount (source), "arabasi")
      if (accountData) then
        local carID = getAccountData (getPlayerAccount (source), "arabasi")
        local x,y,z = getElementPosition (source)
        local vehicle = createVehicle (carID, x +2, y, z +1)
        setElementID (vehicle, getAccountName (getPlayerAccount(source)))
        setElementData (source, "hisCar", vehicle)
        --outputChatBox ("Car spawned.", source, 255, 0, 0)
        if (getAccountData (getPlayerAccount(source), "modifiye")) then
          local upgrades = nil
          local upgrades = {}
          local upgrades = getAccountData (getPlayerAccount(source), "modifiye")
          for i,v in ipairs (upgrades) do
            addVehicleUpgrade (vehicle, v)
          end
        end
        if (getAccountData (getPlayerAccount(source), "paintjob")) then
          local paintjob = getAccountData (getPlayerAccount(source), "paintjob")
          setVehiclePaintjob (vehicle, paintjob)
        end
        if (getAccountData (getPlayerAccount(source), "arabasicolor1")) and (getAccountData (getPlayerAccount(source), "arabasicolor2")) then
          local c1 = getAccountData (getPlayerAccount(source), "arabasicolor1")
          local c2 = getAccountData (getPlayerAccount(source), "arabasicolor2")
          setVehicleColor (vehicle, c1,c2,0,0)
        end
      else
        -- outputChatBox ("You haven't got a car.", source, 255, 0, 0)
		triggerClientEvent ("lolmodOpenInfoWindow",source,"Maalesef bir aracin yok!")
      end 
    else
		--fixVehicle (vehicle)
     -- outputChatBox ("You're already in a car!", source, 255, 0, 0)
    end
  end
end
addEventHandler ("getirt", getRootElement(), carSpawn)
