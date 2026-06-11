/// @function living_initialize(_hp = 1)
/// @desc Initializes for living objects (has HP, can die)
/// @param _hpMax How much HP the instance has.
function living_initialize(_hpMax = 1)
{
	hpMax = _hpMax;
	hp = hpMax;
}

/// @function living_step()
/// @desc Step event for living things. 
function living_step()
{
	
}

/// @function living_take_damage(_damage)
/// @desc Decrements HP. If HP is less than 0 executes death routine. 
/// @param _damage How much damage to take.
function living_take_damage(_damage)
{
	hp -= _damage;
	if (hp <= 0)
	{
		living_die();	
	}
}

///@function living_bleed(_angle, _amount)
///@desc Creates blood objects at a randomized angle.
///@param _angle The angle to shoot blood out at
///@param _amount How many blood particles to make
function living_bleed(_angle, _amount)
{
	repeat(_amount)
	{
	    var _blood = instance_create_depth(x, y, depth, obj_blood);
	
		with (_blood)
		{
			var _speed = irandom_range(3, 5);
			var _angleRand = _angle + irandom_range(-30, 30);
			hsp = lengthdir_x(_speed, _angleRand);
			vsp = lengthdir_y(_speed, _angleRand);
		}
	}
}

/// @function living_die()
/// @desc Death routine. For now just destroys the instance, might do something else later.
function living_die()
{
	instance_destroy();	
}