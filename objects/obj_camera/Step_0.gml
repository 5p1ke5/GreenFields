var _player = instance_find(obj_player, 0);

if (_player)
{
	y = _player.y;
	if (point_distance(_player.x, _player.y, mouse_x, mouse_y) < RANGE_MEDIUM)
	{
		x = mouse_x;	
	}
}