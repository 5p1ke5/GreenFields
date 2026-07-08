/// @function clock_tick()
/// @desc Increments the in-game clock.
function clock_tick()
{
	global.clockSteps += 10;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;
	
	if (global.clockHours > 24)
	{
		global.clockSteps = 0;
		global.clockMinutes = 0;
		global.clockHours = 0;
	}
	
	clock_skybox_control();
}

/// @function clock_skybox_control()
/// @desc 
function clock_skybox_control()
{
	var _layerIndex = layer_get_id("Skybox");
	
	if (_layerIndex)
	{
		var _time = global.clockHours;
		
		//Night (evening - dawn)
		/*
		if (_time < 6) || (_time > 18)
		{
			//dark blue -> almost black -> dark purple
			var _color = make_colour_hsv(128 + (global.clockHours/24) * 127, 255, 255);
		}
		//Morning (dawn - midday)
		else if (_time >= 6) && (_time < 12)
		{
			//dark purple -> pink -> teal
			var _color = make_colour_hsv(128 + (global.clockHours/24) * 127, 255, 255);
		}
		//afternoon (midday - evening)
		else// if (_time  >= 12) && (_time < 18)
		{
			//teal -> yellow -> orange -> violet -> dark blue
			var _color = make_colour_hsv(128 + (global.clockHours/24) * 127, 255, 255);
		}
		*/
		
		//midnight (0:00) -> sunrise (6) -> midday (12) -> sunset (6) ->
		//almost black -> dark blue -> teal (most of the day) -> yellow -> orange -> violet -> dark purple -> dark blue ->
		
		var _color = make_colour_hsv(128 + (global.clockHours/24) * 127, 255, 255);
		var _bgLayer = layer_background_get_id(_layerIndex);
		layer_background_blend(_bgLayer, _color);
	}
}

/// @function clock_time_string()
/// @desc Returns the current time as a string.
function clock_time_string()
{
	return string(floor(global.clockHours)) + ":" + string(floor(global.clockMinutes % 60));	
}