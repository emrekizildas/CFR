function kicked()
	local x,y = guiGetScreenSize()
	if ( x >= 801 ) and ( y >= 601 ) then
	triggerServerEvent ( "kicked", getLocalPlayer())
   end
end
addEventHandler("onClientPlayerJoin", getRootElement(), kicked)