
var _clickFunction = function()
{
	room_goto(ROOM_MULTIPLAYER);

	//Sends out packet with rejection
	var _buffer = buffer_create(8, buffer_fixed, 1);
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u8, REMATCH.REJECTED);
	network_send_packet(global.socketOther, _buffer, buffer_tell(_buffer))
	buffer_delete(_buffer);
}

button_initialize("Back", _clickFunction);