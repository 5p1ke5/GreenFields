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

show_debug_message("Type: " + string(_type));
show_debug_message("ID: " + string(_id));
show_debug_message("IP: " + string(_ip));
show_debug_message("Port: " + string(_port));
show_debug_message("Socket: " + string(_socket));

if (_id == serverSocket)
{
	switch (_type) 
	{    
		case network_type_connect:
			array_push(sockets, _socket);
			show_debug_message("!!! Socket connected! " + string(sockets));
	        break;
		case network_type_disconnect:
			array_delete(sockets, array_get_index(sockets, _socket), 1);
			show_debug_message("!!! Socket disconnected! " + string(sockets));
	        break;
	}
}

if (_type == network_type_data)
{
	show_debug_message("!!! Data Data Data! " + string(serverSocket));
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	var _read = buffer_read(_buffer, buffer_u16 )
	
	show_debug_message("!!! Epoch: " + string(_read));
	
	
}
