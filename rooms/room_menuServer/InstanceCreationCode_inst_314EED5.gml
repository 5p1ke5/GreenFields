
var _clickFunction = function()
{
	room_goto(ROOM_MULTIPLAYER);
	network_destroy(global.socketSelf);
}

button_initialize("Back", _clickFunction);