/// @function hurtbox_initialize(_damage, _owner = noone, _hKnockback = 0, _vKnockback = 0)
/// @descr Initiralizes variables for a hurtbox object.
/// @param _damage How much damage the hurtbox does.
/// @param _owner The creator of this hitbox, if any. Instances cannot usually be damaged by hurtboxes they create, so 'noone' means all instances are damaged by this object.
/// @param _hKnockback Horizontal knockback.
/// @param _vKnockback Vertical knockback.
function hurtbox_initialize(_damage, _owner = noone, _hKnockback = 0, _vKnockback = 0)
{
	damage = _damage;
	owner = _owner;
	hKnockback = _hKnockback;
	vKnockback = _vKnockback;
}



/// @function hurtbox_melee_intialize(_damage, _owner = noone, _hKnockback = 0, _vKnockback = 0, _startAngle)
/// @descr Initiralizes variables for a hurtbox object.
/// @param _damage How much damage the hurtbox does.
/// @param _owner The creator of this hitbox.
/// @param _hKnockback Horizontal knockback.
/// @param _vKnockback Vertical knockback.
/// @param _startAngle Starting angle for the hurtbox to be at.
function hurtbox_melee_intialize(_damage, _owner, _hKnockback = 0, _vKnockback = 0, _startAngle)
{
	hurtbox_initialize(_damage, _owner, _hKnockback, _vKnockback);
	startAngle = _startAngle;
}