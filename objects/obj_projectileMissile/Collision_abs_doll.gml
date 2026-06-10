/// @desc If it's not colliding with its owner destroys self and explodes
if (owner != other)
{
	instance_destroy();
	instance_create_depth(x, y, depth, obj_explosion);
}