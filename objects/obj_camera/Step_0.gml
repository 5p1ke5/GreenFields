var _player = instance_find(obj_player, 0);

//If there is no player just exits.
if (_player == noone) { exit;}


x = _player.x - (camera_get_view_width(view_camera[0])/2);
y = _player.y - 320;

/*
x = mouse_x;
y = mouse_y;
*/


camera_set_view_pos(view_camera[0], x, y);