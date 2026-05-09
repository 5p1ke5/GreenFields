/// @description initialize socket and tries to connect to a server.

//Creates the socket that will serve the client side.
clientSocket = network_create_socket(network_socket_tcp);
array_push(global.messageLog, "!!! client socket: " + string(clientSocket))

var _connect = network_connect(clientSocket, "127.0.0.1", 6510);
if (_connect < 0)
{
	array_push(global.messageLog, "!!! connection error! " + string(_connect))
}
else
{
	array_push(global.messageLog, "!!! Connection: " + string(_connect))
}
