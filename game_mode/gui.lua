taxis = {{"San Fierro Araba Pazari","100",-1996.9,305.363,34.588},{"Los Santos Araba Pazari","150",2117.761,-1116.706,24.712},{"Victim Giyim Magazasi","200",455.115,-1500.152,30.425},{"Las Venturas Havaalani","100",1720.333,1586.651,10.133},{"Atlantis AlisVeris Merkezi","100",1147.891,-1410.496,13.0439},{"Bayside Kumarhane","150",-2505.273,2364.135,4.394},{"Akrobasi Salonu","120",-2051.766,-395.0117,34.940,}}
--ammunation = {{"Brass Knuckle","1","15",1},{"Knife","1","250",4},{"Golf Club","1","20",2},{"Chainsaw","1","500",9},{"Pistol","51","100",22},{"Silenced","51","125",23},{"Deagle","77","300",24},{"Shotgun","10","100",25},{"Sawn-Off","20","100",26},{"SPAZ-12","70","500",27},{"UZI","100","125",28},{"MP5","120","300",29},{"Tec-9","100","100",31},{"AK-47","60","200",30},{"M4","50","200",31},{"Sniper","10","150",34},{"Country Sniper","10","100",33},{"Rocket","1","1000",35},{"Apple x1","1","15",16},{"Apple","10","125",16},{"Gas x1","1","25",17},{"Gas","10","200",17},{"Flowers","1","1",14}}

