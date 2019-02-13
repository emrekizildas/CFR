function karakters ( thePlayer )
 if  getPlayerName(thePlayer) == Cavorta  then
setPlayerName ( thePlayer, Uncas_Wolf )
spawnPlayer ( thePlayer, 0, 0, 0 )
 end
end
addEventHandler ("onPlayerJoin", getRootElement(), karakters )