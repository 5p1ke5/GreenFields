/// @description Attempts to fire the pistol.

//Only lets you do it if cooldown has passed.
if (cooldown > 0)
{
	exit;	
}

var _xOffset = lengthdir_x(6, angle);
var _yOffset = lengthdir_y(6, angle);
var _bullet = instance_create_depth(x + _xOffset, y + _yOffset, depth + 1, projectile);

var _speed = 16;
var _angle = angle;
var _damage = damage;
var _owner = owner;
with (_bullet)
{
	hsp = lengthdir_x(_speed, _angle);
	vsp = lengthdir_y(_speed, _angle);
	image_angle = _angle;
	
	hurtbox_initialize(_damage, _owner);
}

//Resets timer
cooldown = maxCooldown;

//Play sound effect
audio_play_sound(sfx_fire, 0, false);