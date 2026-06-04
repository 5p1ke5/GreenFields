///@function NPCCommand() constructor
///@description struct that describes the current state of the NPC associated with it. Children define specific states below.
function NPCCommand() constructor
{
	//Performs whatever action the state is associated with. Should usually be overwritten.
	static Perform = function(_user)
	{
		print("Called!");
	}
	
	
	// Makes the user idly point their gun downwards if not fighting.
	static IdleHands = function(_user)
	{
		
		with (_user)
		{
			mouseX = facing == 1 ? bbox_left : bbox_right;
			mouseY = bbox_bottom;
		}
	}
}

///@function NPCCommandIdle(): NPCCommand() constructor
///@description state for when NPC is idle. Just makes them sort of mill about. No exit condition.
function NPCCommandIdle(): NPCCommand() constructor
{
	//How long the NPC waits between switching between standing still and moving around.
	passiveTimer = -1;
	
	//Directions the state is telling the NPC to move to. If both are 0 just doesn't move.
	commandHDir = 0;
	
	static Perform = function(_user)
	{
		//Increments timer, makes doll move in chosen direction.
		if (passiveTimer >= 0)
		{
			passiveTimer--;
		}
		else
		{
			//Reset timer.
			passiveTimer = NPC_PASSIVE_CD;
			
			//Either picks a new direction to move in or stays still till timer goes off next.
			var _move = choose(true, false);
			if (_move)
			{
				commandHDir = irandom_range(-1, 1);
			}
			else
			{
				commandHDir = 0;
			}
		}
		var _hDir = commandHDir;
		
		
		with (_user)
		{
			rightButton = (_hDir < 0);
			leftButton = (_hDir > 0);
		}
		IdleHands(_user);
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

