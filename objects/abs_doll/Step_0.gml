/// @description inherits physics, senses collision.
event_inherited();


if (myHeld)
{
	myHeld.Step();
}


///Set sprite properties.
doll_animate();

living_step();