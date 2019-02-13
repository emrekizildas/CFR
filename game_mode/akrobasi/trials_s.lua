local gRoot = getRootElement();

addEvent( 'doTrickAnimation', true );

addEventHandler( 'doTrickAnimation', gRoot,
  function ( block, name, loop )
    block = block or nil;
    name = name or nil;
    loop = loop or false;
    
    setPedAnimation( source, block, name, -1, loop, false, false );
  end
);