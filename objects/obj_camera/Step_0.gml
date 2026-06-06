var _player = instance_find(obj_player, 0);
//If there is no player just exits.
if (_player == noone) { exit;}

if ((mousePreviousX != device_mouse_raw_x(0)) || (mousePreviousY != device_mouse_raw_y(0)))
{
	show_debug_message("Mouse x: {0}, Mouse y: {1}, Mouse x(prev):{2}, Mouse x(prev):{3}",  device_mouse_raw_x(0), device_mouse_raw_y(0), mousePreviousX, mousePreviousY)
	
	if (point_distance(mouse_x, mouse_y, _player.x, _player.y) < RANGE_CLOSE)
	{
		xOffset = mouse_x - _player.x-(camera_get_view_width(view_camera[0])/2);
		yOffset = mouse_y - _player.y -320;	
	}
}

/*
xOffset = -(camera_get_view_width(view_camera[0])/2);
yOffset = -320;
*/


x = _player.x + xOffset;
y = _player.y + yOffset;

camera_set_view_pos(view_camera[0], x, y);

mousePreviousX = device_mouse_raw_x(0);
mousePreviousY = device_mouse_raw_y(0);