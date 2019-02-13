addEventHandler('onClientResourceStart', resourceRoot, function(res)
	if res == getThisResource() then
		setGarageOpen(8,true)
		setGarageOpen(11,true)
		setGarageOpen(12,true)
		setGarageOpen(19,true)
		setGarageOpen(27,true)
		setGarageOpen(32,true)
		setGarageOpen(36,true)
		setGarageOpen(40,true)
		setGarageOpen(41,true)
		setGarageOpen(47,true)
	end
end)