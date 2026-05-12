var _type = ds_map_find_value(async_load, "type"); //Type of connection. Can be one of these:
/*
network_type_connect 				1
network_type_disconnect				2
network_type_data 					3
network_type_non_blocking_connect	4
*/

var _id = ds_map_find_value(async_load, "id"); //ID of the socket that sent the event.
var _ip = ds_map_find_value(async_load, "ip"); //IP address of the socket.
var _port = ds_map_find_value(async_load, "port"); //Port number of the socket.
var _socket = ds_map_find_value(async_load, "socket");  //Socket number on the list

var _asyncString =	"Type: "	+ string(_type)	+
					" ID: "		+ string(_id)	+
					" IP: "		+ string(_ip)	+
					" Port: "	+ string(_port) +
					" Socket: " + string(_socket);


show_debug_message("!!! Connection: " + string(_asyncString))

if (_type == network_type_data) //Receives packet with input data.
{
	show_debug_message("!!! Data Acquired: " + string(_socket))
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	var _aButtonPressed = buffer_read(_buffer, buffer_bool);
	var _aButton = buffer_read(_buffer, buffer_bool);
	var _rightButton = buffer_read(_buffer, buffer_bool);
	var _leftButton = buffer_read(_buffer, buffer_bool);
	var _runButton = buffer_read(_buffer, buffer_bool);
	var _mLeftButton = buffer_read(_buffer, buffer_bool);
	var _mRightButton = buffer_read(_buffer, buffer_bool);
	var _mLeftButtonReleased = buffer_read(_buffer, buffer_bool);
	var _mRightButtonReleased = buffer_read(_buffer, buffer_bool);
	var _mouseX = buffer_read(_buffer, buffer_s16);
	var _mouseY = buffer_read(_buffer, buffer_s16);
	buffer_delete(_buffer);
	show_debug_message("!!! Controller Data - A Pressed " + string(_aButtonPressed) + 
						"A Button " + string(_aButton) + 
						"Right " + string(_rightButton) + 
						"Left " + string(_leftButton));
}