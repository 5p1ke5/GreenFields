/// @description does player things, inherits physics
event_inherited();

doll_input_jump(A_BUTTON_PRESSED, A_BUTTON);
doll_input_move(RIGHT_BUTTON, LEFT_BUTTON, X_BUTTON);
doll_input_aim(point_direction(x, y, mouse_x, mouse_y), myHeld, MOUSE_LEFT_BUTTON, MOUSE_RIGHT_BUTTON, MOUSE_LEFT_BUTTON_RELEASED, MOUSE_RIGHT_BUTTON_RELEASED);

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
