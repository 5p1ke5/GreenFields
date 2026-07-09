/// @desc Sets clock time
clock_tick();

//Only does these if the layers actually exist.
if (bgLayerSkybox)
{
	clock_skybox_control(bgLayerSkybox);
}

if (fxLayerDayNight)
{
	clock_fx_control(fxLayerDayNight);
}