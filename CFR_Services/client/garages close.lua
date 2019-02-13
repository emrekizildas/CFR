addEventHandler( "onClientResourceStop", getRootElement(), function(res)
	if res == getThisResource() then
		setGarageOpen(8,false)
		setGarageOpen(11,false)
		setGarageOpen(12,false)
		setGarageOpen(19,false)
		setGarageOpen(27,false)
		setGarageOpen(32,false)
		setGarageOpen(36,false)
		setGarageOpen(40,false)
		setGarageOpen(41,false)
		setGarageOpen(47,false)
		--outputChatBox( "Pay & Spray Garajlarý kapandý")
	end
end);