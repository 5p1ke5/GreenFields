/// @description uses npc_step to decide input based on NPC things, then uses that input for movement.

npc_step();


var _angle = point_direction(x, y, mouseX, mouseY);

doll_input_aim(_angle, myHeld, mLeftButton, mRightButton, mLeftButtonPressed, mRightButtonPressed, mLeftButtonReleased, mRightButtonReleased);
doll_input_jump(aButtonPressed, aButton);
doll_input_move(rightButton, leftButton, runButton);
doll_input_equipment(upButtonReleased, downButtonReleased);

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
		var _damage = _collision.damage
		living_take_damage(_damage);
	
		if (_owner != noone) 
		{
			switch (faction) 
			{
				//Some factions allow infighting.
			    case FACTIONS.NONE:
					npc_enemies_add(_owner);
			        break;
				//Most only add you to the list if you're in a different faction.
			    default: 
					if (faction != _owner.faction)
					{
						npc_enemies_add(_owner);
					}
			        break;
			}
		}
		
		//shoot blood out here.
		var _x = _collision.x;
		var _y = _collision.y;
		var _angle = point_direction(x, y, _x, _y);
	
		living_bleed(_angle, _damage * 2);
		
		audio_play_sound_pos(sfx_hitNPC, x, y);
	}
}