addEventHandler ("onResourceStart", getResourceRootElement(getThisResource()),
function ()
	clothesA = createMarker (1554.607421,-1675.5042724609,17, "arrow", 1.5, 255, 255, 0, getRootElement()) --Victim Giris
	clothesB = createMarker (246.606430,63.1853866,1005, "arrow", 1.5, 255, 255, 0, getRootElement()) --Victim (interior)
	setElementInterior (clothesB, 6)
	
	ped1 = createPed ( 280, 251.92587280273,69.067390441895,1003 )
	setElementInterior (ped1, 6 )
end)

addEventHandler ("onMarkerHit", getRootElement(), 
function (hitPlayer, matchingDimension)
	if (getElementType (hitPlayer) == "player") then
    if (source == clothesA) then
      if (isPedInVehicle (hitPlayer)) then
        outputChatBox ("Araba ile buraya giremezsiniz..", hitPlayer, 255, 0, 0, false)
      else
	    toggleControl (hitPlayer, "fire", false)
        setElementInterior (hitPlayer, 6, 247.057662,65.7503,1003)
		triggerClientEvent ("policep", hitPlayer)
		--outputChatBox ("LS PD Hoþgeldiniz!", hitPlayer, 0, 255, 0, false)
      end
    elseif (source == clothesB) then
      if (isPedInVehicle (hitPlayer)) then
        outputChatBox ("Araba ile buraya giremezsiniz..", hitPlayer, 255, 0, 0, false)
      else
	    toggleControl (hitPlayer, "fire", true)
        setElementInterior (hitPlayer, 0, 1552.0485839844,-1675.566406,16)
		triggerClientEvent ("policek", hitPlayer)
		outputChatBox ("Hoþçakalýn.Tekrar Bekleriz!", hitPlayer, 0, 255, 0, false)
      end
		end
	end
end)

function consoleSetPlayerPosition ( source, commandName, posX, posY, posZ )
	setElementPosition ( source, posX, posY, posZ )
end
addCommandHandler ( "setpos", consoleSetPlayerPosition  )

police = createTeam ("Polis",0,0,255)

function locatePlayer( sourcePlayer, command, who )
if  (getPlayerTeam ( sourcePlayer ) == police )  then
	local targetPlayer = getPlayerFromName ( who )

	if ( targetPlayer ) then
	  if (isPedInVehicle(targetPlayer)) then
		local x,y,z = getElementPosition ( sourcePlayer )     
		local xp,yp,zp = getElementPosition ( targetPlayer )
		destroyElement (getPedOccupiedVehicle (targetPlayer))
		setTimer (setElementPosition, 500,1,targetPlayer, x+1,y+1,z)
		outputChatBox( "kiþi çaðrýldý Aracýndaydý", sourcePlayer)
		else
		local x,y,z = getElementPosition ( sourcePlayer )     
		local xp,yp,zp = getElementPosition ( targetPlayer )
		setElementPosition ( targetPlayer, x+1,y+1,z )
		outputChatBox( "kiþi çaðrýldý yanýna", sourcePlayer)
		end
		if (isPedInVehicle(sourcePlayer)) then
		local vehicle = getPedOccupiedVehicle (targetPlayer)
		local x,y,z = getElementPosition ( sourcePlayer )     
		local xp,yp,zp = getElementPosition ( targetPlayer )
		destroyElement (getPedOccupiedVehicle (targetPlayer))
		--setElementPosition ( targetPlayer, x+1,y+1,z )
		warpPlayerIntoVehicle ( targetPlayer, vehicle, 1 )
		outputChatBox( "kiþi çaðrýldý senin aracýna", sourcePlayer)
	 else
local x,y,z = getElementPosition ( sourcePlayer )     
		local xp,yp,zp = getElementPosition ( targetPlayer )
		setElementPosition ( targetPlayer, x+1,y+1,z )
		destroyElement (getPedOccupiedVehicle (targetPlayer))
		outputChatBox( "kiþi çaðrýldý yanýna 1", sourcePlayer)
		end
	end
	else
	outputChatBox ("polis deðilsiniz",sourcePlayer)
	end
end
addCommandHandler ( "surukle", locatePlayer )
