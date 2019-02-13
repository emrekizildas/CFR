function lockcar ( thePlayer )
    playervehicle = getPedOccupiedVehicle ( thePlayer )   -- define 'playervehicle' as the vehicle the player is in
    if ( playervehicle ) then                                -- if a player is in a vehicle
        if isVehicleLocked ( playervehicle ) then            -- and if the vehicle is already locked
            setVehicleLocked ( playervehicle, false )			-- unlock it
			--outputChatBox ("Araba kilidi açýldý..",thePlayer,0,255,0)
        else                                                 -- otherwise (if it isn't locked) 
            setVehicleLocked ( playervehicle, true )			-- lock it
			--outputChatBox ("Araba kilitlendi.",thePlayer,255,0,0)
        end
    end
end
 
function bindLockOnSpawn ( theSpawnpoint )                     -- when a player spawns
    bindKey ( source, "o", "down", "Lock car", lockcar )     -- bind the 'l' key to the 'lockcar' function
end
--addEventHandler ( "onPlayerSpawn", getRootElement(), bindLockOnSpawn )