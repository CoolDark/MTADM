---------------
-- Author:  Disinterpreter
-- License: MIT License
-- Copyright:   (c) 2014
-- Script:  MTADM
---------------

Panel = {
    button = {},
    window = {},
    label = {},
    edit = {}
}
showCursor(true)
Panel.window[1] = GuiWindow.create( 419, 363, 413, 305, "", false )
Panel.window[1]:setSizable( false )
Panel.edit[1] = GuiEdit.create( 179, 154, 182, 28, "", false, Panel.window[1] )
Panel.edit[2] = GuiEdit.create( 179, 192, 182, 28, "", false, Panel.window[1] )
Panel.button[1] = GuiButton.create( 39, 247, 130, 48, "login", false, Panel.window[1] )
Panel.button[2] = GuiButton.create( 241, 247, 130, 48, "register", false, Panel.window[1] )
Panel.label[1] = GuiLabel.create( 133, 159, 36, 17, "Login:", false, Panel.window[1] )
Panel.label[2] = GuiLabel.create( 114, 197, 55, 18, "Password:", false, Panel.window[1] )
Panel.label[3] = GuiLabel.create( 35, 58, 336, 57, "LOGIN PANEL", false, Panel.window[1] )
Panel.label[3]:setFont( "sa-header" )
Panel.edit[2]:setMasked(true)
Panel.edit[1]:setText( localPlayer:getName() )

addEventHandler( "onClientGUIClick", Panel.button[1], 
    function ()
        local sLogin = Panel.edit[1]:getText()
        local sPasswd = Panel.edit[2]:getText()
        triggerServerEvent( "onSendAccountDataLogIn", localPlayer, sLogin, sPasswd )
    end
, false)

addEventHandler( "onClientGUIClick", Panel.button[2], 
    function ()
        local sLogin = Panel.edit[1]:getText()
        local sPasswd = Panel.edit[2]:getText()
        triggerServerEvent( "onSendAccountDataReg", localPlayer, sLogin, sPasswd )
    end
, false)

function RPCRecvAccountFinish()
    showCursor( false )
    Panel.window[1]:setVisible(false)
end
addEvent( "onRecvdAccountFinish", true )
addEventHandler( "onRecvdAccountFinish", root, RPCRecvAccountFinish )

function RPCRecvAccountData( sError )
    outputChatBox( sError )
end
addEvent( "onRecvdAccountData", true )
addEventHandler( "onRecvdAccountData", root, RPCRecvAccountData )