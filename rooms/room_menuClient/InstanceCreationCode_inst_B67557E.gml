
var _clickFunction = function()
{
	var _textField = inst_ipField;
	with (_textField)
	{
		var _ip = text;	
	}
	
	
	global.socketSelf = network_create_socket(network_socket_tcp);
	array_push(global.messageLog, "!!! client socket: " + string(global.socketSelf))
	
	
	global.socketOther = network_connect(global.socketSelf, _ip, 6510);
	if (global.socketOther < 0)
	{
		array_push(global.messageLog, "!!! connection error! " + string(global.socketOther))
	}
	else
	{
		array_push(global.messageLog, "!!! Connection: " + string(global.socketOther))
		room_goto(room_deathmatchClient);
	}
	
	/*
	var _connect = network_connect(global.socketSelf, _ip, 6510);
	if (_connect < 0)
	{
		array_push(global.messageLog, "!!! connection error! " + string(_connect))
	}
	else
	{
		array_push(global.messageLog, "!!! Connection: " + string(_connect))
		room_goto(room_deathmatchClient);
	}
	*/
}



button_initialize("Connect", _clickFunction);