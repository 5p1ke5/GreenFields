/// @description initialize socket and tries to connect to a server.

//Creates the socket that will serve the client side.
clientSocket = network_create_socket(network_socket_tcp);
show_debug_message("!!! client socket: " + string(clientSocket));


var _connect = network_connect(clientSocket, "127.0.0.1", 6510);
if (_connect < 0)
{
	show_debug_message("!!! connection error! " + string(_connect));
}
else
{
	show_debug_message("!!! Connection: " + string(_connect));
}
