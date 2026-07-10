if (global.clockMinutes > 1080) || (global.clockMinutes < 300)
{
	draw_set_alpha(0.2);
	draw_triangle_colour(x - 1, bbox_top + 2, x + sprite_height/3, bbox_bottom - 1, x - sprite_height/3, bbox_bottom - 1, c_white, c_cream, c_cream, false);
	draw_set_alpha(1);
}