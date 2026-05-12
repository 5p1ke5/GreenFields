/// @desc Periodically sends out a message with current epoch to all clients

timer--;
if (timer < 0)
{
	//Measures epoch.
	epoch++;
	array_push(global.messageLog, "New Epoch: " + string(epoch) + " Time: " + string(current_time))
	
	//Writes epoch to a buffer and sends it from server out to all clients.
	var _buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u16, epoch);
	network_send_packet(global.socketClient, _buffer, buffer_tell(_buffer))
	buffer_delete(_buffer);
	
	//Next it sends out a broadcast periodically
	/*
	var _buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u16, current_time);
	network_send_broadcast(serverSocket, port, _buffer, buffer_tell(_buffer)) 
	buffer_delete(_buffer);
	*/
	timer = timerCD;	
}