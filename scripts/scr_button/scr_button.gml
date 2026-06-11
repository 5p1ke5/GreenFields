
/// @function button_initialize(_text, _clickFunction, _fgColor, _bgColor, _tooltipDesc = noone, _enabled = true)
/// @desc Initializes variables for a button.
/// @param _text The text printed on the button.
/// @param _clickFunction The function that will be executed when the button is clicked.
/// @param _fgColor Text color.
/// @param _fgColor Button color.
/// @param _tooltipDesc The text that will be displayed on the tooltip. The default value noone will indicate no tooltip is to be displayed.
/// @param _enabled If the button can be clicked or not. If false the button will be greyed out and will not activate it's click event.
function button_initialize(_text, _clickFunction, _fgColor = c_aqua, _bgColor = c_white, _tooltipDesc = noone, _enabled = true)
{
	text = _text;
	clickFunction = _clickFunction;
	fgColor = _fgColor;
	image_blend = _bgColor;
	tooltipDesc = _tooltipDesc;
	tooltipOn = false;
	enabled = _enabled;
	image_index = !enabled;
}
