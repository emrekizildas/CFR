taxis = {{"Los Santos","1050",1691.421875,-1954.0928955078,13.699316978455},{"Market Istasyonu","1000",821.12200927734,-1371.9879150391,-1.6773676872253},{"Las Colinas","1050",2288.39184,-1125.7907128,26.876},{"Flint Country","1050",-129.025909,-1025.313598,11.850},{"Red Country","1050",2828.13256,-3.336180,30.068}}

trenwindow = guiCreateWindow(281,172,328,262,"Tren Seferlerine Hosgeldiniz",false)
guiSetVisible (trenwindow,false)
resim = guiCreateStaticImage(19,33,85,89,"1-Normal-Train-icon.png",false,trenwindow)
trengrid = guiCreateGridList(111,27,201,222,false,trenwindow)
guiGridListSetSelectionMode(trengrid,0)
id = guiGridListAddColumn(trengrid,"ID",0.17)
sefer = guiGridListAddColumn(trengrid,"Istasyonlar",0.5)
ucret = guiGridListAddColumn(trengrid,"Ucret",0.22)
binmek = guiCreateButton(16,127,84,90,"Trene Bin",false,trenwindow)
kapatb = guiCreateButton(11,227,94,26,"Kapat",false,trenwindow)


-- trenwindow = guiCreateWindow(515,157,281,297,"Tren Seferleri",false)
-- trengrid = guiCreateGridList(10,26,262,225,false,trenwindow)
-- guiGridListSetSelectionMode(trengrid,2)
-- binmek = guiCreateButton(13,256,120,32,"Trene Bin",false,trenwindow)
-- kapatb = guiCreateButton(145,257,120,31,"Kapat",false,trenwindow)
-- id = guiGridListAddColumn(trengrid,"ID",0.2)
-- sefer = guiGridListAddColumn(trengrid,"Tren Istasyonlari",0.5)
-- ucret = guiGridListAddColumn(trengrid,"Ucret",0.22)
-- guiSetVisible (trenwindow, false)

 for i,v in ipairs (taxis) do
    local row = guiGridListAddRow (trengrid)
    guiGridListSetItemText (trengrid,row,sefer,v[1],false,false)
    guiGridListSetItemText (trengrid,row,id,tostring(i),false,true)
    guiGridListSetItemText (trengrid,row,ucret,v[2] .. " TL",false,false)
  end

  
addEvent ("pencere", true)
function viewGUI ()
  if (getLocalPlayer() == source) then
    guiSetVisible (trenwindow, true)
    showCursor (true)
  end
end
addEventHandler ("pencere", getRootElement(), viewGUI)
addEvent ("pkapat", true)
function viewGUI ()
  if (getLocalPlayer() == source) then
    guiSetVisible (trenwindow, false)
    showCursor (false)
  end
end
addEventHandler ("pkapat", getRootElement(), viewGUI)


function taxiPlayer (player,id)
  if (player == getLocalPlayer()) and (id) then
    local destination = taxis[id]
    if (destination) then
      local name = destination[1]
      local cost = destination[2]
      local x = destination[3]
      local y = destination[4]
      local z = destination[5]
      if name and cost and x and y and z then
        triggerServerEvent ("trenseferleri",player,name,cost,x,y,z)
      else
      end
    else
end 
end
end

addEventHandler ("onClientGUIClick",getRootElement(),
function (button,state,absx,absy)
 if (source == binmek) then
    local row,col = guiGridListGetSelectedItem (trengrid)
    taxiPlayer (getLocalPlayer(),tonumber(guiGridListGetItemText(trengrid,row,col)))
	elseif (source == kapatb ) then
	guiSetVisible (trenwindow,false)
	showCursor (false)
	end
end)