var _player = instance_find(obj_player, 0);

if (_player == noone)
{
	exit;	
}

var _x = _player.x - (camera_get_view_width(view_camera[0])/2);
var _y = _player.y - 320;
camera_set_view_pos(view_camera[0], _x, _y);