/// @desc Sets clock time
clock_tick(10);

//Only does these if the layers actually exist.
if (bgLayerSkybox)
{
	clock_skybox_control(bgLayerSkybox);
}

if (fxLayerDayNight)
{
	clock_fx_control(fxLayerDayNight);
}