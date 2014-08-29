---------------
-- Author:      Disinterpreter
-- License:     MIT License
-- Copyright:   (c) 2014
-- Script:      MTADM
---------------


addEventHandler( "onPlayerLogin", root, 
	function ()
		triggerClientEvent( "onRecvdAccountFinish", source )
		local x,y,z = aPlayerSpawn[ math.random (#aPlayerSpawn) ][1],aPlayerSpawn[ math.random (#aPlayerSpawn) ][2],aPlayerSpawn[ math.random (#aPlayerSpawn) ][3]
		source:spawn( x, y, z )
		source:fadeCamera( true )
		source:setCameraTarget()
	end
)

addEventHandler( "onResourceStop", root, 
	function ()
		for k,pPlayer in ipairs( getElementsByType( "player" ) ) do
			pPlayer:logOut()
			pPlayer:fadeCamera( false )
		end
	end
)