/// @description Attempts to fire the pistol.

//Only lets you do it if cooldown has passed.
if (cooldown > 0)
{
	exit;	
}

var _speed = 16;
var _damage = damage;

var _xOffset = lengthdir_x(6, angle);
var _yOffset = lengthdir_y(6, angle);
var _owner = owner;
var _bulletNum = 8;

for (var _i = 0; _i < _bulletNum; _i++) 
{    
	var _bullet = instance_create_depth(x + _xOffset, y + _yOffset, depth + 1, projectile);
	var _angle = angle;
	with (_bullet)
	{
		var _randomAngle = _angle + random_range(-2, 2);
		hsp = lengthdir_x(_speed, _randomAngle);
		vsp = lengthdir_y(_speed, _randomAngle);
		image_angle = _angle;
	
		hurtbox_initialize(_damage, _owner);
	}
}

//Resets timer
cooldown = maxCooldown;

//Play sound effect
audio_play_sound(sfx_fire, 0, false);