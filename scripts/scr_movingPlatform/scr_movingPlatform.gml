/// @function moving_platform_initialize(_hsp = 0, _vsp = 0, _collision = true, _block = [BLOCK, obj_oneWayMovingMarker])


/// @function moving_platform_initialize(_hsp = 0, _vsp = 0, _block = BLOCK)
/// @desc Initializes variables for a moving platform.
/// @param _hsp Horizontal speed of the platform.
/// @param _vsp Vertical speed of the platform
/// @param _block If the platform would collide with this object it instead reverses direction.
function moving_platform_initialize(_hsp = 0, _vsp = 0, _block = BLOCK)
{
	hsp = _hsp;
	vsp = _vsp;
	
	block = _block;
}


/// @function moving_platform_step()
/// @desc Makes moving platforms move.
function moving_platform_step()
{
	
	if (place_meeting(x + hsp, y, block))
	{
		hsp = -hsp;	
	}
	
	if (place_meeting(x, y + vsp, block))
	{
		vsp = -vsp;	
	}
	
	x += round(hsp);
	y += round(vsp);
	
	//Gets an array of all physics objects on top of this one.
	//var _onTop = collision_line_array(bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, PHYSICS, false, true, false);
	//var _onTop = collision_rectangle_array(bbox_left, bbox_top - abs(vsp), bbox_right, bbox_top, PHYSICS, false, true, false);
	var _onTop = collision_rectangle_array(bbox_left, bbox_top - abs(vsp * 2), bbox_right, bbox_top, PHYSICS, false, true, false);
	
	for (var _i = 0; _i < array_length(_onTop); _i++) 
	{
		var _hsp = hsp;
		var _vsp = vsp;
		
		var _top = y;
		
		with (_onTop[_i])
		{
			/*
			if (bbox_bottom - abs(_vsp) > _top)
			{
				break;
			}
			*/
			
			hspExt = _hsp;
			
			//Going down
			if (_vsp > 0)
			{
				vspExt = _vsp;
				y += _vsp;
			}
			else //Going up or not moving vertically
			{
				y += _vsp;
			}
		}
	}
}