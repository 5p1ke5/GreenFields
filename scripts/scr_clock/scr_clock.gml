/// @function clock_tick()
/// @desc Increments the in-game clock.
function clock_tick()
{
	global.clockSteps += 100;
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
		var _time = global.clockMinutes;
		
		if (_time < 180) // 3
		{
			var _color = make_colour_hsv(150, 255, 127);
		}
		else if (_time < 360) // 6
		{
			var _color = make_colour_hsv(150, 255, 255);
		}
		else if (_time < 720) // 12
		{
			var _color = make_colour_hsv(132, 255, 255);
		}
		else if (_time < 1020) //18
		{
			var _color = make_colour_hsv(25, 255, 255)
		}
		else if (_time < 1200) //20
		{
			var _color = make_colour_hsv(250, 255, 255)
		}
		else if (_time < 1320) //22
		{
			var _color = make_colour_hsv(200, 255, 200)
		}
		else //24
		{
			var _color = make_colour_hsv(150, 255, 32)
		}
		
		//midnight (0:00) -> sunrise (6) -> midday (12) -> sunset (6) ->
		//almost black -> dark blue -> teal (most of the day) -> yellow -> orange -> violet -> dark purple -> dark blue ->
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