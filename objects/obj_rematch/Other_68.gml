/// @descr Receives a periodic ping telling if the other person wants to rematch.
var _type = ds_map_find_value(async_load, "type"); //Type of connection. Can be one of these:

if (_type == network_type_data) //Receives packet with input data.
{
	//show_debug_message("!!! Data Acquired: " + string(_socket))
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	statusOther = buffer_read(_buffer, buffer_u8);
	buffer_delete(_buffer);
}