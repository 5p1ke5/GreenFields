/// @desc Draws button, weapon sprite if not selected (if selected the weaponsprite is drawn by the menu instead)

var _item = global.playerInventory[index];
var _outlineColor = array_contains(global.playerEquip, _item) ? c_red : c_aqua;

draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, false);
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, _outlineColor, _outlineColor, _outlineColor, _outlineColor, true);


if (menuPause.selected != _item)
{
	draw_self();
}