addEventHandler ("onClientResourceStart",getResourceRootElement(getThisResource()),
function()
  -- login window
  jasmodLoginWindow = guiCreateWindow(0.2625,0.2383,0.4000,0.5050,"Mixed MTA Server:CFR Mod",true)
  toggleControl ("chatbox",false)
  guiWindowSetMovable(jasmodLoginWindow,false)
  guiWindowSetSizable(jasmodLoginWindow,false)
  guiSetAlpha (jasmodLoginWindow, 0.72799999713898)
  jasmodLoginWindowUsernameLabel = guiCreateLabel(0.0344,0.3496,0.4063,0.0858,"Oyuncu Ismi",true,jasmodLoginWindow)
  guiLabelSetColor(jasmodLoginWindowUsernameLabel,180,180,180)
  guiLabelSetVerticalAlign(jasmodLoginWindowUsernameLabel,"center")
  guiLabelSetHorizontalAlign(jasmodLoginWindowUsernameLabel,"left",false)
  jasmodLoginWindowUsernameEdit = guiCreateEdit(0.0375,0.4323,0.9063,0.0990,"",true,jasmodLoginWindow)
  guiEditSetMaxLength(jasmodLoginWindowUsernameEdit,20)
  jasmodLoginWindowPasswordEdit = guiCreateEdit(0.0437,0.5941,0.9000,0.0990,"",true,jasmodLoginWindow)
  guiEditSetMasked(jasmodLoginWindowPasswordEdit,true)
  guiEditSetMaxLength(jasmodLoginWindowPasswordEdit,20)
  jasmodLoginWindowPasswordLabel = guiCreateLabel(0.0450,0.5147,0.2937,0.0891,"Sifresi",true,jasmodLoginWindow)
  guiLabelSetColor(jasmodLoginWindowPasswordLabel,180,180,180)
  guiLabelSetVerticalAlign(jasmodLoginWindowPasswordLabel,"center")
  guiLabelSetHorizontalAlign(jasmodLoginWindowPasswordLabel,"left",false)
  jasmodLoginWindowLoginButton = guiCreateButton(0.0406,0.8317,0.9000,0.1254,"Giris Yap!",true,jasmodLoginWindow)
  -- jasmodLoginWindowRegisterButton = guiCreateButton(0.5063,0.8317,0.4219,0.1254,"Kayit Ol!",true,jasmodLoginWindow)
  guiSetFont(jasmodLoginWindowRegisterButton,"default-bold-small")
  guiSetFont(jasmodLoginWindowLoginButton,"default-bold-small")
  girisresmi = guiCreateStaticImage(12,26,299,79,"images/formust.png",false,jasmodLoginWindow)
  guiSetAlpha (girisresmi, 0.96799999713898)
girisyazisi = guiCreateLabel(27,212,247,39,"HOSGELDINIZ",false,jasmodLoginWindow)
guiLabelSetVerticalAlign(girisyazisi,"center")
guiLabelSetHorizontalAlign(girisyazisi,"center",false)
guiLabelSetColor(girisyazisi,180,180,180)

  
  showCursor (true,true)
  showChat (false)
  setCameraMatrix(-1651.5400390625,472.4580078125,87.372299194336,-1632.5400390625,524.4580078125,87.372299194336,0,70)
  showPlayerHudComponent ("radar",false)
  fadeCamera (true,2.5)
  
  -- informatie window
  jasmodInfoWindow = guiCreateWindow(0.285,0.0267,0.4563,0.29,"CFR Mod Yardim Penceresi",true)
  guiSetVisible (jasmodInfoWindow,false)
  jasmodInfoWindowExitButton = guiCreateButton(0.0247,0.8333,0.9507,0.1149,"Tamam",true,jasmodInfoWindow)
  jasmodInfoWindowMemo = guiCreateMemo(0.0247,0.1149,0.9507,0.6954,"BlahBlah",true,jasmodInfoWindow)
  guiMemoSetReadOnly(jasmodInfoWindowMemo,true)
  
  -- character select window
  -- jasmodCharSelectWindow = guiCreateWindow(0.75,0,0.25,1,"Karakterini Sec!",true)
  -- guiSetVisible (jasmodCharSelectWindow,false)
  -- guiWindowSetMovable(jasmodCharSelectWindow,false)
  -- guiWindowSetSizable(jasmodCharSelectWindow,false)
  -- jasmodCharSelectNewCharacterButton = guiCreateLabel(0.045,0.04,0.89,0.05,"Karakter Sec",true,jasmodCharSelectWindow)
  -- jasmodCharSelectGridlist = guiCreateGridList(0.045,0.0967,0.905,0.5417,true,jasmodCharSelectWindow)
  -- guiGridListSetSelectionMode(jasmodCharSelectGridlist,2)
  -- characternameColumn = guiGridListAddColumn(jasmodCharSelectGridlist,"Karakter Ismi",0.8)
  -- jasmodCharSelectGameEnterButton = guiCreateButton(0.045,0.645,0.91,0.0517,"Oyuna Gir!",true,jasmodCharSelectWindow)
  -- jasmodCharSelectImage = guiCreateStaticImage(0.045,0.72,0.91,0.265,"images/charselectwindow.png",true,jasmodCharSelectWindow)
  
  

jasmodCharSelectWindow = guiCreateWindow(25,38,285,407,"Karakterini Sec",false)
  guiSetVisible (jasmodCharSelectWindow,false)
  guiWindowSetMovable(jasmodCharSelectWindow,false)
  guiWindowSetSizable(jasmodCharSelectWindow,false)
KARAKTERLABEL = guiCreateLabel(14,23,261,39,"KARAKTERLERIN",false,jasmodCharSelectWindow)
guiLabelSetColor(KARAKTERLABEL,255,0,255)
guiLabelSetVerticalAlign(KARAKTERLABEL,"center")
guiLabelSetHorizontalAlign(KARAKTERLABEL,"left",false)
guiSetFont(KARAKTERLABEL,"sa-header")
jasmodCharSelectGridlist = guiCreateGridList(16,66,253,272,false,jasmodCharSelectWindow)
guiGridListSetSelectionMode(jasmodCharSelectGridlist,2)
characternameColumn = guiGridListAddColumn(jasmodCharSelectGridlist,"Karakter Ismi",0.9)
jasmodCharSelectGameEnterButton = guiCreateButton(19,347,257,51,"RolePlay'a Basla !",false,jasmodCharSelectWindow)
  
  
  -- character create window
  -- jasmodCharCreateWindow = guiCreateWindow(0.0225,0.1417,0.3425,0.8167,"Karakterini Olustur!",true)
  -- guiSetVisible (jasmodCharCreateWindow,false)
  -- guiWindowSetSizable(jasmodCharCreateWindow,false)
  -- jasmodCharCreateSkinLeftButton = guiCreateButton(0.0328,0.3245,0.3686,0.0755,"<-- Onceki",true,jasmodCharCreateWindow)
  -- jasmodCharCreateSkinLabel = guiCreateLabel(0.0401,0.1857,0.5146,0.1857,"Kendine bir Tip Sec:",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateSkinLabel,255,255,255)
  -- guiLabelSetVerticalAlign(jasmodCharCreateSkinLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateSkinLabel,"center",false)
  -- jasmodCharCreateSkinRightButton = guiCreateButton(0.5036,0.3245,0.3686,0.0755,"Sonraki -->",true,jasmodCharCreateWindow)
  -- jasmodCharCreateNameTagLabel = guiCreateLabel(0.0438,0.4184,0.6533,0.0490,"Isim Rengini (0-255 arasi yaziniz)",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateNameTagLabel,255,255,255)
  -- guiLabelSetVerticalAlign(jasmodCharCreateNameTagLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateNameTagLabel,"left",false)
  -- jasmodCharCreateNameTagRedLabel = guiCreateLabel(0.0511,0.4571,0.2153,0.0551,"Kirmizi",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateNameTagRedLabel,255,0,0)
  -- guiLabelSetVerticalAlign(jasmodCharCreateNameTagRedLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateNameTagRedLabel,"left",false)
  -- jasmodCharCreateNameTagGreenLabel = guiCreateLabel(0.0511,0.5265,0.2153,0.0551,"Yesil",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateNameTagGreenLabel,0,255,0)
  -- guiLabelSetVerticalAlign(jasmodCharCreateNameTagGreenLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateNameTagGreenLabel,"left",false)
  -- jasmodCharCreateNameTagBlueLabel = guiCreateLabel(0.0511,0.5939,0.2153,0.0551,"Mavi",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateNameTagBlueLabel,0,0,255)
  -- guiLabelSetVerticalAlign(jasmodCharCreateNameTagBlueLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateNameTagBlueLabel,"left",false)
  -- jasmodCharCreateNameTagRedEdit = guiCreateEdit(0.2409,0.4612,0.3358,0.0551,"",true,jasmodCharCreateWindow)
  -- guiEditSetMaxLength(jasmodCharCreateNameTagRedEdit,3)
  -- jasmodCharCreateNameTagGreenEdit = guiCreateEdit(0.2409,0.5265,0.3358,0.0551,"",true,jasmodCharCreateWindow)
  -- guiEditSetMaxLength(jasmodCharCreateNameTagGreenEdit,3)
  -- jasmodCharCreateNameTagBlueEdit = guiCreateEdit(0.2409,0.5918,0.3358,0.0551,"",true,jasmodCharCreateWindow)
  -- guiEditSetMaxLength(jasmodCharCreateNameTagBlueEdit,3)
  -- jasmodCharCreateCharacterNameLabel = guiCreateLabel(0.0474,0.1857,0.5146,0.0592,"Karakter Ismi:",true,jasmodCharCreateWindow)
  -- guiLabelSetColor(jasmodCharCreateCharacterNameLabel,255,255,255)
  -- guiLabelSetVerticalAlign(jasmodCharCreateCharacterNameLabel,"center")
  -- guiLabelSetHorizontalAlign(jasmodCharCreateCharacterNameLabel,"left",false)
  -- jasmodCharCreateNameEdit = guiCreateEdit(0.0474,0.2265,0.9197,0.0531,"",true,jasmodCharCreateWindow)
  -- guiEditSetMaxLength(jasmodCharCreateNameEdit,20)
  -- jasmodCharCreateAccountCreateButton = guiCreateButton(0.0511,0.7776,0.9051,0.0918,"Karakterimi Olustur!",true,jasmodCharCreateWindow)
  -- guiSetFont (jasmodCharCreateAccountCreateButton,"default-bold-small")
  -- karakteryasilabel = guiCreateLabel(0.0328,0.6510,0.6533,0.0592,"Karakter Yasi:",true,jasmodCharCreateWindow)
  -- karakteredit = guiCreateEdit(0.0365,0.6898,0.3905,0.0673,"",true,jasmodCharCreateWindow)
  -- kapatmatus = guiCreateButton(0.0511,0.8898,0.9051,0.0918,"Karakter Sayfasina Geri Don",true,jasmodCharCreateWindow)

  -- Game Menu
  theGameMenuWindow = guiCreateWindow(0.2250,0.4800,0.4288,0.5167,"CFR MOD - Oyun Menusu",true)
  guiSetVisible (theGameMenuWindow,false)
  guiWindowSetSizable(theGameMenuWindow,false)
  theGameMenuTabPanel = guiCreateTabPanel(0.0262,0.0645,0.9475,0.8323,true,theGameMenuWindow)
  theGameMenuTabPanelGeneralTab = guiCreateTab("Genel",theGameMenuTabPanel)
  theGameMenuTabPanelGeneralTabLogoutButton = guiCreateButton(0.0308,0.8291,0.9323,0.1239,"Cikis Yap!",true,theGameMenuTabPanelGeneralTab)
  theGameMenuTabPanelGeneralTabCharacterNameLabel = guiCreateLabel(0.0215,0.0299,0.4277,0.0726,"Karakter Ismi",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabCharacterNameLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabCharacterNameLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabCharacterNameLabel,"left",false)
  theGameMenuTabPanelGeneralTabCharacterNameInfoLabel = guiCreateLabel(0.4954,0.0299,0.4831,0.0726," -- CHARACTER NAME --",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabCharacterNameInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabCharacterNameInfoLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabCharacterNameInfoLabel,"left",false)
  --theGameMenuTabPanelGeneralTabFixCarButton = guiCreateButton(0.0338,0.6838,0.4185,0.1239,"Arabani Tamir Et",true,theGameMenuTabPanelGeneralTab)
  --theGameMenuTabPanelGeneralTabFlipCarButton = guiCreateButton(0.5415,0.6838,0.4185,0.1239,"Aracini Cevir",true,theGameMenuTabPanelGeneralTab)
  theGameMenuTabPanelGeneralTabCashLabel = guiCreateLabel(0.0215,0.1496,0.4277,0.0726,"Para",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabCashLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabCashLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabCashLabel,"left",false)
  theGameMenuTabPanelGeneralTabBankLabel = guiCreateLabel(0.0215,0.2308,0.4277,0.0726,"Banka",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabBankLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabBankLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabBankLabel,"left",false)
  theGameMenuTabPanelGeneralTabCashInfoLabel = guiCreateLabel(0.5077,0.1496,0.4277,0.0726,"-- CASH --",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabCashInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabCashInfoLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabCashInfoLabel,"left",false)
  theGameMenuTabPanelGeneralTabBankInfoLabel = guiCreateLabel(0.5046,0.2308,0.4277,0.0726,"-- BANK --",true,theGameMenuTabPanelGeneralTab)
  guiLabelSetColor(theGameMenuTabPanelGeneralTabBankInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelGeneralTabBankInfoLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelGeneralTabBankInfoLabel,"left",false)
  theGameMenuTabPanelPlayersTab = guiCreateTab("Karakterler",theGameMenuTabPanel)
  theGameMenuTabPanelPlayersTabPlayerGridlist = guiCreateGridList(0.0062,0.0085,0.5908,0.9829,true,theGameMenuTabPanelPlayersTab)
  guiGridListSetSelectionMode(theGameMenuTabPanelPlayersTabPlayerGridlist,2)
  theGameMenuTabPanelPlayersTabPlayerColumn = guiGridListAddColumn(theGameMenuTabPanelPlayersTabPlayerGridlist,"Karakter Ismi",0.9)
  theGameMenuTabPanelPlayersTabPlayerGetInfoButton = guiCreateButton(0.6,0.0214,0.3877,0.1282,"Bilgi Al",true,theGameMenuTabPanelPlayersTab)
  --theGameMenuTabPanelPlayersTabPlayerGotoButton = guiCreateButton(0.6,0.4450,0.3877,0.1282,"Isinlan",true,theGameMenuTabPanelPlayersTab)
  --theGameMenuTabPanelPlayersTabPlayerCarGotoButton = guiCreateButton(0.6,0.3077,0.3877,0.1282,"Arabasina Isýinlan",true,theGameMenuTabPanelPlayersTab)
  theGameMenuTabPanelPlayersTabPlayerRefreshListButton = guiCreateButton(0.6,0.1624,0.3877,0.1282,"Listeyi Yenile",true,theGameMenuTabPanelPlayersTab)
  theGameMenuTabPanelTaxiTab = guiCreateTab("Taksi",theGameMenuTabPanel)
  theGameMenuTabPanelTaxiTabGridlist = guiCreateGridList(0.0031,0.0043,0.9908,0.8632,true,theGameMenuTabPanelTaxiTab)
  guiGridListSetSelectionMode(theGameMenuTabPanelTaxiTabGridlist,0)
  theGameMenuTabPanelTaxiTabGridlistIDColumn = guiGridListAddColumn(theGameMenuTabPanelTaxiTabGridlist,"ID",0.1)
  theGameMenuTabPanelTaxiTabGridlistDestColumn = guiGridListAddColumn(theGameMenuTabPanelTaxiTabGridlist,"Taksi Duraklari",0.7)
  theGameMenuTabPanelTaxiTabGridlistCashColumn = guiGridListAddColumn(theGameMenuTabPanelTaxiTabGridlist,"$",0.1)
  theGameMenuTabPanelTaxiTabTaxiButton = guiCreateButton(0.0062,0.8803,0.9877,0.1111,"Taksiye Bin!",true,theGameMenuTabPanelTaxiTab)
  theGameMenuTabPanelVehicleHouseTab = guiCreateTab("Ev / Araba",theGameMenuTabPanel)
  -- theGameMenuTabPanelAnimationTab = guiCreateTab("Animasyon",theGameMenuTabPanel)
  
 -- AnimPlayButton = guiCreateButton(244,10,66,43,"Oynat",false,theGameMenuTabPanelAnimationTab)
-- AnimTabPanel = guiCreateTabPanel(9,10,225,218,false,theGameMenuTabPanelAnimationTab)
-- AnimBestTab = guiCreateTab("Populer",AnimTabPanel)
-- AnimBestGrid = guiCreateGridList(3,4,209,188,false,AnimBestTab)
-- guiGridListSetSelectionMode(AnimBestGrid,2)
-- AnimBestNameCol = guiGridListAddColumn(AnimBestGrid,"Isim",0.2)
-- AnimBestBlockCol = guiGridListAddColumn(AnimBestGrid,"Kategori",0.2)
-- AnimBestAnimCol = guiGridListAddColumn(AnimBestGrid,"Anim",0.2)
-- AnimAllTab = guiCreateTab("Hepsi",AnimTabPanel)
-- AnimAllGrid = guiCreateGridList(3,4,209,188,false,AnimAllTab)
-- guiGridListSetSelectionMode(AnimAllGrid,2)
-- AnimAllAnimCol = guiGridListAddColumn(AnimAllGrid,"Anim",0.2)
-- AnimAllBlockCol = guiGridListAddColumn(AnimAllGrid,"Kategori",0.2)
-- addEventHandler("onClientGUIClick", AnimPlayButton, PLAY, false )
-- guiSetVisible( theGameMenuTabPanelAnimationTab, false )

-- local root = xmlLoadFile("anims.xml")
-- local root2 = xmlFindChild(root, "anims", 0)
-- if ( root2 ) then
  -- for i,v in ipairs (xmlNodeGetChildren(root2)) do 
    -- local nimi = xmlNodeGetAttribute(v, "nimi")
    -- local block = xmlNodeGetAttribute(v, "block")
    -- local hmm = xmlNodeGetAttribute(v, "anim")
    -- row1 = guiGridListAddRow(AnimBestGrid)
    -- guiGridListSetItemText ( AnimBestGrid, row1, AnimBestNameCol, tostring(nimi), false, false )
    -- guiGridListSetItemText ( AnimBestGrid, row1, AnimBestBlockCol, tostring(block), false, false )
    -- guiGridListSetItemText ( AnimBestGrid, row1, AnimBestAnimCol, tostring(hmm), false, false )
    -- guiGridListSetSortingEnabled( AnimBestGrid, true )
    -- guiGridListAutoSizeColumn( AnimBestGrid, AnimBestNameCol )
    -- guiGridListAutoSizeColumn( AnimBestGrid, AnimBestBlockCol )
    -- guiGridListAutoSizeColumn( AnimBestGrid, AnimBestAnimCol )
    -- guiGridListSetScrollBars( AnimBestGrid, false, true )
    -- end
  -- xmlUnloadFile( root2 )
-- end
-- local root = xmlLoadFile("anims.xml")
  -- if ( root ) then		
		-- for i,group in ipairs(xmlNodeGetChildren( root ) ) do
			-- local row = guiGridListAddRow( AnimAllGrid )
			-- local block = xmlNodeGetAttribute( group, "name" )
			-- guiGridListSetItemText( AnimAllGrid, row, 1, block, true, false )			
			-- for i,anim in ipairs( xmlNodeGetChildren( group ) ) do
				-- row = guiGridListAddRow( AnimAllGrid )
				-- name = xmlNodeGetAttribute( anim, "name" )
				-- guiGridListSetItemText( AnimAllGrid, row, 1, name, false, false )	
				-- guiGridListSetItemText( AnimAllGrid, row, 2, block, false, false )	
				-- guiGridListAutoSizeColumn( AnimAllGrid, AnimAllAnimCol )
        -- guiGridListAutoSizeColumn( AnimAllGrid, AnimAllBlockCol )
			-- end
		-- end	
		-- xmlUnloadFile( root )
--	end

  theGameMenuLabel = guiCreateLabel(0.0175,0.9032,0.9621,0.0742,"CFR MOD - OYUN MENUSU - M KAPATIR!",true,theGameMenuWindow)
  guiLabelSetColor(theGameMenuLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuLabel,"center",false)
  
  theGameMenuTabPanelPlayersTabGetInfoWindow = guiCreateWindow(0.6549,0.5483,0.345,0.44,"Karakter Bilgisi",true)
  guiSetVisible (theGameMenuTabPanelPlayersTabGetInfoWindow,false)
  guiWindowSetSizable(theGameMenuTabPanelPlayersTabGetInfoWindow,false)
  theGameMenuTabPanelPlayersTabGetInfoWindowInfoCloseButton = guiCreateButton(9,230,258,25,"Kapat",false,theGameMenuTabPanelPlayersTabGetInfoWindow)
  theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabel = guiCreateLabel(9,25,232,199,"\nOyuncu Ismi\n\nKarakter Ismi\n\n\nParasi\n\nBanka\n\nIsinlanma\n\nYasi:",false,theGameMenuTabPanelPlayersTabGetInfoWindow)
  guiLabelSetColor(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabel,"left",false)
  theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabelPlayerInfo = guiCreateLabel(7,25,259,199,"\n--ACCOUNTNAME--\n\n--CHARACTERNAME--\n\n\n-CASH-$\n\n--BANK--\n\n -- GOTO STATE --\n\n--YASI--",false,theGameMenuTabPanelPlayersTabGetInfoWindow)
  guiLabelSetColor(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabelPlayerInfo,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabelPlayerInfo,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabelPlayerInfo,"right",false)
  bindKey ("m","down", function(key,state) local x,y,z = getElementPosition (getLocalPlayer()) if (x ~= 0) and (y ~= 0) and (z ~= 0) then if (guiGetVisible (theGameMenuWindow) == false) then guiSetVisible (theGameMenuWindow,true) showCursor (true,true) else guiSetVisible (theGameMenuWindow,false) showCursor (false,false)  guiSetVisible (theGameMenuTabPanelPlayersTabGetInfoWindow,false) showCursor (false,false) guiSetVisible (jasmodInfoWindow,false) showCursor (false,false)if guiSetVisible (jasmodCharSelectWindow) == true then guiSetVisible (theGameMenuWindow,false) showCursor (false,false)  if guiSetVisible (jasmodLoginWindow) == true then guiSetVisible (theGameMenuWindow,false) showCursor (false,false) elseif guiSetVisible (jasmodCharSelectWindow) == false then guiSetVisible (jasmodInfoWindow,false) elseif guiSetVisible (jasmodLoginWindow) == false then guiSetVisible (jasmodInfoWindow,false)  end end end end end)
  
  
  
  theGameMenuTabPanelVHTabHousePropertiesLabel = guiCreateLabel(4,98,314,23,"Ev Ayarlari",false,theGameMenuTabPanelVehicleHouseTab)
  guiLabelSetColor(theGameMenuTabPanelVHTabHousePropertiesLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelVHTabHousePropertiesLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelVHTabHousePropertiesLabel,"left",false)
  theGameMenuTabPanelVHTabHouseNumberLabel = guiCreateLabel(4,144,148,23,"Ev Numarasi",false,theGameMenuTabPanelVehicleHouseTab)
  guiLabelSetColor(theGameMenuTabPanelVHTabHouseNumberLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelVHTabHouseNumberLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelVHTabHouseNumberLabel,"left",false)
  theGameMenuTabPanelVHTabHouseNumberInfoLabel = guiCreateLabel(168,144,148,23,"-- HOUSENUMBER --",false,theGameMenuTabPanelVehicleHouseTab)
  guiLabelSetColor(theGameMenuTabPanelVHTabHouseNumberInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelVHTabHouseNumberInfoLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelVHTabHouseNumberInfoLabel,"right",false)
  theGameMenuTabPanelVHTabHouseTeleportButton = guiCreateButton(15,185,291,30,"Evine Git - 250TL",false,theGameMenuTabPanelVehicleHouseTab)
  theGameMenuTabPanelVHTabVehiclePropertiesLabel = guiCreateLabel(4,3,314,23,"Araba Ayarlari",false,theGameMenuTabPanelVehicleHouseTab)
  guiLabelSetColor(theGameMenuTabPanelVHTabVehiclePropertiesLabel,255,255,255)
  guiLabelSetVerticalAlign(theGameMenuTabPanelVHTabVehiclePropertiesLabel,"center")
  guiLabelSetHorizontalAlign(theGameMenuTabPanelVHTabVehiclePropertiesLabel,"left",false)
  theGameMenuTabPanelVHTabVehicleSpawnCarOne = guiCreateButton(4,30,93,27,"Getirt",false,theGameMenuTabPanelVehicleHouseTab)
  theGameMenuTabPanelVHTabVehicleSellCarOne = guiCreateButton(222,30,93,27,"Arabani Sat",false,theGameMenuTabPanelVehicleHouseTab)
  theGameMenuTabPanelVHTabVehicleDestroyCarOne = guiCreateButton(111,30,93,27,"Kaybet",false,theGameMenuTabPanelVehicleHouseTab)
  --theInsideHouseGUIWindowLockBut = guiCreateButton(10,118,108,25," Kilitle/Ac",false,theGameMenuTabPanelVehicleHouseTab)
  
  -- bank
  bankWindow = guiCreateWindow(201,104,290,287,"-- BANK NAME --",false)
  guiSetVisible (bankWindow,false)
  bankWindowDisplay = guiCreateEdit(0.0483,0.115,0.8897,0.108,"",true,bankWindow)
  guiEditSetReadOnly(bankWindowDisplay,true)
  bankWindow1 = guiCreateButton(0.0793,0.2404,0.1759,0.1638,"1",true,bankWindow)
  bankWindow2 = guiCreateButton(0.3,0.2404,0.1759,0.1638,"2",true,bankWindow)
  bankWindow3 = guiCreateButton(0.5241,0.2404,0.1759,0.1638,"3",true,bankWindow)
  bankWindow4 = guiCreateButton(0.0793,0.4425,0.1759,0.1638,"4",true,bankWindow)
  bankWindow5 = guiCreateButton(0.3,0.4425,0.1759,0.1638,"5",true,bankWindow)
  bankWindow6 = guiCreateButton(0.5241,0.4425,0.1759,0.1638,"6",true,bankWindow)
  bankWindow7 = guiCreateButton(0.0793,0.6481,0.1759,0.1638,"7",true,bankWindow)
  bankWindow8 = guiCreateButton(0.3034,0.6481,0.1759,0.1638,"8",true,bankWindow)
  bankWindow9 = guiCreateButton(0.5241,0.6481,0.1759,0.1638,"9",true,bankWindow)
  bankWindowClose = guiCreateButton(0.0793,0.8328,0.8448,0.0906,"Kapat",true,bankWindow)
  bankWindowStore = guiCreateButton(0.7448,0.2404,0.1759,0.1638,"Sakla",true,bankWindow)
  bankWindowWithdraw = guiCreateButton(0.7448,0.4425,0.1759,0.1638,"Para Cek",true,bankWindow)
  bankWindow0 = guiCreateButton(0.7448,0.6481,0.1759,0.1638,"0",true,bankWindow)
  
  -- Ammu Nation
  --theAmmuNationWindow = guiCreateWindow(0.0012,0.5633,0.2738,0.435,"Gun Store",true)
 -- guiSetVisible (theAmmuNationWindow,false)
 -- guiWindowSetMovable(theAmmuNationWindow,false)
  --guiWindowSetSizable(theAmmuNationWindow,false)
 -- theAmmuNationGridlist = guiCreateGridList(9,28,197,128,false,theAmmuNationWindow)
 -- guiGridListSetSelectionMode(theAmmuNationGridlist,0)
 -- theAmmuNationGridlistCol1 = guiGridListAddColumn(theAmmuNationGridlist,"Silah Adi",0.45)
 -- theAmmuNationGridlistCol2 = guiGridListAddColumn(theAmmuNationGridlist,"Mermi",0.15)
--  theAmmuNationGridlistCol3 = guiGridListAddColumn(theAmmuNationGridlist,"TL",0.2)
--  theAmmuNationBuyButton = guiCreateButton(9,162,198,40,"Satin Al!",false,theAmmuNationWindow)
--  theAmmuNationCloseButton = guiCreateButton(9,208,198,40,"Kapat",false,theAmmuNationWindow)
--  for i,v in ipairs (ammunation) do
--    local row = guiGridListAddRow (theAmmuNationGridlist)
--    guiGridListSetItemText (theAmmuNationGridlist,row,theAmmuNationGridlistCol1,v[1],false,false)
--    guiGridListSetItemText (theAmmuNationGridlist,row,theAmmuNationGridlistCol2,v[2],false,false)
--    guiGridListSetItemText (theAmmuNationGridlist,row,theAmmuNationGridlistCol3,v[3] .. "TL",false,true)
--  end
 -- ammuNationMarker = createMarker (295.91,-38.09,1000.51,"cylinder",1,0,255,255,127)
 -- setElementInterior (ammuNationMarker,1)
 -- setElementDimension (ammuNationMarker,1)
  
  -- refreshing player gridlist
  refreshPlayerGridlist()
  
  -- Widescreen
  --wideScreenGUI = guiCreateStaticImage(0,0,1,1,"images/widescreen.png",true,getRootElement())
  --guiMoveToBack (wideScreenGUI)
  
  -- taxi
  for i,v in ipairs (taxis) do
    local row = guiGridListAddRow (theGameMenuTabPanelTaxiTabGridlist)
    guiGridListSetItemText (theGameMenuTabPanelTaxiTabGridlist,row,theGameMenuTabPanelTaxiTabGridlistDestColumn,v[1],false,false)
    guiGridListSetItemText (theGameMenuTabPanelTaxiTabGridlist,row,theGameMenuTabPanelTaxiTabGridlistIDColumn,tostring(i),false,true)
    guiGridListSetItemText (theGameMenuTabPanelTaxiTabGridlist,row,theGameMenuTabPanelTaxiTabGridlistCashColumn,v[2] .. "$",false,false)
  end

-- © Cavorta

  -- home sytem
  _ = [[ Home system ]]
  -- buy/sell/enter button
  -- theHouseGUIWindow = guiCreateWindow(0.3088,0.275,0.3925,0.3433,"Ev Sistemi",true)
  -- guiWindowSetMovable(theHouseGUIWindow,false)
  -- guiWindowSetSizable(theHouseGUIWindow,false)
  -- guiSetVisible (theHouseGUIWindow,false)
  -- theHouseGUIEnterButton = guiCreateButton(0.0446,0.7816,0.2771,0.1748,"Eve Gir",true,theHouseGUIWindow)
  -- theHouseGUIBuyButton = guiCreateButton(0.3567,0.7816,0.2771,0.1748,"Evi Satin Al",true,theHouseGUIWindow)
  -- theHouseGUISellButton = guiCreateButton(0.6688,0.7816,0.2771,0.1748,"Evini Sat",true,theHouseGUIWindow)
  -- theHouseGUICloseButton = guiCreateButton(0.9172,0.1165,0.0541,0.0777,"x",true,theHouseGUIWindow)
  -- theHouseGUIOwnerLabel = guiCreateLabel(0.0255,0.165,0.3854,0.1214,"Sahibi",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUIOwnerLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUIOwnerLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUIOwnerLabel,"left",false)
  -- theHouseGUINumberLabel = guiCreateLabel(0.0255,0.5194,0.3854,0.1214,"Ev Numarasi",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUINumberLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUINumberLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUINumberLabel,"left",false)
  -- theHouseGUIPriceLabel = guiCreateLabel(0.0255,0.3447,0.3854,0.1214,"Evin Degeri",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUIPriceLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUIPriceLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUIPriceLabel,"left",false)
  -- theHouseGUIOwnerInfoLabel = guiCreateLabel(0.5,0.165,0.3854,0.1214,"-- Owner --",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUIOwnerInfoLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUIOwnerInfoLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUIOwnerInfoLabel,"left",false)
  -- theHouseGUIPriceInfoLabel = guiCreateLabel(0.5478,0.3447,0.3854,0.1214,"-- House Price --",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUIPriceInfoLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUIPriceInfoLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUIPriceInfoLabel,"left",false)
  -- theHouseGUINumberInfoLabel = guiCreateLabel(0.5032,0.5194,0.3854,0.1214,"-- Adress -- ",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUINumberInfoLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUINumberInfoLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUINumberInfoLabel,"left",false)
  -- theHouseGUIDollarLabel = guiCreateLabel(0.6815,0.3447,0.0732,0.1214,"TL",true,theHouseGUIWindow)
  -- guiLabelSetColor(theHouseGUIDollarLabel,255,255,255)
  -- guiLabelSetVerticalAlign(theHouseGUIDollarLabel,"center")
  -- guiLabelSetHorizontalAlign(theHouseGUIDollarLabel,"left",false)
  
theHouseGUIWindow = guiCreateWindow(185,369,343,207,"Ev Sistemi",false)
resim = guiCreateStaticImage(14,33,57,58,"images/ev-mixed-mta.png",false,theHouseGUIWindow)
theHouseGUIPriceLabel = guiCreateLabel(88,31,128,28,"Evin Degeri:",false,theHouseGUIWindow)
theHouseGUIPriceInfoLabel = guiCreateLabel(162,29,169,23,"",false,theHouseGUIWindow)
theHouseGUIOwnerLabel = guiCreateLabel(84,63,75,29,"Evin Sahibi:",false,theHouseGUIWindow)
theHouseGUINumberLabel = guiCreateLabel(82,93,59,23,"Ev NO:",false,theHouseGUIWindow)
theHouseGUINumberInfoLabel = guiCreateLabel(123,91,86,21,"",false,theHouseGUIWindow)
theHouseGUIEnterButton = guiCreateButton(13,145,101,32,"Eve Gir",false,theHouseGUIWindow)
theHouseGUIBuyButton = guiCreateButton(127,145,101,32,"Evi Satin Al",false,theHouseGUIWindow)
theHouseGUISellButton = guiCreateButton(236,145,98,32,"Evini Sat",false,theHouseGUIWindow)
theHouseGUICloseButton = guiCreateButton(303,24,29,22,"X",false,theHouseGUIWindow)
theHouseGUIDollarLabel = guiCreateLabel(213,33,41,24,"TL",false,theHouseGUIWindow)
theHouseGUIOwnerInfoLabel = guiCreateLabel(147,62,110,26,"",false,theHouseGUIWindow)
  guiWindowSetMovable(theHouseGUIWindow,false)
  guiWindowSetSizable(theHouseGUIWindow,false)
  guiSetVisible (theHouseGUIWindow,false)
    guiLabelSetColor(theHouseGUIOwnerLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUIOwnerLabel,"center")
  guiLabelSetHorizontalAlign(theHouseGUIOwnerLabel,"left",false)
    guiLabelSetColor(theHouseGUINumberLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUINumberLabel,"center")
  guiLabelSetHorizontalAlign(theHouseGUINumberLabel,"left",false)  
  guiLabelSetColor(theHouseGUIPriceLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUIPriceLabel,"center")
  guiLabelSetHorizontalAlign(theHouseGUIPriceLabel,"left",false)
    guiLabelSetColor(theHouseGUIOwnerInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUIOwnerInfoLabel,"center")
  guiLabelSetHorizontalAlign(theHouseGUIOwnerInfoLabel,"left",false)
    guiLabelSetColor(theHouseGUIPriceInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUIPriceInfoLabel,"bottom")
  guiLabelSetHorizontalAlign(theHouseGUIPriceInfoLabel,"left",false)
    guiLabelSetColor(theHouseGUINumberInfoLabel,255,255,255)
  guiLabelSetVerticalAlign(theHouseGUINumberInfoLabel,"bottom")
  guiLabelSetHorizontalAlign(theHouseGUINumberInfoLabel,"left",false)
    guiLabelSetColor(theHouseGUIDollarLabel,255,255,255)
  guiLabelSetHorizontalAlign(theHouseGUIDollarLabel,"left",false)
  guiLabelSetVerticalAlign(theHouseGUIDollarLabel,"center")
  
  -- Window with info
 theInsideHouseGUIWindow = guiCreateWindow(0.25,-0.025,0.5,0.1,"",true)
  guiSetVisible (theInsideHouseGUIWindow,false)
  guiWindowSetMovable(theInsideHouseGUIWindow,false)
  guiWindowSetSizable(theInsideHouseGUIWindow,false)
  theInsideHouseGUIWindowLockBut = guiCreateButton(10,21,153,30," -- Kilitle/Ac --",false,theInsideHouseGUIWindow)
  theInsideHouseGUIWindowLeaveBut = guiCreateButton(236,21,153,30,"Evden Ayril",false,theInsideHouseGUIWindow)
  -- einde home-system
  
  -- Banka göstergesi
  


 end)  


