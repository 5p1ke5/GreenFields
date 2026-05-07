/// @description does player things, inherits physics
event_inherited();

#region ///Movement Controls.
//Jumping.
if (A_BUTTON_PRESSED) //Jumps
{
	if (grounded)
	{
		vsp = -jumpHeight;
		hsp += hspExt;
		hspExt = 0;
	}
} 

//Offsets gravity to allow for jump cancelling
if (A_BUTTON) 
{
	vsp -= jumpOffset;
}

///Movement
//What direction the instance is trying to move. 1 is right, 0 is neutral, -1 is left.
hDir = RIGHT_BUTTON - LEFT_BUTTON;

//Pressing X makes the player run faster and animate faster too.
if (X_BUTTON_PRESSED)
{
	image_speed = animSpeedRun;
}

if (X_BUTTON_RELEASED)
{
	image_speed = animSpeed;	
}

//If hDir is non-zero adds to hsp every frame and also sets facing direction.
if (hDir != 0)
{
	hsp = phys_force_add(hsp, accel * hDir, maxSpeed + (0.5 * maxSpeed * X_BUTTON))
	facing = hDir;
}
#endregion

#region //mouse controls
handAngle = point_direction(x, y, mouse_x, mouse_y);

if (myHeld)
{
	//TODO: put these event_user(#) indices into an enum
	if (MOUSE_LEFT_BUTTON)
	{
		with (myHeld) { event_user(0);}
	}
	
	if (MOUSE_RIGHT_BUTTON)
	{
		with (myHeld) { event_user(1);}
	}
	if (MOUSE_LEFT_BUTTON_RELEASED)
	{
		with (myHeld) { event_user(2);}
	}
	
	if (MOUSE_RIGHT_BUTTON_RELEASED)
	{
		with (myHeld) { event_user(3);}
	}
}

#endregion


#region ///Collision
var _collisions = hitbox_step();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	
}
#endregion

///Set sprite properties.
doll_animate();



//update alert. TODO: once interactables are added add a thing that sets 'interact' to 'true'
alert = "";

if (interact)
{
	alert += "?";
}
