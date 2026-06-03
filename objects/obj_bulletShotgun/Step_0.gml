/// @desc On the first step event, creates 10 bullets at different angles and then destroys self.

var _speed = 16;
var _damage = damage;

var _xOffset = lengthdir_x(6, angle);
var _yOffset = lengthdir_y(6, angle);
var _owner = owner;
var _bulletNum = 10;
var _projectile = obj_bullet;
var _angle = angle;

for (var _i = 0; _i < _bulletNum; _i++) 
{    
	var _bullet = instance_create_depth(x + _xOffset, y + _yOffset, depth + 1, _projectile);
	with (_bullet)
	{
		var _randomAngle = _angle + (-2 + (4 * (1/(_bulletNum - _i) )));
		hsp = lengthdir_x(_speed, _randomAngle);
		vsp = lengthdir_y(_speed, _randomAngle);
		image_angle = _angle;
	
		hurtbox_initialize(_damage, _owner);
	}
}

instance_destroy();