-- function PLAY ( button )
-- if ( button == "left" ) then
  -- if not ( guiGetText( guiGetSelectedTab( AnimTabPanel ) ) == "All" ) then
    -- valittu = guiGridListGetSelectedItem( AnimBestGrid )
    -- if ( valittu ) then
      -- local animi = guiGridListGetItemText(AnimBestGrid, valittu, AnimBestNameCol )
      -- local block = guiGridListGetItemText(AnimBestGrid, valittu, AnimBestBlockCol )
      -- local anim = guiGridListGetItemText(AnimBestGrid, valittu, AnimBestAnimCol )
      -- triggerServerEvent("animaatio", getLocalPlayer(), getLocalPlayer(), tostring( block ),tostring( anim ))
    -- end
  -- else
    -- valittu = guiGridListGetSelectedItem( AnimAllGrid )
    -- if ( valittu ) then
      -- local animi = guiGridListGetItemText(AnimAllGrid, valittu, AnimAllNameCol )
      -- local block = guiGridListGetItemText(AnimAllGrid, valittu, AnimAllBlockCol )
      -- local anim = guiGridListGetItemText(AnimAllGrid, valittu, AnimAllAnimCol )
      -- triggerServerEvent("animaatio", getLocalPlayer(), getLocalPlayer(), tostring( block ),tostring( anim ))
      -- end
    -- end
