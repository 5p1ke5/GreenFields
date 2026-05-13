/// @function living_initialize(_hp = 1, _flicker = FLICKER_MAX)
/// @desc Initializes for living objects (has HP, can die)
/// @param _hpMax How much HP the instance has.
/// @param _flicker How long the unit flickers when it gets hit.
function living_initialize(_hpMax = 1, _flicker = FLICKER_MAX)
{
	hpMax = _hpMax;
	hp = hpMax;
	flickerMax = _flicker;
	flicker = 0;
}

/// @function living_step()
/// @desc Step event for living things. Decrements flicker.
function living_step()
{
	if (flicker > 0)
	{
		flicker--;	
	}
}

/// @function living_take_damage(_damage)
/// @desc Decrements HP. If HP is less than 0 executes death routine. Otherwise, resets flicker to flickerMax.
/// @param _damage How much damage to take.
function living_take_damage(_damage)
{
	hp -= _damage;
	if (hp <= 0)
	{
		living_die();	
	}
	else
	{
		flicker = flickerMax;	
	}
}


/// @function living_die()
/// @desc Death routine. For now just destroys the instance, might do something else later.
function living_die()
{
	instance_destroy();	
}