/// @function menu_initialize(_options[])
/// @description initializes menu variables.
/// @param _options[] an array of strings to use as menu options.
function menu_initialize(_options) 
{
	options = _options;
	optionSelected = 0;
}


/// @function menu_step()
/// @description takes keyboard input, increments selected menu item.
function menu_step()
{
	var _arraySize = array_length(options);

	optionSelected += DOWN_BUTTON_PRESSED - UP_BUTTON_PRESSED;

	//If option goes beyond bounds of array loops to other side.
	if (optionSelected < 0)
	{
		optionSelected = _arraySize - 1;
	}

	if (optionSelected >= _arraySize)
	{
		optionSelected = 0;
	}
}

/// @function menu_draw(x, y, array, color1, color2, height, select)
/// @description Draws a menu from the given array.
/// @param _x x coordinate to draw the menu at.
/// @param _y y coordinate to draw the menu at.
/// @param _array array to draw.
/// @param _color1 color for unselected items.
/// @param _color2 color for the selected item.
/// @param _height height of the menu.
/// @param _select selected item in the array.
function menu_draw(_x, _y, _options, _color1, _color2, _height, _select) 
{
	draw_set_colour(_color1);

	for (var _i = 0; _i < array_length(_options); _i++)
	{
	    if (_i != _select)
	    {
	        draw_set_colour(_color2);
	    }
    
	    draw_text(_x, _y + ((_height * _i)/array_length(_options)), string(_options[_i]));
    
	    draw_set_colour(_color1);
	}
}


/// @function menu_draw_transformed(_x, _y, _options, _color1, _color2, _height, _select, _xscale, _yscale, _angle) 
/// @description Draws a menu from the given array, transforming the text.
/// @param _x x coordinate to draw the menu at.
/// @param _y y coordinate to draw the menu at.
/// @param _array array to draw.
/// @param _color1 color for unselected items.
/// @param _color2 color for the selected item.
/// @param _height height of the menu.
/// @param _select selected item in the array.
/// @param _xscale Horizontal scaling for text
/// @param _yscale Vertical scaling for text.
/// @param _angle Rotation for text.
function menu_draw_transformed(_x, _y, _options, _color1, _color2, _height, _select, _xscale, _yscale, _angle) 
{
	draw_set_colour(_color1);

	for (var _i = 0; _i < array_length(_options); _i++)
	{
	    if (_i != _select)
	    {
	        draw_set_colour(_color2);
	    }
    
	    draw_text_transformed(_x, _y + ((_height * _i * _yscale)/array_length(_options)), string(_options[_i]), _xscale, _yscale, _angle);
    
	    draw_set_colour(_color1);
	}


}





















