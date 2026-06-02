/// @description inherits physics, senses collision.
event_inherited();

living_step();

if (myHeld)
{
	myHeld.Step();
}

var _collisions = hitbox_step();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	var _collision = _collisions[_i];
	
	if (_collision.owner != self)
	{
		living_take_damage(_collision.damage);
	}
}

///Set sprite properties.
doll_animate();