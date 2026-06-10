/// @desc If it's not colliding with its owner destroys self and explodes
if (owner != other)
{
	instance_destroy();
	var _explosion = instance_create_depth(x, y, depth, obj_explosion);
	
	var _owner = owner;
	with (_explosion)
	{
		owner = _owner;
	}
}