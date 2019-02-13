
local gPlayerTickCount = { }
local gPlayerSpams = { }
local gPlayerMessage = { }
local gPlayerMsgNum = { }
local gPlayerMuteTimer = { }

local gSettings = { }

addEventHandler( "onPlayerChat", getRootElement( ),
    function( message )
        if not gPlayerSpams[ source ] then
			gPlayerSpams[ source ] = true
			gPlayerTickCount[ source ] = getTickCount( )
            gPlayerMessage[ source ] = message
        else
			if getTickCount( ) - gPlayerTickCount[ source ] > gSettings.delay then
				gPlayerMsgNum[ source ] = 0
				gPlayerMessage[ source ] = nil;
				gPlayerTickCount[ source ] = getTickCount( )
				return
			else
				if gPlayerMsgNum[ source ] >= gSettings.msgNum then
					gPlayerTickCount[ source ] = getTickCount( )
					cancelEvent( )
					if gSettings.mutePlayers then
						mutePlayer( source );
					end
				elseif message == gPlayerMessage[ source ] then
					cancelEvent( )
					--outputChatBox( "L�tfen flood yapma!!!", source, 255, 0, 0 )
				end
				gPlayerMsgNum[ source ] = gPlayerMsgNum[ source ] + 1
			end
        end
		gPlayerMessage[ source ] = message
    end
)

function mutePlayer( player )
	setPlayerMuted( player, true );
	gPlayerMuteTimer[ player ] = setTimer( unmutePlayer, gSettings.muteTime * 1000, 1, player );
	outputChatBox( "Flood yapt���n i�in " .. gSettings.muteTime .." saniye mutelendin!.", player, 255, 0, 0 )
end

function unmutePlayer( player )
	setPlayerMuted( player, false );
	outputChatBox( "Tekrar konu�abilirsin.Ancak bir daha flood yaparsan kicklenirsin!", player, 255, 0, 0 );
end

addEventHandler( "onPlayerJoin", getRootElement( ),
	function( )
		gPlayerMsgNum[ source ] = 0
	end
)

addEventHandler( "onResourceStart", getResourceRootElement( getThisResource() ),
    function( )
        gSettings.delay = get( "@differenceBetweenMessages_ms" )
		gSettings.msgNum = get( "@messagesNumber" )
		gSettings.mutePlayers = ( get( "@mutePlayers" ) == "true" ) and true or false;
		gSettings.muteTime = get( "@muteTime" );
		for _, plr in pairs( getElementsByType( "player" ) ) do
			gPlayerMsgNum[ plr ] = 0
		end
    end
)

addEventHandler( "onResourceStop", getResourceRootElement(),
	function( )
		local players = getElementsByType( "player" );
		for i, plr in pairs( players ) do
			if isPlayerMuted( plr ) then
				setPlayerMuted( plr, false );
			end
		end
	end
)

