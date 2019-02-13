-- PlayerCamera = {}

-- function mycommand1(player,commandName)
	-- PlayerCamera[player] = 1
	-- outputChatBox("Mode of changing camera position's has started.",player,0,100,200)
	-- outputChatBox("Change position of camera -  W/A/S/D/Q/E.",player,0,100,200)
	-- outputChatBox("Remove camera mode - left shift.",player,0,100,200)
	-- outputChatBox("Save a position of camera - right shift.",player,0,100,200)
	-- showPlayerHudComponent ( player, "ammo", false)
	-- showPlayerHudComponent ( player, "area_name", false)
	-- showPlayerHudComponent ( player, "armour", false)
	-- showPlayerHudComponent ( player, "breath", false)
	-- showPlayerHudComponent ( player, "clock", false)
	-- showPlayerHudComponent ( player, "health", false)
	-- showPlayerHudComponent ( player, "money", false)
	-- showPlayerHudComponent ( player, "radar", false)
	-- showPlayerHudComponent ( player, "vehicle_name", false)
	-- showPlayerHudComponent ( player, "weapon", false)
	-- bindKey ( player, "a", "up", func2 ) 
	-- bindKey ( player, "d", "up", func2 ) 
	-- bindKey ( player, "w", "up", func2 ) 
	-- bindKey ( player, "s", "up", func2 ) 
	-- bindKey ( player, "q", "up", func2 ) 
	-- bindKey ( player, "e", "up", func2 ) 
	-- bindKey ( player, "lshift", "up", func2 ) 
	-- bindKey ( player, "rshift", "up", func2 ) 
	-- local x,y,z = getElementPosition(player)
	-- setCameraMatrix ( player, x+5,y,z , x,y,z, 0, 70  )
	-- toggleAllControls ( player, false)
	-- setElementAlpha(player,0)
-- end

-- addCommandHandler("setcamera",mycommand1)

function func2(player)
			local hFile = fileOpen("sayi.txt")
			if( hFile ) then
				local text = fileRead ( hFile, 1 )
				local number = tonumber(text) + 1
				local text2 = ""..number..""
				fileClose(hFile)
				local hFile = fileOpen("sayi.txt")
				fileWrite(hFile, text2)
				fileClose(hFile)
				local x,y,z = getElementPosition (player)
				--local rotetion = getPedRotation ( player )
				local interior =  getElementInterior(player)
				local hFile2 = fileCreate("/save files/"..text..".txt")
				fileWrite(hFile2,"Pozisyon: "..x..","..y..","..z..",0,0,"..getPedRotation ( player ).."  Interior ID:"..tonumber(interior).." ")
				fileClose(hFile2)
				outputChatBox("Þuanki pozisyonun "..text..".txt dosyasýna kaydedildi!",player,0,100,200)
			else
				outputChatBox("sayi.txt bulunamýyor.",player,250,0,0)
	end
end
addCommandHandler ("pos",func2)