addEvent("onCarRam")
car = nil
currentVHP = nil
minDamage = 10
blowLimit = 350
multiplierDMG = 0.75
regenTimer = nil

function SetUp(startedResource)
	if(startedResource == getThisResource()) then
		setTimer(CheckDamage,500,0)
		toggleAllControls(true,true,true)
		if(isPedInVehicle(getLocalPlayer())) then
			car = getPedOccupiedVehicle(getLocalPlayer())
			currentVHP = getElementHealth(car)
		end
	end
end
addEventHandler("onClientResourceStart",getRootElement(),SetUp)

function carChangeEnter(player,seat)
	if(player == getLocalPlayer()) then
		car = getPedOccupiedVehicle(player)
		currentVHP = getElementHealth(car)
	end
end
addEventHandler("onClientVehicleEnter",getRootElement(),carChangeEnter)

function carChangeExit(player,seat)
	if(player == getLocalPlayer()) then
		car = nil
		currentVHP = nil
	end
end
addEventHandler("onClientVehicleExit",getRootElement(),carChangeExit)

function UnFreeze()
	toggleAllControls(true,true,true)
end
addEventHandler("onClientPlayerSpawn",getRootElement(),UnFreeze)

function CheckDamage()
	if(isPedInVehicle(getLocalPlayer())) then
		car = getPedOccupiedVehicle(getLocalPlayer())
		if(getElementHealth(car) < currentVHP) then
			local loss = currentVHP - getElementHealth(car)
			if(loss > minDamage) then
				local newDHP = getElementHealth(getLocalPlayer()) - (loss * multiplierDMG)
				setElementHealth(getLocalPlayer(),newDHP)
				if(getElementHealth(getLocalPlayer()) <= 0) then
					toggleAllControls(false,true,false)
					killTimer(regenTimer)
				else
					regenTimer = setTimer(regenerate,(10/math.floor(loss)) * 1000,math.floor(loss))
				end
				local VHP = getElementHealth(car)
				currentVHP = VHP
				if(loss > blowLimit) then
					blowVehicle(car)
					car = nil
					currentVHP = nil
				end
			end
		end
	end
end

function regenerate()
	currentDHP = getElementHealth(getLocalPlayer())
	setElementHealth(getLocalPlayer(),currentDHP + 0.75)
end