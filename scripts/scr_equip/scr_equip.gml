/*
/// @function equip_initialize(_owner)
/// @description Initializes variables for an equipped item.
/// @param _owner Object that the equipped object is linked to.
function equip_initialize(_owner)
{	
	owner = _owner;	
	angle = 0;
}


/// @function equip_end_step()
/// @description Makes equipped item follow it's owner, match their movements.
function equip_end_step()
{
	//TODO: check if I can just do this with the same results
	// if (owner)
	if (instance_exists(owner))
	{
		x = owner.x;
		y = owner.y;
		angle = owner.handAngle;
	}
	else
	{
		instance_destroy();	
	}
	
	image_angle = angle;
}
*/