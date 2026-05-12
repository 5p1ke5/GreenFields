draw_self();

draw_set_halign(fa_left);
draw_set_font(fnt_gothic)

var _string = text;
if (active)
{
	if (current_time % 60 > 2)
	{
		_string = _string + "|";
	}
}
draw_text_transformed_colour(x, y, _string, 3, 3, 0, c_black, c_black, c_black, c_black, 1);