-- end

-- © Cavorta

addEvent ("lolmodOpenInfoWindow",true)
addEventHandler ("lolmodOpenInfoWindow",getRootElement(),
function(text)
  if (source == getLocalPlayer()) then
    guiSetText (jasmodInfoWindowMemo,text)
    guiSetVisible (jasmodInfoWindow,true)
	guiSetAlpha (jasmodInfoWindow,0.650)
    guiBringToFront (jasmodInfoWindow)
	setTimer(guiSetVisible, 2590,1, jasmodInfoWindow,false)
    if (isCursorShowing (getLocalPlayer())) then
      setElementData (getLocalPlayer(),"cursorshowing",true)
    else
      setElementData (getLocalPlayer(),"cursorshowing",false)
      -- showCursor (true,true)
    end
end
end)	

addEvent ("girisyazisi",true)
addEventHandler ("girisyazisi",getRootElement(),
function(text)
  if (source == getLocalPlayer()) then
    guiSetText (girisyazisi,text)
    guiBringToFront (girisyazisi)
 --   if (isCursorShowing (getLocalPlayer())) then
  --    setElementData (getLocalPlayer(),"cursorshowing",true)
 --   else
--      setElementData (getLocalPlayer(),"cursorshowing",false)
      --showCursor (true,true)
--    end
  end
end)

