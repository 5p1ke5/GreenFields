/// @desc Draws button, weapon sprite if there is one
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, false);
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_lime, c_lime, c_lime, c_lime, true);

if (global.playerEquip[index])
{
	var _item = global.playerEquip[index];
	var _sprite = _item.icon;
	draw_sprite_ext(_sprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}