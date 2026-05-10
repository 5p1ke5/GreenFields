/// @desc Defines the function that's run when the button is clicked. Should be overridden in create event.

var _clickFunction = function()
{
	show_debug_message("Error");
}

button_initialize("foo", _clickFunction);
