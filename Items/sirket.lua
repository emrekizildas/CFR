addcommandHandler ("sirket",
 function (cmd,player)
 x,y,z = getElementPosition(player)
 marker = createMarker (x,y,z,"arrow",1.5,255,0,0,getRootElement())
end)
  