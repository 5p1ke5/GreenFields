timer--;
if (timer < 0)
{
	//Measures epoch.
	show_debug_message("Epoch: " + string(epoch) + " Time: " + string(current_time));
	epoch++;
	
	//Writes epoch to a buffer and sends it from server out to all clients.
	/*
	var _buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u16, epoch);
	
	for (var _i = 0; _i < array_length(sockets); _i++) 
	{
		network_send_packet(sockets[_i], _buffer, buffer_tell(_buffer))
	}
	
	buffer_delete(_buffer);
	*/
	
	//Writes to a buffer and sends it from the client to server

	var _buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u16, epoch);
	

	network_send_packet(clientSocket, _buffer, buffer_tell(_buffer))
	
	buffer_delete(_buffer);
	
	
	timer = timerCD;	
}

