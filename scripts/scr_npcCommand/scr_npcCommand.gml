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


///@function NPCCommandMove(_target, _duration)
///@description state for when NPC is moving towards a given point. Once the NPC gets there they just wait so this can also be used to make an NPC wait at a given point. If the NPC has more than one item in npcCommands exits upon reaching the point.
///@param _target Point2 for the target to move towards. Also accepts an instance.
///@param _duration Time for the NPC to wait at the given point. If set to 'noone' it has no end duration.
function NPCCommandMove(_target, _duration = noone): NPCCommand() constructor
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
				npc_exit_command();
				return;
			}
		}
		
		//Sts player input to move towards the target.
		var _target = target;
		var _atTarget = noone;
		with (_user)
		{
			_atTarget = npc_input_moveto(_target);
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


///@function  NPCCommandTalkTo(_target, _dialogue)
///@description Makes NPC move to point while saying a specified line.
///@param _target The target to move towards while talking.
///@param _dialogue What to say. 
function NPCCommandTalkTo(_target, _dialogue): NPCCommand() constructor
{
	target = _target;
	
	if (is_array(_dialogue))
	{
		dialogue = _dialogue;
	}
	else
	{
		dialogue = [_dialogue];	
	}
	
	dialogueIndex = 0;
	
	static Perform = function(_user)
	{
		var _target = target;
		var _dialogue = dialogue;
		var _dialogueIndex = dialogueIndex;
		
		//Moves towards position, does dialogue and increments dialogue index.
		with(_user)
		{
			npc_input_moveto(_target);
			_dialogueIndex = npc_dialogue_ext(_dialogue, _dialogueIndex, name);
		}
		
		dialogueIndex = _dialogueIndex;
		
		// If it reaches the end of dialogue dialogueIndex will be set to 0. This is the exit condition.
		if (dialogueIndex == 0)
		{
			with (_user)
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
		var _target = target;
		with (_user)
		{
			npc_input_fight(_target);
		}
	}
}