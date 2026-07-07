/// @description does player things, inherits physics

doll_input_jump(A_BUTTON_PRESSED, A_BUTTON);
doll_input_move(RIGHT_BUTTON, LEFT_BUTTON, true);
doll_input_dash(B_BUTTON, RIGHT_BUTTON, LEFT_BUTTON);
doll_input_equipment(UP_BUTTON_RELEASED, DOWN_BUTTON_RELEASED);
doll_input_pause(START_BUTTON_RELEASED);
doll_input_aim(point_direction(x, y, mouse_x, mouse_y), myHeld, MOUSE_LEFT_BUTTON, MOUSE_RIGHT_BUTTON, MOUSE_LEFT_BUTTON_PRESSED, MOUSE_RIGHT_BUTTON_PRESSED, MOUSE_LEFT_BUTTON_RELEASED, MOUSE_RIGHT_BUTTON_RELEASED);
doll_input_interact(X_BUTTON_PRESSED);

//Inherits physics and collision from doll.
event_inherited();

var _collisions = hitbox_step();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	var _collision = _collisions[_i];
	var _damage = _collision.damage;
	
	if (_collision.owner != self)
	{
		living_take_damage(_damage);
		
		var _x = _collision.x;
		var _y = _collision.y;
		var _angle = point_direction(x, y, _x, _y);
	
		living_bleed(_angle, _damage * 4);
	}
}

//Sets audio listener position to player position.
audio_listener_position(x, y, 0)