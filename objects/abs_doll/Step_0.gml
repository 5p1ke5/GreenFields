/// @description does player things, inherits physics
event_inherited();

var _collisions = hitbox_step();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	
}

///Set sprite properties.
doll_animate();