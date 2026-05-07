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



/// @function equip_firearm_initialize(_damage, _maxCooldown, _projectile, _twoHanded = false)
/// @description Initializes variables for a firearm object the player is holding.
/// @param _damage The damage the firearms projectiles will do.
/// @param _maxCooldown How long in game steps the user must wait between shots.
/// @param _projectile the projectile that will be fired.
/// @param _twoHanded if the doll sprite should display the twoHanded sprites or not.
function equip_firearm_initialize(_damage, _maxCooldown, _projectile, _twoHanded = false)
{
	damage = _damage;
	maxCooldown = _maxCooldown;
	cooldown = -1;
	projectile = _projectile;
	twoHanded = _twoHanded;
}