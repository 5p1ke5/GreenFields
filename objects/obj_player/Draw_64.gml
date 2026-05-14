/// @description draws health, money.

draw_set_halign(fa_left);
draw_set_font(fnt_default);

draw_text_transformed(16, 10, "HP: " + string(hp), 2, 2, 0);
if (array_length(inventory) > 0)
{
	draw_text_transformed(16, 80, "Item: " + inventory[equipIndex].GetName(), 2, 2, 0);
}
draw_text_transformed(16, 150, "Money: " + string(global.money), 2, 2, 0);