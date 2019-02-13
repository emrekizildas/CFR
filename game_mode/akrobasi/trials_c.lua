local gMe   = getLocalPlayer();
local gRoot = getRootElement();

local minus = false;
local plus  = false;

local bikes = { ['NRG-500']=true, ['PCJ-600']=true, ['FCR-900']=true, ['BF-400']=true, ['Sanchez']=true };

addEventHandler( 'onClientPreRender', gRoot,
  function ()
    local bike = getPedOccupiedVehicle( gMe );
    if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
      local rx, ry, rz  = getElementRotation( bike );
      setElementRotation( bike, rx, 0, rz );
    end;
  end
);

addEventHandler( 'onClientResourceStart', gRoot,
  function ( res )
    if res == getThisResource() then
      bindKey( 'arrow_d', 'both', preRotation );
      bindKey( 'arrow_u', 'both', preRotation );
      
      bindKey( '1', 'both', trick_Leggs );
      bindKey( '2', 'both', trick_Leggs );
      bindKey( '3', 'both', trick_Dive );
      bindKey( '4', 'both', trick_Stay );
      bindKey( '5', 'both', trick_Seat180 );
      
    end;
  end
);

function preRotation( key, keyState )
  if key == 'arrow_d' then
    if keyState == 'down'then
      if not minus then
        minus = true;
        addEventHandler( 'onClientPreRender', gRoot, minusRotation );
      end;
    else
      minus = false;
      removeEventHandler( 'onClientPreRender', gRoot, minusRotation );
    end;
  elseif key == 'arrow_u' then
    if keyState == 'down'then
      if not plus then
        plus = true;
        addEventHandler( 'onClientPreRender', gRoot, plusRotation );
      end;
    else
      plus = false;
      removeEventHandler( 'onClientPreRender', gRoot, plusRotation );
    end;
  end;
end;

function minusRotation()
  local bike = getPedOccupiedVehicle( gMe );
  if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
    local rx, ry, rz = getElementRotation( bike );
    setElementRotation( bike, rx + 2.5, ry, rz );
  end;
end;

function plusRotation()
  local bike = getPedOccupiedVehicle( gMe );
  if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
    local rx, ry, rz = getElementRotation( bike );
    setElementRotation( bike, rx - 2.5, ry, rz );
  end;
end;

addEventHandler( 'onClientPlayerDamage', gMe,
  function ()
    local vehicle = getPedOccupiedVehicle( gMe );
    if vehicle then
      local vx, vy, vz = getVehicleTurnVelocity( vehicle );
      setVehicleTurnVelocity( vehicle, vx + 1, vy, 0.5 );
      local evx, evy, evz = getElementVelocity( vehicle );
      setElementVelocity( vehicle, evx, evy, evz + 0.5 );
      setTimer( function ()
        setGravity( 0.002 );
        setTimer( setGravity, 1000, 1, 0.008 );
      end, 100, 1 );
    end;
  end
);

function trick_Leggs( key, keyState )
  if keyState == 'down' then
    local bike = getPedOccupiedVehicle( gMe );
    if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
      local legg;
      if key == '1' then legg = 'bmx_left'; elseif key == '2' then legg = 'bmx_right'; end;
      triggerServerEvent( 'doTrickAnimation', gMe, 'bmx', legg, false );
      isStunted = true;
    end;
  else
    trick_End();
  end;
end;

function trick_Dive( key, keyState )
  if keyState == 'down' then
    local bike = getPedOccupiedVehicle( gMe );
    if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
      triggerServerEvent( 'doTrickAnimation', gMe, 'parachute', 'fall_skydive', true );
      isStunted = true;
    end;
  else
    trick_End();
  end;
end;

function trick_Stay( key, keyState )
  if keyState == 'down' then
    local bike = getPedOccupiedVehicle( gMe );
    if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
      triggerServerEvent( 'doTrickAnimation', gMe, 'shop', 'shp_jump_land', false );
      isStunted = true;
    end;
  else
    trick_End();
  end;
end;

function trick_Seat180( key, keyState )
  if keyState == 'down' then
    local bike = getPedOccupiedVehicle( gMe );
    if bike and not isVehicleOnGround( bike ) and bikes[getVehicleNameFromModel( getElementModel(bike) )] then
      triggerServerEvent( 'doTrickAnimation', gMe, 'crib', 'crib_console_loop', false );
      isStunted = true;
    end;
  else
    trick_End();
  end;
end;

function trick_End()
  local bike = getPedOccupiedVehicle( gMe );
  if bike and not isVehicleOnGround( bike ) then
    local bn = getVehicleNameFromModel( getElementModel( bike ) );
    if bn == 'NRG-500' or bn == 'PCJ-600' or bn == 'FCR-900' or bn == 'BF-400' then
      triggerServerEvent( 'doTrickAnimation', gMe, 'bikes', 'bikes_ride', false );
    elseif bn == 'Sanchez' then
      triggerServerEvent( 'doTrickAnimation', gMe, 'biked', 'biked_ride', false );
    end;
  end;
  isStunted = false;
end;

addEventHandler( 'onClientRender', gRoot,
  function ()
    local bike = getPedOccupiedVehicle( gMe );
    if bike and isVehicleOnGround( bike ) then
      if isStunted == true then
        local bn = getVehicleNameFromModel( getElementModel( bike ) );
        if bn == 'NRG-500' or bn == 'PCJ-600' or bn == 'FCR-900' or bn == 'BF-400' then
          triggerServerEvent( 'doTrickAnimation', gMe, 'bikes', 'bikes_ride', false );
          trick_End();
        elseif bn == 'Sanchez' then
          triggerServerEvent( 'doTrickAnimation', gMe, 'biked', 'biked_ride', false );
          trick_End();
        end;
      end;
    end;
  end
);