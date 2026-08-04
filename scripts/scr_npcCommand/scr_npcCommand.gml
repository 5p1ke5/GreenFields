///@function NPCCommand() constructor
///@description struct that describes the current state of the NPC associated with it. Children define specific states below.
function NPCCommand() constructor
{
	//Performs whatever action the state is associated with. Should usually be overwritten.
	static Perform = function(_user)
	{
		show_debug_message("Called!");
	}
	
	
	// Makes the user idly point their gun downwards if not fighting.
	static IdleHands = function(_user)
	{
		with (_user)
		{
			mouseX = facing == -1 ? bbox_left : bbox_right;
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

/// @function NPCCommandSpeak() 
/// @description Forces the NPC to set their dialogue index to zero and make a new speech balloon with their current dialogue.
/// @param _dialogue An array or string containing things for the NPC to say. If a string it will be converted to an array.
function NPCCommandSpeak(_dialogue = noone) : NPCCommand() constructor 
{
	//If dialogue is a string converts it to an array containing just that string.
	dialogue = _dialogue;
	if (is_string(_dialogue))
	{
		dialogue = [_dialogue];	
	}
	
	static Perform = function(_user)
	{
		var _dialogue = dialogue;
		with (_user)
		{
			//If the NPCCommandSpeak has a dialogue value set, sets the npc's dialogue value to that.
			if (_dialogue != noone)
			{
				dialogue = _dialogue;	
			}
			
			instance_destroy(myBalloon);
			dialogueIndex = 0;
			npc_dialogue();
			npc_exit_command();
		}
	}
}

///@function NPCCommandMove(_target, _duration, _range)
///@description state for when NPC is moving towards a given point. Once the NPC gets there they just wait so this can also be used to make an NPC wait at a given point. If the NPC has more than one item in npcCommands exits upon reaching the point.
///@param _target Point2 for the target to move towards. Also accepts an instance.
///@param _duration Time for the NPC to wait at the given point. If set to 'noone' it has no end duration.
///@param _range How close the NPC needs to get. Normally set to undefined, defaulting to npc_input_moveto's default.
function NPCCommandMove(_target, _duration = noone, _range = undefined): NPCCommand() constructor
{
	target = _target;
	duration = _duration;
	range = _range;
	
	static Perform = function(_user)
	{
		//If target is an instance and no longer exists attempts to exit state.
		if !is_struct(target) && !(instance_exists(target))
		{
			with (_user)
			{
				npc_exit_command();
			}
			return;
		}
		
		//Sets input to move towards the target.
		var _target = target;
		var _atTarget = noone;
		var _range = range;
		with (_user)
		{
			_atTarget = npc_input_moveto(_target, _range);
		}
		IdleHands(_user);
		
		
		//If no duration is set exits the function, skipping any duration code.
		if (duration == noone)
		{
			return;	
		}
		
		//If duration is above zero decrements it while the player is at the target. Otherwise attempts to exit the command.
		if (duration >= 0)
		{
			if (_atTarget)
			{
				duration--;	
			}
		}
		else
		{
			with (_user)
			{
				npc_exit_command();	
			}
		}
	}
}




//TODO: Test this after lunch

/// @function NPCCommandAwait(_target, _duration, _range)
/// @description State for when the NPC is awaiting some instance or Point2 approaching it before executing further commands
/// @param _target The instance or other variable with xy values that will be awaited.
/// @param _range How close the target needs to be to the NPC.
function NPCCommandAwait(_target, _range = RANGE_CLOSE/2): NPCCommand() constructor
{
	target = _target;
	range = _range;
	static Perform = function(_user)
	{
		// Wait for the target and if within _range attempts to exit command.
		var _target = target;
		var _range = range;
		
		with (_user)
		{
			var _distance = distance_to_point(_target.x, _target.y);
			if (_distance < _range)
			{
				npc_exit_command();	
			}
		}
	}
}


/// @function NPCCommandFight(_target)
/// @description Command to make the NPC hunt down and fight a target
/// @param _target The target to fight.
function NPCCommandFight(_target): NPCCommand() constructor
{
	target = _target;
	
	static Perform = function(_user)
	{
		if !(instance_exists(target))
		{
			with (_user)
			{
				mLeftButton = false;
				mRightButton = false;
				mLeftButtonPressed = false;
				mRightButtonPressed = false;
				npc_exit_command();
			}
			return;
		}
		
		var _target = target;
		
		if (_target)
		{
			with (_user)
			{
				npc_input_fight(_target);
			}
		}
	}
}


/// @function NPCCommandCheckCondition(_conditionMethod, _arguments = [])
/// @description Checks a passed _conditionMethod function. If _conditionMethod evaluates as true, attempts to exit this command.
/// @param _conditionMethod a method that is checked in the Perform function of this struct. If it returns truthy, exits the command.
/// @param _arguments an array of optional arguments to be given to the _conditionMethod at creation.
function NPCCommandCheckCondition(_conditionMethod, _arguments = []) : NPCCommand() constructor
{
	conditionMethod = _conditionMethod;
	arguments = _arguments;
	
	static Perform = function(_user)
	{
		var _conditionReturn = conditionMethod(arguments);
		
		if (_conditionReturn)
		{
			with (_user)
			{
				npc_exit_command();	
			}
		}
	}
}


/// @function NPCCommandSetDialogue(_dialogueArray)
/// @description Command to set the NPCs dialogue to the given array. After doing so attempts to eit comand.
/// @param _dialogueArray Array containing the dialogue strings
function NPCCommandSetDialogue(_dialogue) : NPCCommand() constructor
{
	dialogue = _dialogue;
	
	static Perform = function(_user)
	{
		var _dialogue = dialogue;
		
		with (_user)
		{
			dialogue = _dialogue;
			npc_exit_command();
		}
	}
}

