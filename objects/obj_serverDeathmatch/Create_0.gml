//Interval on which packets will be sent out in the step event.

timerCD = 1;
timer = timerCD;
epoch = 0;

sockets = array_create(0);
port = 6510;
maxConnections = 2;

//Creates the socket that will serve as the server.
serverSocket = network_create_server(network_socket_tcp, port, maxConnections);
if (serverSocket < 0)
{
	array_push(global.messageLog, "!!! socket error! " + string(serverSocket))
}
else
{
	array_push(global.messageLog, "!!! Server socket: " + string(serverSocket))
}