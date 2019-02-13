function giris ( )
      local hesabi = getPlayerAccount ( source )
      if ( hesabi ) then
            setAccountData ( hesabi, "silahruhsati", "yok" )
      end
end
addEventHandler ("onPlayerJoin", getRootElement(), giris)
 
function arama (commandName,thePlayer)
      local hesabi = getPlayerAccount ( thePlayer )
      if ( hesabi ) then
            local ruhsati = getAccountData ( hesabi, "silahruhsati" )
            if ( ruhsati == yok ) then
                  outputChatBox ("deneem")
            end
      end
end
addCommandHandler ("ruhsatsiz", arama)

function printAmountOfAccounts ( thePlayer )
    local accountTable = getAccounts ()
    if #accountTable == 0 then 
        outputChatBox( "There are no accounts. :(", thePlayer )
    else
        outputChatBox( "There are " .. #accountTable .. " accounts in this server!", thePlayer )
    end
end
addCommandHandler( "hesapsayimi", printAmountOfAccounts )

function deneme ()
 araba = createVehicle (411, 2120,2127,11)
 setElementVelocity ( araba, 0,1, 0 )
 setTimer (setElementVelocity, 1500,1, araba, 0,0,0)
 end
 addEventHandler ("onResourceStart", getRootElement(), deneme)
