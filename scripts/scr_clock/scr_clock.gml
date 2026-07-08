/// @function clock_tick()
/// @desc Increments the in-game clock.
function clock_tick()
{
	//global.clockSteps++;
	global.clockMinutes += 10/SECOND;
	
	if (global.clockMinutes > 60)
	{
		global.clockMinutes = 0;
		global.clockHours++;
		global.clockHours = global.clockHours % 24;
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
		
		var _bgLayer = layer_background_get_id(_layerIndex);
		layer_background_blend(_bgLayer, _color);
	}
}