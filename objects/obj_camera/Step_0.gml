/// @desc Does camera things.

var _player = instance_find(obj_player, 0);
//If there is no player just exits.
if (_player == noone) { exit;}

if ((mousePreviousX != device_mouse_raw_x(0)) || (mousePreviousY != device_mouse_raw_y(0)))
{
	var _angle = point_direction(_player.x, _player.y, mouse_x, mouse_y);
	var _dist = point_distance(_player.x, _player.y, mouse_x, mouse_y);
	_dist = (_dist/RANGE_CAMERA) * RANGE_CLOSE
	
	xOffset = lengthdir_x(_dist, _angle) - (camera_get_view_width(view_camera[0]) / 2)
	yOffset = lengthdir_y(_dist, _angle) -  (camera_get_view_height(view_camera[0]) * 7 / 10)
}

x = _player.x + xOffset;
y = _player.y + yOffset;

camera_set_view_pos(view_camera[0], x, y);

mousePreviousX = device_mouse_raw_x(0);
mousePreviousY = device_mouse_raw_y(0);