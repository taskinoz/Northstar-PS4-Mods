global function InitDirectConnectMenu

struct
{
  var menu
} file


void function InitDirectConnectMenu()
{
  file.menu = GetMenu( "DirectConnectMenu" )

  AddMenuFooterOption( file.menu, BUTTON_B, "#B_BUTTON_BACK", "#BACK" )


  AddButtonEventHandler( Hud_GetChild( file.menu, "ConnectButton"), UIE_CLICK, ConnectButton_Activate )
}

void function ConnectButton_Activate( var button )
{
  // TextEntry no likey ":" so had to divide them and do funky logic
  string ip = Hud_GetUTF8Text( Hud_GetChild( file.menu, "ConnectIPTextEntry" ) )
  string port = Hud_GetUTF8Text( Hud_GetChild( file.menu, "ConnectPortTextEntry" ) )

  bool usePort = port == "" ? false : true

  string server = ip + (usePort ? ":" + port : "")

  print( "[DIRECT-CONNECT]: Connecting to '" + server + "'" )
  ClientCommand( "connect " + server )
}
