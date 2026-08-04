bgm_play(bgm_night);

var _fxLayerDayNight = layer_get_id("DayNight");

	if (_fxLayerDayNight)
	{	
		var _fx = fx_create("_filter_tintfilter");	
		fx_set_parameter(_fx, "g_TintCol", [0.5, 0.5, 0.9, 1]);
		layer_set_fx(_fxLayerDayNight, _fx);
	}
	
	global.clockSteps = 1320 * SECOND;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;

