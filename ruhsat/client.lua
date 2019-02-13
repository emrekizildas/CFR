
        window = guiCreateWindow(199,149,352,304,"Mixed Polis Karakolu - Sivil Islemler Burosu",false)
        aciklama = guiCreateMemo(12,41,331,54,"Sivil islemler burosuna hosgeldiniz.Buradan araciniza ehliyet ve ruhsat,silahiniza ruhsat  alabilirsiniz.",false,window)
        label1 = guiCreateLabel(31,141,79,18,"Silah Ruhsati",false,window)
guiLabelSetColor(label1,12,255,100)
guiLabelSetVerticalAlign(label1,"top")
guiLabelSetHorizontalAlign(label1,"left",false)
guiSetFont(label1,"default-bold-small")
        silahresmi = guiCreateStaticImage(44,99,48,48,"images/silah.png",false,window)
        SBUY = guiCreateButton(18,160,113,118,"SATIN AL! (2500$)",false,window)
        label2 = guiCreateLabel(202,141,134,17,"Araba Ehliyet&Ruhsati",false,window)
guiLabelSetColor(label2,12,255,100)
guiLabelSetVerticalAlign(label2,"top")
guiLabelSetHorizontalAlign(label2,"left",false)
guiSetFont(label2,"default-bold-small")
        ehlresmi = guiCreateStaticImage(239,99,48,48,"images/ehl.png",false,window)
        ABUY = guiCreateButton(211,160,113,118,"SATIN AL! (2000$)",false,window)
        XB = guiCreateButton(296,22,42,17,"Kapat",false,window)
		guiSetVisible (window, false)



addEventHandler ("onClientGUIClick",getRootElement(),
function (button,state,absx,absy)
 if (source == XB) then
	guiSetVisible (window,false)
	showCursor (false)
elseif (source == ABUY) then
    triggerServerEvent ("aruhsat", getLocalPlayer())
elseif (source == SBUY)
    triggerServerEvent ("sruhsat", getLocalPlayer())
	end
end)

  addEvent ("ehliac", true)
function otopen ()
  if (getLocalPlayer() == source) then
    guiSetVisible (window, true)
    showCursor (true)
  end
end
addEventHandler ("ehliac", getRootElement(), otopen)

addEvent ("ehlika", true)
function viewGUI ()
  if (getLocalPlayer() == source) then
    guiSetVisible (window, false)
    showCursor (false)
  end
end
addEventHandler ("ehlika", getRootElement(), viewGUI)