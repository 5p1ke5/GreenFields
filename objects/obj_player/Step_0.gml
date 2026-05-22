/// @description does player things, inherits physics

doll_input_jump(A_BUTTON_PRESSED, A_BUTTON);
doll_input_move(RIGHT_BUTTON, LEFT_BUTTON, X_BUTTON);
doll_input_dash(RIGHT_BUTTON_RELEASED, LEFT_BUTTON_RELEASED);
doll_input_equipment(UP_BUTTON_RELEASED, DOWN_BUTTON_RELEASED);
doll_input_aim(point_direction(x, y, mouse_x, mouse_y), myHeld, MOUSE_LEFT_BUTTON, MOUSE_RIGHT_BUTTON, MOUSE_LEFT_BUTTON_RELEASED, MOUSE_RIGHT_BUTTON_RELEASED);

//Inherits physics and collision from doll.
event_inherited();

//update alert. TODO: once interactables are added add a thing that sets 'interact' to 'true'
alert = "";

if (interact)
{
	alert += "?";
}
