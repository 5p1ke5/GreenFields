/// @description does player things, inherits physics

npc_step();

doll_input_jump(aButtonPressed, aButton);
doll_input_move(rightButton, leftButton, runButton);
doll_input_equipment(upButtonReleased, downButtonReleased);

var _angle = point_direction(x, y, mouseX, mouseY);
doll_input_aim(_angle, myHeld, mLeftButton, mRightButton, mLeftButtonPressed, mRightButtonPressed, mLeftButtonReleased, mRightButtonReleased);


//Inherits physics and collision from doll.
event_inherited();


var _collisions = hitbox_step();

//Goes through all the collisions and processes each one.
for (var _i = 0; _i < array_length(_collisions); _i++) 
{   
	var _collision = _collisions[_i];
	var _owner = _collision.owner;
	
	if (object_is_ancestor(_collision.object_index, HURTBOX_ANY)) || (_owner != self)
	{
		living_take_damage(_collision.damage);
	
		if (_owner != noone)
		{
			array_push(sensedEnemies, _owner);
		}
	}
}