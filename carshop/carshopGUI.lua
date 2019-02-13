
-- carshopWindow = guiCreateWindow(12,120,189,218,"Araba Galerisi",false)
-- guiSetVisible (carshopWindow, false)
-- guiSetAlpha(carshopWindow,1)
-- guiWindowSetSizable(carshopWindow,false)
-- selectLabel = guiCreateLabel(0.0423,0.1009,0.8889,0.078,"Arabani Sec",true,carshopWindow)
-- guiSetAlpha(selectLabel,1)
-- guiLabelSetColor(selectLabel,255,255,255)
-- guiLabelSetVerticalAlign(selectLabel,"top")
-- guiLabelSetHorizontalAlign(selectLabel,"left",false)
-- guiSetFont(selectLabel,"default-bold-small")
-- carGridList = guiCreateGridList(0.0476,0.1789,0.9048,0.6789,true,carshopWindow)
-- guiGridListSetSelectionMode(carGridList,0)
-- carColumn = guiGridListAddColumn(carGridList,"Arac",0.5)
-- costColumn = guiGridListAddColumn(carGridList,"Ucret:",0.3)
-- guiSetAlpha(carGridList,1)
-- buyButton = guiCreateButton(0.0476,0.8624,0.7778,0.0963,"Satin Al",true,carshopWindow)
-- guiSetAlpha(buyButton,1)
-- closeButton = guiCreateButton(0.8571,0.8624,0.0899,0.1009,"x",true,carshopWindow)

carshopWindow = guiCreateWindow(34,182,260,288,"TR++ / Araba Satin Alma Paneli",false)
guiSetVisible (carshopWindow, false)
guiSetAlpha(carshopWindow,1.999999)
carGridList = guiCreateGridList(14,22,235,177,false,carshopWindow)
guiGridListSetSelectionMode(carGridList,2)
guiGridListAddColumn(carGridList,"Arac",0.5)
guiGridListAddColumn(carGridList,"Ucret",0.3)
getirt = guiCreateButton(203,215,47,20,"Getirt",false,carshopWindow)
guiSetFont(getirt,"default-bold-small")
label1 = guiCreateLabel(10,206,194,31,"Eger onceden bir arac \nsatin aldiysaniz bu tusu kullaniniz:",false,carshopWindow)
guiLabelSetColor(label1,0,255,0)
guiLabelSetVerticalAlign(label1,"top")
guiLabelSetHorizontalAlign(label1,"left",false)
guiSetFont(label1,"default-bold-small")




local cars = {{579,60000},{400,60000},{404,28000},{489,65000},{505,65000},{479,45000},{442,45000},{458,45000},{602,100000},{496,42500},{401,41000},{518,60000},{527,75000},{589,75000},{419,45000},{533,75000},{526,50000},{474,55000},{545,50000},{517,45000},{410,41000},{600,50000},{436,41000},{580,50000},{439,75000},{549,75000},{491,45000},{445,45000},{507,45000},{585,45000},{587,100000},{466,55000},{492,50000},{546,45000},{551,45000},{516,45000},{467,45000},{426,47500},{547,45000},{405,55000},{550,45000},{566,45000},{540,45000},{421,50000},{529,45000},{402,250000},{542,65000},{603,150000},{475,75000},{562,175000},{565,95000},{559,125000},{561,50000},{560,125000},{558,100000},{429,150000},{541,150000},{415,150000},{480,95000},{434,100000},{494,200000},{502,200000},{503,200000},{411,300000},{506,150000},{451,300000},{555,95000},{477,95000},{499,25000},{498,25000},{515,75000},{514,75000},{456,45000},{422,45000},{482,95000},{418,45000},{572,12000},{413,50000},{440,50000},{543,65000},{478,35000},{554,50000},{536,75000},{575,75000},{534,75000},{567,75000},{535,75000},{576,75000},{412,75000},{568,75000},{457,12000},{483,45000},{508,40000},{571,10000},{500,55000},{471,20000},{495,100000},{539,75000},{481,2500},{509,2500},{581,45000},{462,12000},{521,60000},{463,50000},{522,75000},{448,12000},{468,45000},{586,45000},{525,75000}}
for i,v in ipairs (cars) do
    local carName = getVehicleNameFromModel (v[1])
    local row = guiGridListAddRow (carGridList)
    guiGridListSetItemText (carGridList, row, 1, carName, false, true)
    guiGridListSetItemText (carGridList, row, 2, tostring(v[2]), false, true)
end


buyButton = guiCreateButton(13,244,118,31,"S A T I N   A L !",false,carshopWindow)

closeButton = guiCreateButton(233,262,17,17,"x",false,carshopWindow)

function resourceStart ()
  bindKey ("F2", "down", menuShow)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), resourceStart)

-- radar = createRadarArea ( 2955, -7324, 160, 160, 0,0,255,255 )
col = createColRectangle ( 2955, -7324,160,160)

addEventHandler ("onClientColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
  if (source == col) and (hitElement == getLocalPlayer()) then
    unbindKey('f3', 'down', menuShow)
  end
end)
addEventHandler ("onClientColShapeLeave", getRootElement(), 
function(leaveElement, matchingDimension)
  if (source == col) and (leaveElement == getLocalPlayer()) then
    bindKey('f3', 'down', menuShow)
  end
end)

function menuShow ()
	visableornot = guiGetVisible (carshopWindow)	
	if (visableornot == true) then
		guiSetVisible (carshopWindow, false)
		showCursor (false)
	end
	if (visableornot == false) then
		guiSetVisible (carshopWindow, true)
		showCursor (true)
	end
end

addEvent ("viewGUI", true)
function viewGUI ()
  if (getLocalPlayer() == source) then
    guiSetVisible (carshopWindow, true)
    showCursor (true)
  end
end
addEventHandler ("viewGUI", getRootElement(), viewGUI)

function onClientGUIClick (button, state, absoluteX, absoluteYe)
  if (source == buyButton) then guiSetVisible (carshopWindow, false) showCursor (false)
    if (guiGridListGetSelectedItem (carGridList)) then
      local carName = guiGridListGetItemText (carGridList, guiGridListGetSelectedItem (carGridList), 1)
      local carID = getVehicleModelFromName (carName)
      local carCost = guiGridListGetItemText (carGridList, guiGridListGetSelectedItem (carGridList), 2)
      triggerServerEvent ("carShopCarBuy", getLocalPlayer(), carID, carCost, carName)
    end
  elseif (source == closeButton) then guiSetVisible (carshopWindow, false) showCursor (false)
  end
end
addEventHandler ("onClientGUIClick", getRootElement(), onClientGUIClick)