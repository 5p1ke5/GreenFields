/// @function label_initialize(_text, _sep = string_height(_text), _width = bbox_right - bbox_left, _xScale, _yScale, _angle, _c1, _c2, _c3, _c4, _alpha, _hAlign = noone, _vAlign = noone, _font = noone)
/// @desc Initializes variables for a label object.
/// @param _text Text to be displayed.
/// @param _sep Height in pixels of spaces between lines. Default calculates the height of _text.
/// @param _width Width before a line break. By default calculates the width of the label object.
/// @param _xScale xscale of the text
/// @param _yScale yscale of the text
/// @param _angle Angle of the text.
/// @param _c1 Color 1 of the text.
/// @param _c2 Color 2 of the text.
/// @param _c3 Color 3 of the text.
/// @param _c4 Color 4 of the text.
/// @param _alpha Alpha of the text.
/// @param _hAlign Horizontal alignment of the text.
/// @param _vAlign vertical alignment of the text.
/// @param _font Font to be assigned to the label.
function label_initialize(_text, _sep = string_height(_text), _width = bbox_right - bbox_left, _xScale, _yScale, _angle, _c1, _c2, _c3, _c4, _alpha, _hAlign = noone, _vAlign = noone, _font = noone)
{
	text = _text;
	sep = _sep;
	width = _width;
	xScale = _xScale;
	yScale = _yScale;
	angle = _angle;
	c1 = _c1;
	c2 = _c2;
	c3 = _c3;
	c4 = _c4;
	alpha = _alpha;
	hAlign = _hAlign;
	vAlign = _vAlign;
	font = _font;
}


/// @function label_draw(_text, _sep, _width, _xScale, _yScale, _angle, _c1, _c2, _c3, _c4, _alpha, _hAlign = noone, _vAlign = noone, _font = noone)
/// @description Draws the text assigned to the label.
/// @param _text Text to be displayed.
/// @param _sep Height in pixels of spaces between lines. Default calculates the height of _text.
/// @param _width Width before a line break. By default calculates the width of the label object.
/// @param _xScale xscale of the text
/// @param _yScale yscale of the text
/// @param _angle Angle of the text.
/// @param _c1 Color 1 of the text.
/// @param _c2 Color 2 of the text.
/// @param _c3 Color 3 of the text.
/// @param _c4 Color 4 of the text.
/// @param _alpha Alpha of the text.
/// @param _hAlign Horizontal alignment of the text.
/// @param _vAlign vertical alignment of the text.
/// @param _font Font to be assigned to the label.
function label_draw(_text, _sep = string_height(_text), _width = bbox_right - bbox_left, _xScale, _yScale, _angle, _c1, _c2, _c3, _c4, _alpha, _hAlign = noone, _vAlign = noone, _font = noone)
{
	if (_hAlign != noone) { draw_set_halign(_hAlign); }
	if (_vAlign != noone) { draw_set_valign(_vAlign); }
	if (_font != noone) { draw_set_font(_font); }
	
	switch (draw_get_halign()) 
	{    
		case fa_left:
				var _x = bbox_left;
	        break;
		case fa_right:
				var _x = bbox_right
	        break;
		case fa_center:
				var _x = (bbox_right + bbox_left) / 2;
	        break;
	}
	
	draw_text_ext_transformed_colour(_x, y, _text, _sep, _width, _xScale, _yScale, _angle, _c1, _c2, _c3, _c4, _alpha)
}