duraklar = {
{"Glen Park","50",1980.3565673828,-1264.1607666016,24.0703125,0,0,272},
{"Idlewood","50",2005.0013427734,-1458.6594238281,13.640625,0,0,90},
{"Downtown LS","50",1580.7552490234,-1305.7810058594,17.623306274414,0,0,270},
{"All Saints Hospital","50",1193.3651123047,-1292.8599853516,13.631410598755,0,0,179.99963318906},
{"Atlantis AVM","50",1111.4793701172,-1407.4144287109,13.654197692871,0,0,272},
{"Verdant Bluffs","50",1250.9376220703,-2052.5244140625,59.843627929688,0,0,88},
{"Marina","50",827.22570800781,-1766.1488037109,13.64874458313,0,0,90},
{"Santa Marina Sahili","50",435.3690795894,-1774.5964355469,5.542331124878,0,0,270},
{"Flint Country","50",-101.443939,-1135.323120,1.634,0,0,154},
{"Rodeo","50",469.07958984375,-1315.1354980469,15.520740509033,15,0,0,308},
{"Vinewood","50",815.472839,-1138.8765869141,24.23,0,0,88},
{"Willowfield","50",1974.169,-2168.7055640,13.820,0,0,272},
{"Playe del Seville","50",2859.6245117188,-2009.779296,11.3967,0,0,0},
{"Ganton","50",2410.3276367188,-1730.6408691406,13.89114,0,0,90},
{"Las Colinas","50",2296.66137,-1148.46118,27.2155,0,0,80},
{"Dillimore","50",678.88598,-585.325,16.639,0,0,180}}






window = guiCreateWindow(180,310,352,283,"Otobus Duragina Hosgeldiniz",false)
resimsag = guiCreateStaticImage(286,25,48,48,"bus.png",false,window)
resimsol = guiCreateStaticImage(11,28,48,48,"bus.png",false,window)
Label = guiCreateLabel(72,24,207,47,"Duraga hosgeldiniz lutfen asagidan \ngitmek istediginiz duragi secin ve \nOtobuse Bin 'e tiklayiniz.",false,window)
guiLabelSetColor(Label,255,255,255)
guiLabelSetVerticalAlign(Label,"top")
guiLabelSetHorizontalAlign(Label,"left",false)
gridlist = guiCreateGridList(10,76,331,172,false,window)
guiGridListSetSelectionMode(gridlist,0)
id = guiGridListAddColumn(gridlist,"ID",0.17)
durak = guiGridListAddColumn(gridlist,"Duraklar",0.5)
ucret = guiGridListAddColumn(gridlist,"Ucret",0.22)
binb = guiCreateButton(9,252,155,22,"Otobuse Bin",false,window)
kapatb = guiCreateButton(297,254,29,20,"X",false,window)
guiSetVisible (window,false)

 for i,v in ipairs (duraklar) do
    local row = guiGridListAddRow (gridlist)
    guiGridListSetItemText (gridlist,row,durak,v[1],false,false)
    guiGridListSetItemText (gridlist,row,id,tostring(i),false,true)
    guiGridListSetItemText (gridlist,row,ucret,v[2] .. " TL",false,false)
  end
  
  addEvent ("otopen", true)
function otopen ()
  if (getLocalPlayer() == source) then
    guiSetVisible (window, true)
    showCursor (true)
  end
end
addEventHandler ("otopen", getRootElement(), otopen)
addEvent ("otopkapat", true)
function viewGUI ()
  if (getLocalPlayer() == source) then
    guiSetVisible (window, false)
    showCursor (false)
  end
end
addEventHandler ("otopkapat", getRootElement(), viewGUI)

function otobus (player,id)
  if (player == getLocalPlayer()) and (id) then
    local destination = duraklar[id]
    if (destination) then
      local name = destination[1]
      local cost = destination[2]
      local x = destination[3]
      local y = destination[4]
      local z = destination[5]
	  local rx = destination[6]
	  local ry = destination[7]
	  local rz = destination[8]
      if name and cost and x and y and z and rx and ry and rz then
        triggerServerEvent ("otosefer",player,name,cost,x,y,z,rx,ry,rz)
      else
      end
    else
end 
end
end

addEventHandler ("onClientGUIClick",getRootElement(),
function (button,state,absx,absy)
 if (source == binb) then
    local row,col = guiGridListGetSelectedItem (gridlist)
    otobus (getLocalPlayer(),tonumber(guiGridListGetItemText(gridlist,row,col)))
	elseif (source == kapatb ) then
	guiSetVisible (window,false)
	showCursor (false)
	end
end)