-- © Cavorta

addEventHandler ("onClientGUIClick",getRootElement(),
function(button,state,absx,absy)
  if (source == jasmodInfoWindowExitButton) then
    guiSetVisible (jasmodInfoWindow,false)
    if (getElementData (getLocalPlayer(),"cursorshowing") == false) then
      showCursor (false,false)
    end
  elseif (source == jasmodLoginWindowLoginButton) then
    local username = guiGetText (jasmodLoginWindowUsernameEdit)
    local password = guiGetText (jasmodLoginWindowPasswordEdit)
    if (username ~= "") and (password ~= "") then
      triggerServerEvent ("lolmodLoginPlayer",getLocalPlayer(),username,password)
    else
      triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"HATA!\nKullanici Adi ve sifreniz hatali!")
    end
  -- elseif (source == jasmodLoginWindowRegisterButton) then
    -- local username = guiGetText (jasmodLoginWindowUsernameEdit)
    -- local password = guiGetText (jasmodLoginWindowPasswordEdit)
    -- if (username ~= "") and (password ~= "") then
      -- triggerServerEvent ("lolmodRegisterPlayer",getLocalPlayer(),username,password)
    -- else
      -- triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Pardon,boyle kullanici adi ve sifre bulunamadi!\nLutfen tekrar kaydolunuz.")
    -- end
  elseif (source == jasmodCharSelectGameEnterButton) then
    if (guiGridListGetSelectedItem (jasmodCharSelectGridlist)) then
      r,c = guiGridListGetSelectedItem (jasmodCharSelectGridlist)
      local name = guiGridListGetItemText (jasmodCharSelectGridlist,r,c,false,false)
      guiSetText (theGameMenuTabPanelGeneralTabCharacterNameInfoLabel,name)
      triggerServerEvent ("lolmodSpawnCharacter",getLocalPlayer(),name)
      toggleControl ("chatbox",true)
	  guiSetVisible (jasmodCharCreateWindow,false)
    else
      triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Bir karakterin yok!\nYeni karakter Olustur!")
    end
  -- elseif (source == jasmodCharSelectNewCharacterButton) then
    -- guiSetVisible (jasmodCharCreateWindow,true)
    -- setCameraMatrix (-1505.55,1377.75,3,-1508.71,1372.91,4)
    -- if not (skinped) then
      -- skinped = createPed (math.random(0,288),-1508.71,1372.91,3.5)
      -- if not (skinped) then
        -- skinped = createPed (math.random(0,288),-1508.71,1372.91,3.5)
      -- end
    -- end
  -- elseif (source == jasmodCharCreateSkinLeftButton) then
    -- local skin = getElementModel (skinped)
    -- if (skin == 0) then setElementModel (skinped,288)
    -- elseif (skin == 7) then setElementModel (skinped,0)
    -- elseif (skin == 9) then setElementModel (skinped,7)
    -- elseif (skin == 43) then setElementModel (skinped,41)
    -- elseif (skin == 66) then setElementModel (skinped,64)
    -- elseif (skin == 75) then setElementModel (skinped,73)
    -- elseif (skin == 87) then setElementModel (skinped,85)
    -- elseif (skin == 120) then setElementModel (skinped,118)
    -- elseif (skin == 150) then setElementModel (skinped,148)
    -- elseif (skin == 209) then setElementModel (skinped,207)
    -- elseif (skin == 274) then setElementModel (skinped,164)
    -- else setElementModel (skinped,skin -1)
    -- end
  -- elseif (source == jasmodCharCreateSkinRightButton) then
    -- local skin = getElementModel (skinped)
    -- if (skin == 288) then setElementModel (skinped,0)
    -- elseif (skin == 0) then setElementModel (skinped,7)
    -- elseif (skin == 7) then setElementModel (skinped,9)
    -- elseif (skin == 41) then setElementModel (skinped,43)
    -- elseif (skin == 64) then setElementModel (skinped,66)
    -- elseif (skin == 73) then setElementModel (skinped,75)
    -- elseif (skin == 85) then setElementModel (skinped,87)
    -- elseif (skin == 118) then setElementModel (skinped,150)
    -- elseif (skin == 148) then setElementModel (skinped,148)
    -- elseif (skin == 207) then setElementModel (skinped,209)
    -- elseif (skin == 264) then setElementModel (skinped,274)
    -- else setElementModel (skinped,skin +1)
    -- end
  -- elseif (source == jasmodCharCreateAccountCreateButton) then
    -- local skin = getElementModel (skinped)
    -- local colorred = guiGetText (jasmodCharCreateNameTagRedEdit)
    -- local colorgreen = guiGetText (jasmodCharCreateNameTagGreenEdit)
    -- local colorblue = guiGetText (jasmodCharCreateNameTagBlueEdit)
    -- local charactername = guiGetText (jasmodCharCreateNameEdit)
	-- local karakteryasi = guiGetText (karakteredit)
    -- if (colorred ~= "") and (colorgreen ~= "") and (colobrlue ~= "") and (charactername ~= "") and (karakteryasi ~= "")	then
      -- guiSetVisible (jasmodCharCreateWindow,false)
      -- triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Yeni karakterin kaydedildi!Tekrar giris yap!")
      -- guiSetVisible (jasmodLoginWindow,true)
      -- guiSetVisible (jasmodCharSelectWindow,false)
      -- guiSetVisible (jasmodCharCreateWindow,false)
	  -- destroyElement (skinped)
      -- triggerServerEvent ("createNewCharacter",getLocalPlayer(),skin,colorred,colorgreen,colorblue,charactername,karakteryasi)
    -- else
      -- triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Bos yer birakma!")
    -- end
	-- elseif (source == kapatmatus ) then
	-- guiSetVisible (jasmodCharCreateWindow,false)
	-- guiSetVisible (jasmodCharSelectWindow,true)
	--setTimer(setCameraMatrix, 720,1, 1114.015625,-2019.54296875,90.161247253418,1107.015625,-2013.54296875,88.161247253418,0,70)
  elseif (source == theGameMenuTabPanelGeneralTabLogoutButton) then
    --triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"You are logged out succesfully")
    guiSetVisible (jasmodCharCreateWindow,false)
    guiSetVisible (jasmodLoginWindow,true)
    guiSetVisible (jasmodCharSelectWindow,false)
    guiSetVisible (jasmodCharCreateWindow,false)
    guiSetVisible (theGameMenuWindow,false)
    triggerServerEvent ("logoutPlayer",getLocalPlayer())
    showCursor (true,true)
    showChat (false)
    showPlayerHudComponent ("radar",false)
   fadeCamera (false)
   fadeCamera (true)
    setCameraMatrix ( -1651.5400390625,472.4580078125,87.372299194336,-1632.5400390625,524.4580078125,87.372299194336)
    enableWideScreen (getLocalPlayer())
  elseif (source == bankWindow1) then
    addIntoBankEditDisplay ("1")
  elseif (source == bankWindow2) then
    addIntoBankEditDisplay ("2")
  elseif (source == bankWindow3) then
    addIntoBankEditDisplay ("3")
  elseif (source == bankWindow4) then
    addIntoBankEditDisplay ("4")
  elseif (source == bankWindow5) then
    addIntoBankEditDisplay ("5")
  elseif (source == bankWindow6) then
    addIntoBankEditDisplay ("6")
  elseif (source == bankWindow7) then
    addIntoBankEditDisplay ("7")
  elseif (source == bankWindow8) then
    addIntoBankEditDisplay ("8")
  elseif (source == bankWindow9) then
    addIntoBankEditDisplay ("9")
  elseif (source == bankWindow0) then
    addIntoBankEditDisplay ("0")
  elseif (source == bankWindowClose) then
    guiSetVisible (bankWindow,false)
    guiSetText (bankWindowDisplay,"")
    showCursor (false,false)
  elseif (source == bankWindowStore) then
    triggerServerEvent ("bankStoreMoney",getLocalPlayer(),tonumber(guiGetText(bankWindowDisplay)))
  elseif (source == bankWindowWithdraw) then
    triggerServerEvent ("bankWithdrawMoney",getLocalPlayer(),tonumber(guiGetText(bankWindowDisplay)))
  elseif (source == theGameMenuTabPanelGeneralTabFixCarButton) then
    triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"fix")
  elseif (source == theGameMenuTabPanelGeneralTabFlipCarButton) then
    triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"flip")
  elseif (source == theGameMenuTabPanelPlayersTabPlayerRefreshListButton) then
    refreshPlayerGridlist ()
 -- elseif (source == wideScreenGUI) then
  --  guiMoveToBack (wideScreenGUI)
  elseif (source == theGameMenuTabPanelTaxiTabTaxiButton) then
    local row,col = guiGridListGetSelectedItem (theGameMenuTabPanelTaxiTabGridlist)
    taxiPlayer (getLocalPlayer(),tonumber(guiGridListGetItemText(theGameMenuTabPanelTaxiTabGridlist,row,col)))
  elseif (source == theGameMenuTabPanelPlayersTabPlayerGetInfoButton) then
    local r,c = guiGridListGetSelectedItem (theGameMenuTabPanelPlayersTabPlayerGridlist)
    if r and c and (guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)) then
      local playernametext = guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)
      triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"getPlayerInfo",playernametext)
    end
  elseif (source == theGameMenuTabPanelPlayersTabGetInfoWindowInfoCloseButton) then
    guiSetVisible (theGameMenuTabPanelPlayersTabGetInfoWindow,false)
  elseif (source == theGameMenuTabPanelPlayersTabPlayerCarGotoButton) then
    if (isPedInVehicle (getLocalPlayer())) then
      local r,c = guiGridListGetSelectedItem (theGameMenuTabPanelPlayersTabPlayerGridlist)
      if r and c and (guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)) then
        local playernametext = guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)
        triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"carGocenterlayer",playernametext)
      end
    else
      outputChatBox ("Oyuncu Araba içerisinde deðil",getRootElement(),255,0,0)
	  --triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Oyuncu Araba icerisinde degil!.")
    end
  elseif (source == theGameMenuTabPanelPlayersTabPlayerGotoButton) then
    if not (isPedInVehicle (getLocalPlayer())) then
      local r,c = guiGridListGetSelectedItem (theGameMenuTabPanelPlayersTabPlayerGridlist)
      if r and c and (guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)) then
        local playernametext = guiGridListGetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,r,c)
        triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"gocenterlayer",playernametext)
      end
    else
      outputChatBox ("Bu fonksiyon arac icinde gerceklesir!\nYou can Car goto him better!",getRootElement(),255,02,0)
	  --triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Bu fonksiyon arac icinde gerceklesir!\nYou can Car goto him better!")
    end
 -- elseif (source == theAmmuNationBuyButton) then
 --   local r,c = guiGridListGetSelectedItem (theAmmuNationGridlist)
   -- if r then
     -- local weaponName = guiGridListGetItemText (theAmmuNationGridlist,r,1)
     -- local weaponTable = findWeaponbyAmmuNationName (weaponName)
    --  if (weaponTable) then
      --  triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"ammunationbuy",weaponTable[1],weaponTable[2],weaponTable[3],weaponTable[4])
     -- else
      --  triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"ERROR!")
     -- end
    --else
   --   triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Lutfen ilk silahini sec!")
 --   end
  elseif (source == theAmmuNationCloseButton) then
    guiSetVisible (theAmmuNationWindow,false)
    showCursor (false,false)
  elseif (source == theGameMenuTabPanelVHTabHouseTeleportButton) then
    local housenumber = guiGetText (theGameMenuTabPanelVHTabHouseNumberInfoLabel)
    triggerServerEvent ("gameMenuButtonClick",getLocalPlayer(),"warpToHouse",housenumber)
  end
