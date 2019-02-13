function rangedMessage(thePlayer, message, chatRadius) -- This is a custom function should you wish to use it in your script which sends a message to players within a certain distance of a player.
		local posX, posY, posZ = getElementPosition( thePlayer ) -- find the player's position
		local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) -- make a collision sphere at that position with the radius specified by chatRadius
		local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) -- get a table all player elements inside the colSphere
		destroyElement( chatSphere ) -- delete the redundant colSphere
		for index, nearbyPlayer in ipairs( nearbyPlayers ) do -- deliver the message to each player in that table
			outputChatBox( message, nearbyPlayer,200,200,200 )
		end
	end
	
function rangedChat( message, messageType)
		local playerName = getPlayerNametagText(source) -- get the player's name
		local r,g,b = getPlayerNametagColor (source)
		local posX, posY, posZ = getElementPosition( source )
		local global = string.find(message, "#", 1, true)
		local cancel = string.find(message, ".", 1, true)
		local shouted = string.find(message, "!", 1, true) -- check if it has a ! in it
		local asked = string.find(message, "?", 1, true) -- check if it has a ? in it
		local ooc, ooc1 = string.find(message, "))", 1, true), string.find(message, "((", 1, true) -- check if it has a ) in it and check if the first item in the table has a ( in it
		if messageType == 0 then -- If it's normal chat (i.e. not PM or team)
			if global then
				local players = getElementsByType("player")
				message = string.gsub(message, "#", "")
				for index, player in ipairs ( players ) do
					outputChatBox( "[OOC] ".. playerName.. ": " ..message, player, 150, 150, 255)
					--outputConsol( "[OOC] ".. playerName.. ": " ..message)
					end
			elseif cancel then
				local chatRadius = 10
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) 
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere ) 
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					outputChatBox( playerName.." : #9b9ba3" ..message, nearbyPlayer,r,g,b,true )
					--outputConsol( "CHAT"..playerName.." : #9b9ba3" ..message )
				end
			elseif asked then -- does message end with a '?' ? 
				local chatRadius = 12 
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				destroyElement( chatSphere )
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					outputChatBox( playerName.." soruyor: #9b9ba3" ..message, nearbyPlayer,r,g,b,true )
					--outputConsol( "CHAT"..playerName.." soruyor: #9b9ba3" ..message )					
				end
			-- elseif ooc and ooc1 then -- is the message in brackets?
				-- message = string.gsub(message, "%(", "") -- delete the (
				-- message = string.gsub(message, "%)", "") -- and the )
				-- local chatRadius = 12
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.. " (OOC): (( " ..message.. " ))", nearbyPlayer )
				-- end
			elseif shouted then -- if it did have a ! in it then
				local chatRadius = 22 -- the message will be sent to players up to 20 metres away from the player
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) -- make a collision sphere at that position with the radius specified by chatRadius
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) -- get a table of all player elements inside the colSphere
				destroyElement( chatSphere ) -- delete the redundant colSphere
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do -- for each of the nearby players, do this:
					outputChatBox( playerName.." sesleniyor: #9b9ba3" ..message, nearbyPlayer,r,g,b,true )					-- table.concat makes the table into a string, with each item seperated by a space
				    --outputConsol( "CHAT"..playerName.." sesleniyor: #9b9ba3" ..message)
				end
			-- elseif happy or happy1 or happy2 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." gülümsedi.", nearbyPlayer )
				-- end
			-- elseif unhappy or unhappy1 or unhappy2 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." þuan mutsuz.", nearbyPlayer )
				-- end
			-- elseif crying or crying1 or crying2 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." çok üzüldü.", nearbyPlayer )
				-- end
			-- elseif wink or wink1 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." göz kýrptý.", nearbyPlayer )
				-- end
			-- elseif delight or delight1 or delight2 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." memnun oldu.", nearbyPlayer )
				-- end
			-- elseif horror or horror1 or horror2 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." dehþette!", nearbyPlayer )
				-- end
			-- elseif angry or angry1 then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." sinirlendi.", nearbyPlayer )
				-- end
			-- elseif evil then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." kötü kötü sýrýtýyor.", nearbyPlayer )
				-- end
			-- elseif fuming then
				-- local chatRadius = 10 
				-- local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
				-- local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
				-- destroyElement( chatSphere )
				-- for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					-- outputChatBox( playerName.." aþýrý sinirli!", nearbyPlayer )
				-- end
			else -- i.e. it's normal
				local chatRadius = 10
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) 
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere ) 
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					outputChatBox( playerName.." : #9b9ba3" ..message, nearbyPlayer,r,g,b,true )
					--outputConsol( "CHAT"..playerName.." : " ..message )
				end
			end
	-- end
		elseif messageType == 1 then -- if it's /me
			if global then -- if there is a # infront of the text
				local players = getElementsByType("player") -- find all the players in the server
				message = string.gsub(message, "#", "")
				for index, player in ipairs ( players ) do
					outputChatBox( "[OOC] * #9b9ba3".. playerName.. " " ..message, player, 150, 150, 255,true)
					--outputConsol( "[OOC] * ".. playerName.. " " ..message)
				end
			else
				local chatRadius = 10
				local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) 
				local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
				destroyElement( chatSphere ) 
				for index, nearbyPlayer in ipairs( nearbyPlayers ) do 
					outputChatBox( "* " ..playerName.." #9b9ba3" ..message, nearbyPlayer,r,g,b,true )
					--outputConsol( "[ME]* " ..playerName.." " ..message)
				end
			end
		elseif messageType == 2 then -- If it's team chat
			local playerTeam = getPlayerTeam(source) -- Find what team the player is
			local teamMates = getPlayersInTeam( playerTeam ) -- Find his team mates
			for index, teamMate in ipairs( teamMates ) do -- For each of his team mates, do this:
				if shouted then
					outputChatBox( "[TAKIM] " ..playerName.. " sesleniyor: #9b9ba3" ..message, teamMate, 150, 255, 150,true )
					
				elseif asked then
					outputChatBox( "[TAKIM] " ..playerName.. " soruyor: #9b9ba3" ..message, teamMate, 150, 255, 150,true )
				elseif ooc and ooc1 then
					message = string.gsub(message, "%(", "") -- find and delete all the brackets
					message = string.gsub(message, "%)", "") -- '' ''
					outputChatBox( "(([TAKIM] " ..playerName.. "  (OOC): #9b9ba3" ..message.. "))", teamMate, 150, 255, 150,true )
				else
					outputChatBox( "[TAKIM] " ..playerName.. " : #9b9ba3" ..message, teamMate, 150, 255, 150,true )
				end
 end
end
end



function publicChat (thePlayer, commandName, ...)
		local players = getElementsByType("player")
		local playerName = getPlayerNametagText ( thePlayer )
		local chatContent = {...}
		for index, player in ipairs ( players ) do
			outputChatBox( "(( [OOC] ".. playerName.. ": " ..table.concat ( chatContent, " ").. " ))", player, 150, 150, 255,true)
		end
	end
addCommandHandler ("b", publicChat )


function blockChatMessage(message, messageType)
		cancelEvent()
	end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage)
addEventHandler( "onPlayerChat", getRootElement(), rangedChat )
addEventHandler ( "onConsole", getRootElement(), rangedChat )
addEventHandler ( "onConsole", getRootElement(), blockChatMessage )