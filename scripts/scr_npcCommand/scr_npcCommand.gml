///@function NPCCommand() constructor
///@description struct that describes the current state of the NPC associated with it. Children define specific states below.
function NPCCommand() constructor
{
	//Performs whatever action the state is associated with. Should usually be overwritten.
	static Perform = function(_user)
	{
		print("Called!");
	}
}

///@function NPCCommandMove(_target, _duration)
///@description state for when NPC is moving towards a given point. Once the NPC gets there they just wait so this can also be used to make an NPC wait at a given point. If the NPC has more than one item in npcCommands exits upon reaching the point.
///@param _target Point2 for the target to move towards. Also accepts an instance.
///@param _duration Time for the NPC to wait at the given point.
function NPCCommandMove(_target, _duration = -1): NPCCommand() constructor
{
	target = _target;
	duration = _duration;
	
	static Perform = function(_user)
	{
		//If target no longer exists attempts to exit state.
		if (true)//* !(npc_check_target(target))
		{
			with (_user)
			{
				//* npc_exit_command();
				return;
			}
		}
		
		var _target = target;
		var _duration = duration;
		with (_user)
		{
			//Moves towards target point until right at it.
			// * npc_move_to(_target);
			
			//If NPC gets to their location waits for duration (if any) and then attempt to exit state.
			if (distance_to_point(_target.x, _target.y) < RANGE_CLOSE)
			{
				if (_duration > -1)
				{
					_duration--;	
				}
				else
				{
					//* npc_exit_command();
				}
			}
		}
		
		duration = _duration;
	}
}