end)

-- © Cavorta

addEvent ("lolmodOpenCharacterSelectWindow",true)
addEventHandler ("lolmodOpenCharacterSelectWindow",getRootElement(),
function(username,char1,char2,char3)
  if (source == getLocalPlayer()) then
    guiGridListClear (jasmodCharSelectGridlist)
    guiSetVisible (jasmodLoginWindow,false)
    guiSetVisible (jasmodCharSelectWindow,true)
    if (char1) then
      local row = guiGridListAddRow (jasmodCharSelectGridlist)
      guiGridListSetItemText (jasmodCharSelectGridlist,row,characternameColumn,char1,false,false)
    end
    if (char2) then
      local row = guiGridListAddRow (jasmodCharSelectGridlist)
      guiGridListSetItemText (jasmodCharSelectGridlist,row,characternameColumn,char2,false,false)
    end
    if (char3) then
      local row = guiGridListAddRow (jasmodCharSelectGridlist)
      guiGridListSetItemText (jasmodCharSelectGridlist,row,characternameColumn,char3,false,false)
    end
  end
end)

addEvent ("lolmodHideCharacterSelectWindow",true)
addEventHandler ("lolmodHideCharacterSelectWindow",getRootElement(),
function()
  guiSetVisible (jasmodCharSelectWindow,false)
  showCursor (false,false)
  showChat (true)
  --showPlayerHudComponent ("radar",true)
  disableWideScreen (source)
end)

