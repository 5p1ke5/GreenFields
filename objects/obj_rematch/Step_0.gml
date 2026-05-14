/// @descr Periodically sends out updates depending on if the user has decided to rematch

show_debug_message("!!! Time: " + string(current_time) + ", Status: " + string(status))


if (statusOther == REMATCH.REJECTED) //If the other rejects your rematch it kicks you back to the stage.
{
	//Go to deathmatchclient room
	room_goto(ROOM_MULTIPLAYER);
}
if (statusOther == REMATCH.READY) //If the other's status is READY that means they're in deathMatchServer and sending out commands already.
{
	//Go to deathmatchclient room
	room_goto(room_deathmatchClient);
}
else if (statusOther == REMATCH.ACCEPTED) //Otherwise if this one's status is accepted will wait and see if the other server accepted.
{
	text = "Your opponent would like a rematch!";
	if (status == statusOther)
	{
		// First one that gets a matching "wants a rematch" status goes to room_deathMatchServer
		// secomd room gets packet with status = 3 and goes to room_deathMatchClient
		room_goto(room_deathmatchServer)
		status = REMATCH.READY;
	}
}

//Sends out packet with current status.
var _buffer = buffer_create(8, buffer_fixed, 1);
buffer_seek(_buffer, buffer_seek_start, 0);
buffer_write(_buffer, buffer_u8, status);
network_send_packet(global.socketOther, _buffer, buffer_tell(_buffer))
buffer_delete(_buffer);


//Hmm would a swich statmenet work better??

/*
switch (status) 
{    
	case REMATCH.READY:
			// secomd room gets packet with status = 3 and goes to room_deathMatchClient
			room_goto(room_deathmatchClient)
        break;
	case REMATCH.ACCEPTED:
		if (status == statusOther)
		{
			// First one that gets a matching "wants a rematch" status goes to room_deathMatchServer
			room_goto(room_deathmatchServer)
		}
		status = REMATCH.READY
    default:
		//Otherwise sends out status again.
		var _buffer = buffer_create(8, buffer_fixed, 1);
		buffer_seek(_buffer, buffer_seek_start, 0);
		buffer_write(_buffer, buffer_u8, status);
		network_send_packet(global.socketOther, _buffer, buffer_tell(_buffer))
		buffer_delete(_buffer);
        break;
}

*/