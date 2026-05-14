/// @descr Receives a periodic ping telling if the other person wants to rematch.
var _type = ds_map_find_value(async_load, "type"); //Type of connection. Can be one of these:

if (_type == network_type_data) //Receives packet with input data.
{
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	var _size = buffer_get_size(_buffer);
	show_debug_message("III Packet received, Size: " + string(_size))
	//If the buffer is the right size, reads it.
	if (_size == 1)
	{
		statusOther = buffer_read(_buffer, buffer_u8);
		show_debug_message("III Status: " + string(statusOther))
		buffer_delete(_buffer);
	}
}