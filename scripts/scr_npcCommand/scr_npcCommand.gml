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
	
	//Direction the state is telling the NPC to move to. If both are 0 just doesn't move.
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
			
			//Either picks a direction and starts to move (true) or stays still till timer goes off next (false).
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
		
		//Command the user to move.
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
		if (!target)
		{
			with (_user)
			{
				//* npc_exit_command();
				return;
			}
		}
		
		/*This may want to go in something like npc_movement(x1, y1, x2, y2) but it'd be hard getting _rightButton etc as outputs. I could just put the 'with (_user)' block in the function too, maybe...
		var _aButton = false;
		var _aButtonPressed = false;
		var _rightButton = false;
		var _leftButton = false;
		
		if (point_distance(_user.x, _user.y, target.x, target.y) > RANGE_CLOSE)
		{
			if (target.x - _user.x > RANGE_CLOSE)
			{
				// move left
				_rightButton = true;
			}
			else if (target.x - _user.x < -RANGE_CLOSE)
			{
				_leftButton = true;
			}
			else if (target.y < _user.y)
			{
				_aButtonPressed = (_user.vsp == 0);
				_aButton = true;
			}
		}
		
		with (_user)
		{
			aButton = _aButton;
			aButtonPressed = _aButtonPressed;
			rightButton = _rightButton;
			leftButton = _leftButton;
		}
		*/
		var _target = target;
		with (_user)
		{
			npc_input_moveto(_target)
		}
		
		IdleHands(_user);
	}
}

