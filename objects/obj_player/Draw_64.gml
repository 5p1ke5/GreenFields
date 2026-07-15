/// @description draws health, money.

draw_set_halign(fa_right)
draw_set_font(fnt_default);

var _timeString = "Time: " + clock_time_string()
var _offset = string_width(_timeString);
draw_text_transformed(window_get_width() - _offset, 10, _timeString, 2, 2, 0);

draw_set_halign(fa_left);

draw_text_transformed(16, 10, "HP: " + string(hp), 2, 2, 0);
if (array_length(inventory) > 0)
{
	draw_text_transformed(16, 80, "Item: " + inventory[equipIndex].itemName, 2, 2, 0);
}
draw_text_transformed(16, 150, "Money: " + string(global.money), 2, 2, 0);