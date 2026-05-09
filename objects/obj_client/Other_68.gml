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

array_push(global.messageLog, "!!! Connection: " + string(_asyncString))


if (_type == network_type_data)
{
	array_push(global.messageLog, "!!! Data Data Data! " + string(_socket))
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	var _read = buffer_read(_buffer, buffer_u16 )
	
	array_push(global.messageLog, "!!! Server Epoch: " + string(_read));
}