-- © Cavorta

function refreshGameMenuBankAndCash (cash,bank,housenumber)
  if (source == getLocalPlayer()) then
    if (cash) then
      guiSetText (theGameMenuTabPanelGeneralTabCashInfoLabel," TL" .. tostring(cash))
    end
    if (bank) then
      guiSetText (theGameMenuTabPanelGeneralTabBankInfoLabel," TL" .. tostring(bank))
    end
    if (housenumber) then
      guiSetText (theGameMenuTabPanelVHTabHouseNumberInfoLabel,tostring(housenumber))
    end
  end
end
addEvent ("lolmodRefreshBankInfoMenu",true)
addEventHandler ("lolmodRefreshBankInfoMenu",getRootElement(),refreshGameMenuBankAndCash)

-- © Cavorta

function addIntoBankEditDisplay (number)
  local text = guiGetText (bankWindowDisplay)
  guiSetText (bankWindowDisplay, text .. "" .. number)
end 

addEvent ("openBankWindow",true)
addEventHandler ("openBankWindow",getRootElement(),
function(bankname)
  guiSetText (bankWindow,bankname)
  guiSetVisible (bankWindow,true)
  showCursor (true,true)
end)

function refreshPlayerGridlist ()
  guiGridListClear (theGameMenuTabPanelPlayersTabPlayerGridlist)
  for i,v in ipairs (getElementsByType ("player")) do
    local row = guiGridListAddRow (theGameMenuTabPanelPlayersTabPlayerGridlist)
    if (getPlayerNametagColor (v)) then
      guiGridListSetItemText (theGameMenuTabPanelPlayersTabPlayerGridlist,row,theGameMenuTabPanelPlayersTabPlayerColumn,getPlayerNametagText (v),false,false)
    end
  end
end 

addEventHandler ("onClientPlayerJoin",getRootElement(),function() refreshPlayerGridlist() end)

-- © Cavorta

-- Widescreen Functions
--function enableWideScreen (player)
--  if (getLocalPlayer() == player) then
 --   guiSetVisible (wideScreenGUI,true)
  --  guiMoveToBack (wideScreenGUI)
--  end
--end

-- © Cavorta

--function disableWideScreen (player)
--  if (getLocalPlayer() == player) then
 --   guiSetVisible (wideScreenGUI,false)
 -- end
--end 

-- TAXI!
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
        triggerServerEvent ("bringPlayerToTaxiDestination",player,name,cost,x,y,z)
      else
      end
    else
end 
end
end

-- © Cavorta

