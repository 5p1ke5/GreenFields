
var _clickFunction = function()
{
	window_set_fullscreen(!window_get_fullscreen());
}

uibutton_initialize("Fullscreen", _clickFunction);