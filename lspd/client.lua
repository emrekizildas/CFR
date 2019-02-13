lspd  = guiCreateStaticImage(203,502,400,74,"police.png",false)
guiSetVisible (lspd, false)

addEvent ("policep", true)
function police ()
  if (getLocalPlayer() == source) then
  setTimer (guiSetVisible, 1000,1,lspd, true)
  setTimer (guiSetAlpha, 1000,1,lspd, 0.2)
  setTimer (guiSetAlpha, 1500,1,lspd, 0.3)
  setTimer (guiSetAlpha, 2000,1,lspd, 0.4)
  setTimer (guiSetAlpha, 2500,1,lspd, 0.5)
  setTimer (guiSetAlpha, 3000,1,lspd, 0.6)
  setTimer (guiSetAlpha, 3500,1,lspd, 0.7)
  setTimer (guiSetAlpha, 4000,1,lspd, 0.8)
  setTimer (guiSetAlpha, 4500,1,lspd, 0.9)
  setTimer (guiSetAlpha, 5000,1,lspd, 1)
  setTimer (guiSetAlpha, 7000,1,lspd, 0.9)
  setTimer (guiSetAlpha, 7500,1,lspd, 0.8)
  setTimer (guiSetAlpha, 8000,1,lspd, 0.7)
  setTimer (guiSetAlpha, 8500,1,lspd, 0.6)
  setTimer (guiSetAlpha, 9000,1,lspd, 0.5)
  setTimer (guiSetAlpha, 9500,1,lspd, 0.4)
  setTimer (guiSetAlpha, 10000,1,lspd, 0.3)
  setTimer (guiSetAlpha, 10500,1,lspd, 0.2)
 setTimer (guiSetVisible, 15500,1,lspd,false)
  end
end
addEventHandler ("policep", getRootElement(), police)

addEvent ("policek", true)
function policek ()
  if (getLocalPlayer() == source) then
  setTimer (guiSetVisible, 1000,1,lspd, false)
  end
end
addEventHandler ("policek", getRootElement(), policek)