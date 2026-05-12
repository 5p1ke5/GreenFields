
var _clickFunction = function()
{
	var _textField = inst_ipField;
	with (_textField)
	{
		var _ip = text;	
	}
	
	
	clientSocket = network_create_socket(network_socket_tcp);
	array_push(global.messageLog, "!!! client socket: " + string(clientSocket))
	
	var _connect = network_connect(clientSocket, _ip, 6510);
	if (_connect < 0)
	{
		array_push(global.messageLog, "!!! connection error! " + string(_connect))
	}
	else
	{
		array_push(global.messageLog, "!!! Connection: " + string(_connect))
	}
}

button_initialize("Connect", _clickFunction);