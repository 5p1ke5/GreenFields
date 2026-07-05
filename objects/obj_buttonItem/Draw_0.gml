/// @desc Draws button, weapon sprite if not selected (if selected the weaponsprite is drawn by the menu instead)
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, false);
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_aqua, c_aqua, c_aqua, c_aqua, true);

var _item = global.playerInventory[index];

if (menuPause.selected != _item)
{
	draw_self();
}