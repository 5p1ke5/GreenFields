/// @function phys_initialize(gravity, friction, hsp, vsp, collision)
/// @description Initializes physics variables.
/// @param _grav How many pixels the object is pulled down by each step.
/// @param _frict How much horizontal speed is reduced each step while it is non-zero.
/// @param _hsp Horizontal speed.
/// @param _vsp vertical speed
/// @param _isSolid Whether the object stops when it collides with blocks.
function phys_initialize(_grav = 0, _frict = 0, _hsp = 0, _vsp = 0, _isSolid = true) 
{

	//Initializes instance variables.
	grav = _grav;
	frict = _frict;
	hsp = _hsp;
	hspExt = 0;
	vsp = _vsp;
	isSolid = _isSolid;
	
	//The object is considered grounded if they are directly above a block.
	grounded = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, GROUND, false, true);
}

/// @function phys_force_add(_force, _accel, _max)
/// @description Accelerates a given force value up to a maximum number. Returns the new value.
/// @param _force the base value to be added to. Usually hsp or vsp.
/// @param _accel the number to be added to the _force variable.
/// @param _max the maximum value that _force can be set to.
function phys_force_add(_force, _accel, _max)
{
	var _sign = sign(_accel);
	
	_force += _accel;
	_force = min(abs(_force), _max);
	
	return _force * _sign;
}

/// @function phys_floor_collision(_vsp) 
/// @description Stops the player if they would touch a block vertically. eg vsp = phys_floor_collison(vsp). Returns new vsp.
/// @param _vsp object's vertical speed.
function phys_floor_collision(_vsp) 
{
	//Checks every pixel in the player's path for collision.
	//for (var _i = 0; (abs(_i) < abs(_vsp)) || (place_meeting(x, y + _i, BLOCK)) || collision_point(x, bbox_bottom + 1 + _i, ONEWAY, true, true)/* || (grounded && _vsp > 0)*/; _i += sign(_vsp))
	for (var _i = 0; (abs(_i) < abs(_vsp)); _i += sign(_vsp))
	{
	    //If there is a collision, it will move the player as close to the object as possible and then stop. 
		var _collision = instance_place(x, y + _i + sign(_vsp), BLOCK)
		if (_collision)
		{
			y += _i;
			return 0;
		}
		
		//Having issues with collision mask scaling
		//what if I just have oneWay blocks spawn a oneway platform for themselves
		
		var _collision = instance_place(x, y + 1 + _i, ONEWAY);
		if (_collision)
		{
		    if (_vsp >= 0) && ((bbox_bottom <= _collision.bbox_top))
			{
				y += _i;
				return 0;
			}
		}
	}

	return _vsp;
}


/// @function phys_wall_collision(hsp)
/// @description If the object would end up inside the block object, it instead just moves them as close as possible. eg hsp = phys_wall_collision(hsp)
/// @param hsp object's horizontal speed.
function phys_wall_collision(_hsp) 
{

	//Checks every pixel in the object's path for collision.
	for (var _i = 0; (abs(_i) < abs(_hsp)) || (place_meeting(x + _i, y, BLOCK)); _i += sign(_hsp))
	{
	    //If there is a collision, it will move the player as close to the object as possible and then stop. 
		var _collision = instance_place(x + _i, y, BLOCK);
		if (_collision)
		{
	        x += _i - sign(_hsp);
	        return 0;
		}
	}
	
	return _hsp;
}


/// @function phys_friction(hsp, friction, grounded)
/// @description Applies friction to a horizontal speed variable. Returns new horizontal speed.
/// @param hsp Horizontal speed.
/// @param friction Friction variable.
/// @param grounded Whether the object is on the ground or not.
function phys_friction(_hsp, _frict, _grounded) 
{

	//Friction will reduce horizontal speed. This is reduced while in the air.
	  _hsp -= (_frict * sign(_hsp)) * (1 / (power(10, !_grounded)));
	  
	/*
	if (_grounded)
	{
	    _hsp -= _frict * sign(_hsp);
	}
	*/

	//If hsp is lower than the friction value, it just sets hsp to 0.
	if (abs(_hsp) < _frict)
	{
	    return 0;
	}

	//Returns new hsp
	return _hsp;
}

/// @function phys_gravity(_vsp, _grav, _terminalVelocity)
/// @description applies gravity. Returns the new VSP value.
/// @param _vsp the vsp value gravity will be applied to.
/// @param _grav the value that will be applied to vsp.
/// @param _terminalVelocity The maximum gravity that can be applied.
function phys_gravity(_vsp, _grav, _terminalVelocity) 
{

	_vsp = min(_vsp + _grav, _terminalVelocity) 

	return _vsp;
}



/// @function phys_step()
/// @description Place in the step event to activate physics.
function phys_step() 
{
	
	//grav increases the object's downwards speed by raising vsp. Does not do so past the terminal velocity.
	vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);

	//Friction will reduce horizontal speed. This is reduced while in the air.
	hsp = phys_friction(hsp, frict, grounded);

	//Collision with walls. The object's position is changed after each collision function.
	if (isSolid)
	{
	    vsp = phys_floor_collision(vsp);
	    hsp = phys_wall_collision(hsp);
	}

	y += round(vsp);
	x += round(hsp);

	//Checks if the object is on the ground.
	grounded = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, GROUND, false, true);

	
	//x = round(x);
	//y = round(y);
}