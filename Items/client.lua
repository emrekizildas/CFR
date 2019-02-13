guiwin = guiCreateWindow(558,137,236,311,"Item Shop",false)
tabpanel = guiCreateTabPanel(9,20,218,282,false,guiwin)
oyuncutab = guiCreateTab("Oyuncu",tabpanel)
arabatab = guiCreateTab("Araba",tabpanel)
nvg = guiCreateButton(4,9,108,31,"Navigasyon",false,arabatab)
kapatb = guiCreateButton(167,20,48,20,"Kapat",false,guiwin)
guiSetVisible (guiwin,true)


function GUIG () then
if (getLocalPlayer() == source)
    guiSetVisible (guiwin, true)
    showCursor (true)
	end
end
addEvent ("guiwina", true)
addEventHandler ("guiwina", getRootElement(), GUIG)


function nvgsiz ()
 showPlayerHudComponent ("radar",false)
end
addEventHandler ("onPlayerLogin", getRootElement(), nvgsiz)


addEventHandler ("onClientGUIClick",getRootElement(),
function (button,state,absx,absy)
	if (source == kapatb ) then
	guiSetVisible (guiwin,false)
	showCursor (false)
    elseif (source == nvg) then
	showPlayerHudComponent ("radar",true)
	takePlayerMoney (source, 100)
	end
end)