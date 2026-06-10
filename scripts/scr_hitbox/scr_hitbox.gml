/*	I need to modify this code
	Give hitbox initialize a 2d array, bankedCollisions or something
	Col 0 is instance references, col 1 is durations
	hitbox_step() mostly does what it does now but also it goes through bankedCollisions
	it decrements the duratin  for bankedCollisions and also filters the instance_place_array when it gets it
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
}


/// @function hitbox_step()
/// @description Checks for collisions with the instance, returning an array of all valid collisions.
function hitbox_step()
{
	return instance_place_array(x, y, hitboxObjs, false);
}