//Interval on which packets will be sent out in the step event.
timerCD = game_get_speed(gamespeed_fps) * 3;
timer = timerCD;
epoch = 0;

port = 6510;
maxConnections = 2;

//Creates the socket that will serve as the server.
global.socketServer = network_create_server(network_socket_tcp, port, maxConnections);
if (global.socketServer < 0)
{
	array_push(global.messageLog, "!!! socket error! " + string(global.socketServer))
}
else
{
	array_push(global.messageLog, "!!! Server socket: " + string(global.socketServer))
}