/*	I need to modify this code
	Give hitbox initialize a 2d array, savedCollisions or something
	Col 0 is instance references, col 1 is durations
	hitbox_step() mostly does what it does now but also it iterates through savedCollisions
	it decrements the duration for savedCollisions and also filters the instance_place_array when it gets it
	then returns the filtered array for instances to process the collisions.
*/

/// @function hitbox_initialize(_hitboxObjs = [], _maxFlicker = FLICKER_MAX) 
/// @description Initializes varibales for a hitbox. This struct has a Step method which should be called in the step event.
/// @param _hitboxObjs The objects to check for collisions with. Can be a single element or an array. If its a single element gets put into a 1-element array.
function hitbox_initialize(_hitboxObjs = []) 
{
	//If the object was given a single element for _hitboxObjs just assumes they meant to pass a 1-element array.
	if !(is_array(_hitboxObjs))
	{
		_hitboxObjs = [_hitboxObjs]
	}
	
	hitboxObjs = _hitboxObjs;
	
	//Will hold a 2d array for collisions. Col 0 is an instance reference, col 1 is an integer duration for it to be on the list.
	savedCollisions = [];
}


/// @function hitbox_step()
/// @description Checks for collisions with the instance, returning an array of all valid collisions.
function hitbox_step()
{
	//array_push(savedCollision, ["Bob", 20]);
	var _collisions = instance_place_array(x, y, hitboxObjs, false);
	
	//Iterates through savedCollisions. If any of the savedCollisions are already in savedCollisions removes them from the _collisions array. Then decrements the timers in savedCollisions.
	for (var _i = 0; _i < array_length(savedCollisions); _i++) 
	{
		//Gets instance 
		_collisionInstance = savedCollisions[_i][0];
		var _collisionFound = array_get_index(_collisions, _collisionInstance);
		
		//If it found the instance from savedCollisions in _collisionFound it deletes that element from the array before returning it.
		if (_collisionFound > -1)
		{
			array_delete(_collisions, _collisionFound, 1);
		}
		
		//If duration is greater than or equal to 0 decretments it. Otherwise remove that collisions from savedCollisions
		var _duration = savedCollisions[_i][1];
		if (_duration >= 0)
		{
			savedCollisions[_i][1] = --_duration;	
		}
		else
		{
			array_delete(savedCollisions, _i, 1);	
		}
	}
	
	//Next adds all items still in _collisions to _savedCollisions
	for (var _i = 0; _i < array_length(_collisions); _i++) 
	{
		_instance = _collisions[_i];
		array_push(savedCollisions, [_instance, SECOND/2]);
	}
	
	show_debug_message("{0}", string(savedCollisions));
	
	return _collisions;
}