

/// @function clock_initialize()
/// @desc Initializes references to the layers that are on the clock.
function clock_initialize()
{
	bgLayerSkybox = layer_background_get_id("Skybox");
	
	fxLayerDayNight = layer_get_id("DayNight");
	if (fxLayerDayNight)
	{	
		var _fx = fx_create("_filter_tintfilter");	
		fx_set_parameter(_fx, "g_TintCol", [0.5, 0.5, 0.9, 1]);
		layer_set_fx(fxLayerDayNight, _fx);
	}
}

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
}

/// @function clock_skybox_control(_bgLayer)
/// @desc Changes the color of the 'Skybox' background layer.
/// @param _bgLayer reference to the background ID from the background layer (eg layer_background_get_id("Skybox"))
function clock_skybox_control(_bgLayer)
{
	var _time = global.clockMinutes;
	if (_time < 180) // 3
	{
		var _color = make_colour_hsv(150, 255, 32 + (95 * (_time/180)));
	}
	else if (_time < 360) // 6
	{
		var _color = make_colour_hsv(150 - ((_time - 180) / 180) * 18, 255, 127 + ((_time - 180) / 180) * 128);
	}
	else if (_time < 720) // 12
	{
		var _color = make_colour_hsv(132 + ((_time - 360) / 360) * 18, 255, 255);
	}
	else if (_time < 1020) //18
	{
		var _color = make_colour_hsv(150, 255, 255);
	}
	else if (_time < 1200) //20
	{
		var _color = make_colour_hsv(150 + ((_time - 1020) / 180) * 20, 255, 255 -  ((_time - 1020) / 180) * 55);
	}
	else if (_time < 1320) //22
	{
		var _color = make_colour_hsv(170 - ((_time - 1200) / 120) * 20, 255, 200 - ((_time - 1200) / 120) * 170);
	}
	else //24
	{
		var _color = make_colour_hsv(150, 255, 32)
	}
	
	layer_background_blend(_bgLayer, _color);
}

/// @function clock_fx_control(_layerFXDayNight)
/// @desc Controls the FX layers in relation to the game clock.
/// @param _layerFXDayNight a reference to the "DayNight" fx layer (eg layer_get_id("DayNight"))
function clock_fx_control(_layerFXDayNight)
{
	show_debug_message(layer_get_fx(_layerFXDayNight))
}



/// @function clock_time_string()
/// @desc Returns the current time as a string.
function clock_time_string()
{
	if ((global.clockMinutes % 60) < 10)
	{
		var _string = string(floor(global.clockHours)) + ":0" + string(floor(global.clockMinutes % 60))
	}
	else
	{
		var _string = string(floor(global.clockHours)) + ":" + string(floor(global.clockMinutes % 60))
	}
	return _string;	
}