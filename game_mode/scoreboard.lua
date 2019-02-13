function showKills ( option )
	if option == false then
		-- Remove the "kills" column
		gameShowKills = false
		call(getResourceFromName("scoreboard"), "removeScoreboardColumn", "kills")
	else
		-- Add the "kills" column
		gameShowKills = true
		call(getResourceFromName("scoreboard"), "addScoreboardColumn", "kills")
		outputDebugString ( "Showing kills now..." )
	end
end