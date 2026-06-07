/// @description inherits physics, senses collision.
event_inherited();

living_step();

if (myHeld)
{
	myHeld.Step();
}


///Set sprite properties.
doll_animate();