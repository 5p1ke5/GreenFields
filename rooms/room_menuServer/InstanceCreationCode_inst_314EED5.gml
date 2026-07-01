
var _clickFunction = function()
{
	room_goto(ROOM_MULTIPLAYER);
	network_destroy(global.socketSelf);
}

uibutton_initialize("Back", _clickFunction);