addEvent ("gameMenuShowPlayerInfo",true)
addEventHandler ("gameMenuShowPlayerInfo",getRootElement(),
function(accountname,charactername,cash,bank,goto,karakteryasi)
  guiSetText (theGameMenuTabPanelPlayersTabGetInfoWindowInfoLabelPlayerInfo,"\n" .. accountname .. "\n\n" .. charactername .. "\n\n\n" .. cash .. " TL\n\n" .. bank .. " TL\n\n" .. goto .. "\n\n" .. karakteryasi)
  guiSetVisible (theGameMenuTabPanelPlayersTabGetInfoWindow,true)
end)

-- godmode stuff
-- addEvent("enableGodMode", true)
-- addEvent("disableGodMode", true)
-- addEventHandler ("enableGodMode", getRootElement(), 
-- function()
  -- addEventHandler ("onClientPlayerDamage", getRootElement(), cancelEventEvent)
-- end)

-- addEventHandler ("disableGodMode", getRootElement(), 
-- function()
  -- removeEventHandler ("onClientPlayerDamage", getRootElement(), cancelEventEvent)
-- end)

-- function cancelEventEvent () cancelEvent() end 

-- ammu nation
addEventHandler ("onClientMarkerHit",getRootElement(),
function(hitElement,matchingDimension)
  if (getElementType (hitElement) == "player") and (hitElement == getLocalPlayer()) then
    if (source == ammuNationMarker) then
      showCursor (true,true)
      guiSetVisible (theAmmuNationWindow,true)
    end
  end
end)

function findWeaponbyAmmuNationName (name)
  for i,v in ipairs (ammunation) do
    if (v[1] == name) then
      return v 
    end
  end
end 

addEventHandler ("onClientResourceStart",getResourceRootElement(getThisResource()),
function()
  x,y = guiGetScreenSize ()
  if (x < 800) and (y < 600) then
    outputChatBox ("Hello! we see you are using a screen resolution this gamemode isn't made for!\nPlease change this to 800x600 or bigger.\n\nYou can still play the game. But things might work because we haven't tested this!\nWhen you want to play, and inogre our recommerends, we have no problems with that. But when you're stuck, We don't help you :D\nGood luck with dieing :D",getRootElement(),255,0,255)
	--triggerEvent ("lolmodOpenInfoWindow",getLocalPlayer(),"Hello! we see you are using a screen resolution this gamemode isn't made for!\nPlease change this to 800x600 or bigger.\n\nYou can still play the game. But things might work because we haven't tested this!\nWhen you want to play, and inogre our recommerends, we have no problems with that. But when you're stuck, We don't help you :D\nGood luck with dieing :D")
  end
end)

-- © Cavorta


addEvent ("viewHouseGUIwindow",true)
addEventHandler ("viewHouseGUIwindow",getRootElement(),
function(owner,price,housenumber)
  if (source == getLocalPlayer()) then
    guiSetText (theHouseGUIOwnerInfoLabel,owner)
    guiSetText (theHouseGUIPriceInfoLabel,price)
    guiSetText (theHouseGUINumberInfoLabel,housenumber)
    guiSetVisible (theHouseGUIWindow,true)
    showCursor (true,true)
  end
end)

-- © JasperNL=D

addEventHandler ("onClientGUIClick",getRootElement(),
function(button,state,absX,absY)
  if (source == theHouseGUICloseButton) then
    guiSetVisible (theHouseGUIWindow,false)
    showCursor (false,false)
  elseif (source == theHouseGUIEnterButton) then
    local housenumber = guiGetText (theHouseGUINumberInfoLabel)
    triggerServerEvent ("HouseSystemEnterHouse",getLocalPlayer(),housenumber)
  elseif (source == theHouseGUIBuyButton) then
    local housenumber = guiGetText (theHouseGUINumberInfoLabel)
    triggerServerEvent ("HouseSystemBuyHouse",getLocalPlayer(),housenumber)
  elseif (source == theHouseGUISellButton) then
    local housenumber = guiGetText (theHouseGUINumberInfoLabel)
    triggerServerEvent ("HouseSystemSellHouse",getLocalPlayer(),housenumber)
  elseif (source == theInsideHouseGUIWindowLeaveBut) then
    triggerServerEvent ("HouseSystemLeaveHouse",getLocalPlayer())
    guiSetVisible (theInsideHouseGUIWindow,false)
  elseif (source == theInsideHouseGUIWindowLockBut) then
    if not (guiGetText (theInsideHouseGUIWindowLockBut) == "Owner-Only!") then
      triggerServerEvent ("HouseSystemLockHouse",getLocalPlayer(),guiGetText(theInsideHouseGUIWindowLockBut))
    end
    if (guiGetText (theInsideHouseGUIWindowLockBut) == "lock") then
      guiSetText (theInsideHouseGUIWindowLockBut,"unlock")
    elseif (guiGetText (theInsideHouseGUIWindowLockBut) == "unlock") then
      guiSetText (theInsideHouseGUIWindowLockBut,"lock")
    else
      --outputChatBox ("This isn't your house, so you can't lock or unlock it!",255,0,0,false)
	  --triggerClientEvent ("lolmodOpenInfoWindow",source,"
    end
  end
end)

addEvent ("hideHouseGuiWindow",true)
addEventHandler("hideHouseGuiWindow",getRootElement(),
function()
  if (source == getLocalPlayer()) then
    guiSetVisible (theHouseGUIWindow,false)
    showCursor (false,false)
  end
end)

-- © JasperNL=D

addEvent ("enterHouseOpenGuiWindow",true)
addEventHandler("enterHouseOpenGuiWindow",getRootElement(),
function(lockstate)
  if (source == getLocalPlayer()) then
    guiSetVisible (theHouseGUIWindow,false)
    showCursor (false,false)
    guiSetVisible (theInsideHouseGUIWindow,true)
    if (lockstate == "unsold") then
--      guiSetText (theHomeStateInfoLabel,"unsold - open")
      guiSetText (theInsideHouseGUIWindowLockBut,"Owner-Only!")
    elseif (lockstate == "lock") then
--      guiSetText (theHomeStateInfoLabel,"locked")
      guiSetText (theInsideHouseGUIWindowLockBut,"unlock")
    elseif (lockstate == "unlock") then
--      guiSetText (theHomeStateInfoLabel,"open")
      guiSetText (theInsideHouseGUIWindowLockBut,"lock")
    end
  end
end)


function guiClick (button, state, absoluteX, absoluteY)
  if (source == theGameMenuTabPanelVHTabVehicleSpawnCarOne) then
    triggerServerEvent ("getirt", getLocalPlayer())
  end
end
addEventHandler ("onClientGUIClick", getRootElement(), guiClick)

giris = guiCreateStaticImage(203,502,500,100,"images/giris.png",false)
guiSetVisible (giris,false)

addEvent ("girisp", true)
function otopen ()
  if (getLocalPlayer() == source) then
  setTimer (guiSetVisible, 1000,1,giris, true)
  setTimer (guiSetAlpha, 1000,1,giris, 0.2)
  setTimer (guiSetAlpha, 1500,1,giris, 0.3)
  setTimer (guiSetAlpha, 2000,1,giris, 0.4)
  setTimer (guiSetAlpha, 2500,1,giris, 0.5)
  setTimer (guiSetAlpha, 3000,1,giris, 0.6)
  setTimer (guiSetAlpha, 3500,1,giris, 0.7)
  setTimer (guiSetAlpha, 4000,1,giris, 0.8)
  setTimer (guiSetAlpha, 4500,1,giris, 0.9)
  setTimer (guiSetAlpha, 5000,1,giris, 1)
  setTimer (guiSetAlpha, 8000,1,giris, 0.9)
  setTimer (guiSetAlpha, 8500,1,giris, 0.8)
  setTimer (guiSetAlpha, 9000,1,giris, 0.7)
  setTimer (guiSetAlpha, 9500,1,giris, 0.6)
  setTimer (guiSetAlpha, 10000,1,giris, 0.5)
  setTimer (guiSetAlpha, 10500,1,giris, 0.4)
  setTimer (guiSetAlpha, 11000,1,giris, 0.3)
  setTimer (guiSetAlpha, 11500,1,giris, 0.2)
 setTimer (guiSetVisible, 13500,1,giris,false)
  end
end
addEventHandler ("girisp", getRootElement(), otopen)