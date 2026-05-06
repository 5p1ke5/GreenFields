/// @function hitbox_initialize(_hitboxObjs = [], _maxFlicker = FLICKER_MAX) constructor
/// @description Initializes varibales for a hitbox struct. This struct has a Step method which should be called in the step event.
/// @param _hitboxObjs The objects to check for collisions with. Can be a single element or an array. If its a single element gets put into a 1-element array.
/// @param _maxFlicker The amount the object should flicker when hit.
function Hitbox(_hitboxObjs = [], _maxFlicker = FLICKER_MAX) constructor
{
	//If the object was given a single element for _hitboxObjs just assumes they meant to pass a 1-element array.
	if !(is_array(_hitboxObjs))
	{
		_hitboxObjs = [_hitboxObjs]
	}
	
	hitboxObjs = _hitboxObjs;
	flicker = -1;
	maxFlicker = _maxFlicker
	
	//This returns an array with all objects collided with.
	static Step = function(_x, _y)
	{
		if (flicker < 0)
		{
			return instance_place_array(_x, _y, hitboxObjs, false);
		}
	
		flicker--;
		return undefined;
	}
}
