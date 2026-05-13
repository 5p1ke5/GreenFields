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
	
	return [];
}