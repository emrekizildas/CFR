stuntLabel = guiCreateLabel (0,0.8,1,0.2,"",true)
guiLabelSetHorizontalAlign (stuntLabel, "center")
guiLabelSetVerticalAlign (stuntLabel, "center")
guiSetFont (stuntLabel, "clear-normal")

addEventHandler( "onClientPlayerStuntFinish", getRootElement(),
    function (stuntType, stuntTime, distance)
        if (stuntTime > 1) then
		givePlayerMoney ( source, 10 )
          local stuntSecTime = stuntTime/2000
          guiSetText (stuntLabel, "Stunt Tipi: " .. stuntType ..", Zaman: " .. stuntSecTime ..", Mesafe: " .. tostring( distance ) .. "metre")
          setTimer (guiSetText, 1500,1, stuntLabel, "")
        end
    end
);