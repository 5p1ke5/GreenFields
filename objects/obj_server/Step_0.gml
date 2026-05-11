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
	
	for (var _i = 0; _i < array_length(sockets); _i++) 
	{
		network_send_packet(sockets[_i], _buffer, buffer_tell(_buffer))
		//This miiiight broadcast a packet to all listening clients. Maybe. I will try tomorrow.
		//network_send_broadcast(serverSocket, port, _buffer, buffer_tell(_buffer)) 
	}
	
	buffer_delete(_buffer);

	
	timer = timerCD;	
}