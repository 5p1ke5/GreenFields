var _type = ds_map_find_value(async_load, "type"); //Type of connection. Can be one of these:

if (_type == network_type_data) //Receives packet with input data.
{
	
	var _buffer = ds_map_find_value(async_load, "buffer"); 
	if (buffer_get_size(_buffer) == 15)
	{
		aButtonPressed = buffer_read(_buffer, buffer_bool);
		aButton = buffer_read(_buffer, buffer_bool);
		rightButton = buffer_read(_buffer, buffer_bool);
		leftButton = buffer_read(_buffer, buffer_bool);
		runButton = buffer_read(_buffer, buffer_bool);
		mLeftButton = buffer_read(_buffer, buffer_bool);
		mRightButton = buffer_read(_buffer, buffer_bool);
		mLeftButtonReleased = buffer_read(_buffer, buffer_bool);
		mRightButtonReleased = buffer_read(_buffer, buffer_bool);
		upButtonReleased = buffer_read(_buffer, buffer_bool);
		downButtonReleased = buffer_read(_buffer, buffer_bool);
		mouseX = buffer_read(_buffer, buffer_s16);
		mouseY = buffer_read(_buffer, buffer_s16);
		buffer_delete(_buffer);
	}
	
}