PlayerCamera = {}

function mycommand1(player,commandName)
	PlayerCamera[player] = 1
	outputChatBox("Mode of changing camera position's has started.",player,0,100,200)
	outputChatBox("Change position of camera -  W/A/S/D/Q/E.",player,0,100,200)
	outputChatBox("Remove camera mode - left shift.",player,0,100,200)
	outputChatBox("Save a position of camera - right shift.",player,0,100,200)
	showPlayerHudComponent ( player, "ammo", false)
	showPlayerHudComponent ( player, "area_name", false)
	showPlayerHudComponent ( player, "armour", false)
	showPlayerHudComponent ( player, "breath", false)
	showPlayerHudComponent ( player, "clock", false)
	showPlayerHudComponent ( player, "health", false)
	showPlayerHudComponent ( player, "money", false)
	showPlayerHudComponent ( player, "radar", false)
	showPlayerHudComponent ( player, "vehicle_name", false)
	showPlayerHudComponent ( player, "weapon", false)
	bindKey ( player, "a", "up", func2 ) 
	bindKey ( player, "d", "up", func2 ) 
	bindKey ( player, "w", "up", func2 ) 
	bindKey ( player, "s", "up", func2 ) 
	bindKey ( player, "q", "up", func2 ) 
	bindKey ( player, "e", "up", func2 ) 
	bindKey ( player, "lshift", "up", func2 ) 
	bindKey ( player, "rshift", "up", func2 ) 
	local x,y,z = getElementPosition(player)
	setCameraMatrix ( player, x+5,y,z , x,y,z, 0, 70  )
	toggleAllControls ( player, false)
	setElementAlpha(player,0)
end

addCommandHandler("setcamera",mycommand1)

function func2(player,key,keyState)
	if(PlayerCamera[player] == 1) then
	
	if(key == 'w') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px,py+2,pz , x,y,z, a,s )
		end
	end

	if(key == 'a') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px-2,py,pz , x,y,z, a,s )
		end
	end
	
	if(key == 's') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px+2,py,pz , x,y,z, a,s )
		end
	end
	
	if(key == 'd') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px,py-2,pz , x,y,z, a,s )
		end
	end
	
	if(key == 'q') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px,py,pz+2 , x,y,z, a,s )
		end
	end
	
	if(key == 'e') then
		if(keyState == 'up') then
			local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
			setCameraMatrix ( player, px,py,pz-2 , x,y,z, a,s )
		end
	end
	
	if(key == 'lshift') then
		if(keyState == 'up') then
			showPlayerHudComponent ( player, "ammo", true)
			showPlayerHudComponent ( player, "area_name", true)
			showPlayerHudComponent ( player, "armour", true)
			showPlayerHudComponent ( player, "breath", true)
			showPlayerHudComponent ( player, "clock", true)
			showPlayerHudComponent ( player, "health", true)
			showPlayerHudComponent ( player, "money", true)
			showPlayerHudComponent ( player, "radar", true)
			showPlayerHudComponent ( player, "vehicle_name", true)
			showPlayerHudComponent ( player, "weapon", true)
			unbindKey ( player, "a", "up", func2 ) 
			unbindKey ( player, "d", "up", func2 ) 
			unbindKey ( player, "w", "up", func2 ) 
			unbindKey ( player, "s", "up", func2 ) 
			unbindKey ( player, "q", "up", func2 ) 
			unbindKey ( player, "e", "up", func2 ) 
			unbindKey ( player, "lshift", "up", func2 ) 
			unbindKey ( player, "rshift", "up", func2 ) 
			toggleAllControls ( player, true)
			setCameraTarget(player, 0)
			PlayerCamera[player] = 0
			outputChatBox("Camera mode has removed.",player,0,100,200)
			setElementAlpha(player,255)
		end
	end
	
	if(key == 'rshift') then
		if(keyState == 'up') then
			local hFile = fileOpen("var.txt")
			if( hFile ) then
				local text = fileRead ( hFile, 1 )
				local number = tonumber(text) + 1
				local text2 = ""..number..""
				fileClose(hFile)
				local hFile = fileOpen("var.txt")
				fileWrite(hFile, text2)
				fileClose(hFile)
				local px,py,pz,x,y,z,a,s =  getCameraMatrix ( player )
				local hFile2 = fileCreate("/save files/"..text..".txt")
				fileWrite(hFile2,"setCameraMatrix(player,"..px..","..py..","..pz..","..x..","..y..","..z..","..a..","..s..")")
				fileClose(hFile2)
				outputChatBox("Position of camera successfully saved in file "..text..".txt!",player,0,100,200)
			else
				outputChatBox("File var.txt doesn't exists.",player,250,0,0)
			end
		end
	end
	
	end
end