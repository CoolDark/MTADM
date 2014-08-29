---------------
-- Author:      Disinterpreter
-- License:     MIT License
-- Copyright:   (c) 2014
-- Script:      MTADM
---------------

addEventHandler( "onPlayerLogout", root,
	function(acc)
		local iMoney = source:getMoney()
		local iSkin = source:getModel()
		acc:setData( "mtadm.money", tostring( iMoney ) )
		acc:setData( "mtadm.skin", tostring( iSkin ) )
	end 
)

addEventHandler( "onPlayerLogin", root,
	function ( _, acc )
		local iMoney = acc:getData( "mtadm.money" )
		local iSkin = acc:getData( "mtadm.skin" )
		if iMoney == false then 
			source:setMoney(2000)
			source:setModel(23)
			return
		end
		source:setMoney( tonumber( iMoney ) )
		source:getModel( tonumber( iSkin ) )
	end
)

-- addCommandHandler( "givemoney", 
-- 	function ( pPlayer, cmd, sCount )
--  		local iCount = tonumber( sCount )
--  		pPlayer:giveMoney(iCount)
-- 	end
-- )