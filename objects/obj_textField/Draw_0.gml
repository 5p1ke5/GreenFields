draw_self();

draw_set_halign(fa_left);
draw_set_font(fnt_gothic)

if (active)
{
	if (current_time % 60 > 2)
	{
		draw_text_transformed_colour(x, y, text + "|", 3, 3, 0, c_black, c_black, c_black, c_black, 1);
	}
}
else
{
	draw_text_transformed_colour(x, y, text, 3, 3, 0, c_black, c_black, c_black, c_black, 1);
}