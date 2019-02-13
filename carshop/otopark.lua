marker = createMarker (351.7292175293,-1790.8905029297,4.018637504578,"cylinder",5,255,255,255,50)
kapali = createObject (987, 344.59719848633,-1785.6656494141,4.170024394989,0,0,359.25)
--acik = createObject (987, 334.80767822266, -1785.8466796875, 4.170024394989, 0, 0, 359.25)


function acmak (res)
 moveObject ( kapali, 5600, 334.80767822266, -1785.8466796875, 4.170024394989)
 end
addCommandHandler ("acmak" , acmak)
addEventHandler ( "onResourceStart", getRootElement(), acmak )

function kapamak (res)
moveObject ( kapali, 5600, 344.59719848633,-1785.6656494141,4.170024394989)
end
addCommandHandler ("kapamak", kapamak)
addEventHandler ( "onResourceStart", getRootElement(), kapamak )