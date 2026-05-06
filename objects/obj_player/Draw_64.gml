/// @description draws health bar, money.
var _scale = 4;
var _sprite = spr_heart;
var _width = (sprite_get_width(_sprite) * _scale) + sprite_get_width(_sprite);

for (var _i = 0; _i < global.maxHP; _i++) 
{
	if (_i < global.hp)
	{
		draw_sprite_ext(_sprite, 0, 10 + _i * _width, 10, 4, 4, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(_sprite, 1, 10 + _i * _width, 10, 4, 4, 0, c_white, 1);
	}
}

draw_set_halign(fa_left);
draw_text_transformed(16, 80, "Money: " + string(global.money), 2, 2, 0);