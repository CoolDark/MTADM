---------------
-- Author:  Disinterpreter
-- License: MIT License
-- Copyright:   (c) 2014
-- Script:  MTADM
---------------

function RPCAccountDataLogIn( sLogin, sPasswd )
	if not pregFind( sLogin, "^[a-zA-Z0-9]{3,}$" ) or not pregFind( sPasswd, "^[a-zA-Z0-9]{3,}$" ) then
		local sError = "Error 1: Login or Password has not english characters or numbers"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end
	if( sLogin:len() <= 2 or sPasswd:len() <= 2 ) then
		local sError = "Error 0: Login or Password has little characters"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end 
	local pAccount = Account.create( sLogin )
	if pAccount == false then
		local sError = "Error 2: Account does not exist"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end
	--client:logIn( pAccount, sPasswd )
	local bLogin = logIn( client, pAccount, sPasswd )
	if bLogin then
		triggerClientEvent( "onRecvdAccountFinish", client )
	end
end
addEvent( "onSendAccountDataLogIn", true )
addEventHandler( "onSendAccountDataLogIn", root, RPCAccountDataLogIn )

function RPCAccountDataReg( sLogin, sPasswd )
	if not pregFind( sLogin, "^[a-zA-Z0-9]{3,}$" ) or not pregFind( sPasswd, "^[a-zA-Z0-9]{3,}$" ) then
		local sError = "Error 1: Login or Password has not english characters or numbers"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end
	if( sLogin:len() <= 2 or sPasswd:len() <= 2 ) then
		local sError = "Error 0: Login or Password has little characters"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end 
	local pAccount = Account.create( sLogin )
	if pAccount then
		local sError = "Error 3: Account does exist"
		triggerClientEvent( "onRecvdAccountData", client, sError )
		return 1;
	end
	Account.add( sLogin, sPasswd )
	outputChatBox( "You account has registered", client )
end
addEvent( "onSendAccountDataReg", true )
addEventHandler( "onSendAccountDataReg", root, RPCAccountDataReg )