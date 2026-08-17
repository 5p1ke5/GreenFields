/// @description draws health, money.

draw_set_font(fnt_default);
draw_set_halign(fa_right)

var _timeString = "Time: " + clock_time_string()
var _offset = string_width(_timeString);
draw_text_transformed(window_get_width() - _offset, 10, _timeString, 2, 2, 0);

draw_set_halign(fa_left);

draw_text_transformed(16, 10, "HP: " + string(hp), 2, 2, 0);
if (array_length(inventory) > 0)
{
	var _item = inventory[equipIndex];
	var _string = "Item "  + _item.itemName
	
	if (is_instanceof(inventory[equipIndex], ItemEquipFirearm))
	{
		_string = _string + " " + string(_item.amount);
	}
	
	draw_text_transformed(16, 80, _string, 2, 2, 0);
}
draw_text_transformed(16, 150, "Money: " + string(global.money), 2, 2, 0);