/// @description Draws arms, body. Flickers if taken damage. 

if (flicker % 5 != 0)
{
	doll_draw();
}


draw_set_halign(fa_center);
draw_text_color(x, bbox_top - string_height(alert), alert, c_black, c_black, c_black, c_black, 1);
draw_text_color(x - 1, bbox_top - string_height(alert) - 1, alert, c_white, c_white, c_white, c_white, 1);