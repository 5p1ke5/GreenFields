/// @function npc_initialize(_name = "", _dialogue = "")
/// @description Initializes npc variables.
/// @param _name Name of the character.
/// @param _dialogue Text string to be put in the speech balloon.
/// @param _commands An array of commands for the NPC to follow.
function npc_initialize(_name = "", _dialogue = "", _commands = [])
{
	name = _name;
	
	if (is_string(_dialogue))
	{
		_dialogue = [_dialogue];	
	}
	
	dialogue = _dialogue;
	dialogueIndex = 0;
	talkedToCount = 0;

	//An array of commands for the NPC to follow.
	commands = _commands;
	
	//This will contain a reference to any dialogue balloon the NPC creates.
	//If it equals noone the NPC has no created dialogue balloons.
	myBalloon = noone;
	
	
	//These values correspond to palyer inputs. The NPC is essentially being 'controlled' by the computer
	aButtonPressed = false;
	aButton = false;
	rightButton = false;
	leftButton = false;
	runButton = false;
	mLeftButton = false;
	mRightButton = false;
	mLeftButtonReleased = false;
	mRightButtonReleased = false;
	mLeftButtonPressed = false;
	mRightButtonPressed = false;
	upButtonReleased = false;
	downButtonReleased = false;
	mouseX = x;
	mouseY = y;
}


/// @function npc_step()
/// @description Sets input variables defined in npc_initialize to make them move according to npc behavior.
function npc_step()
{
	if (array_length(commands) == 0)
	{
		return;	
	}
	
	var _command = commands[0]
	
	_command.Perform(self);
}

/// @function npc_input_moveto(_target)
/// @desc Controls NPC input to make it move towards a given target (Point2 or instance). Return true if they are at the position, false if still moving towards it.
/// @param _target A point2 or instance for the npc to move towards.
/// @param _range How close the move to the target.
function npc_input_moveto(_target, _range = RANGE_CLOSE/2)
{
	
	rightButton = (_target.x - x > _range);
	leftButton = (_target.x - x < -_range);
	
	//If the npc is at position returns true.
	if (point_distance(x, y, _target.x, _target.y) < _range)
	{
		return true;	
	}
	
	aButton = false;
	aButtonPressed = false;
	
	//Later replace this with code that checks if wall is in front of the npc or a platform to jump on
	if (point_distance(x, y, _target.x, _target.y) < _range * 2)
	{
		if (_target.y < y)
		{
			aButton = true;
			aButtonPressed = (vsp == 0);
		}
	}
	
	//Since the player is not at position returns false.
	return false;
}


/// @function npc_input_fight(_target)
/// @desc Controls NPC to make them move into position and attack a target. Returns true if the target is being attacked, false if not.
/// @param _target Target to attack.
function npc_input_fight(_target)
{	
	//checks weapon type, assesses a good point at which to attack the target (melee, ranged vantage point)
	var _equip = noone;
	
	if (array_length(inventory) > 0)
	{
		_equip = inventory[equipIndex];	
	}
	
	if (is_instanceof(_equip, ItemEquipMelee))
	{
		//I'll program in melee fight code later.
		return true;
	}
	else //For now everything can use the same code for ranged weapons.
	{
		var _inRange = npc_input_moveto(_target, RANGE_LONG);
		
		//Checks if the npc has an unblocked line of fire.
		if (collision_line(x, y, _target.x, _target.y, BLOCK, true, true))
		{
			//Later make it so we override the previous npc_input_moveto command. Something like...
			//npc_input_moveto(new Point2(x, y + 200), RANGE_CLOSE);
			
			return false;
		}
		
		//This is actually really strong, make a way for it to be a little less scary
		if (_inRange)
		{
			mLeftButton = (irandom(30) == 0);
			mLeftButtonPressed = (irandom(30) == 0);
			mouseX = _target.xprevious + (mLeftButton || mLeftButtonPressed) * irandom_range(-50, 50);
			mouseY = _target.yprevious + (mLeftButton || mLeftButtonPressed) * irandom_range(-50, 50);
			
			return true;
			/*
			mLeftButton = (irandom(120) == 0);
			mLeftButtonPressed = (irandom(120) == 0);
			
			mouseX = _target.xprevious;
			mouseY = _target.yprevious;
			mLeftButton = true;
			mLeftButtonPressed = true;
			*/
		}
	}
	return false;
}


///@function npc_exit_command()
///@description Attempts to exit the npc's current command. Can only exit command if npcCommands array has more than 1 item. Needs to be called from within an NPC instance.
///@returns The next command in the array or noone if there is only 1 item in the array.
function npc_exit_command()
{
	//State can only be exited if the number of items in npcState is greater than 1.
	if (array_length(commands) > 1)
	{
		array_shift(commands); //If so, deletes the current state from the npcCommands array
		return commands[0];
	}
	
	return noone;
}

/// @function npc_speak(_text, _name = undefined)
/// @description generates a speech balloon for the npc.
/// @param _text The text to be put in the balloon.
/// @param _name The name to be put in the balloon.
function npc_speak(_text, _name = "")
{
	if (_name == "")
	{
		_name = name; //If a name is not given just puts in the NPC's name
	}
	//Creates speech balloon object.
	
	//Gets height of the balloon text when using fnt_speech, then resets font.
	var _balloonHeight = string_height_ext(_text, string_height(_text), TEXT_BALLOON_MAXW);
	
	var _balloon = instance_create_depth(x, y - 32 - (_balloonHeight/2), depth, obj_speechBalloon);
	with (_balloon)
	{
		speechBalloon_initialize(_text, string_length(_text) * TEXT_BALLOON_SPEED, other, _name);
	}
	
	return _balloon;
}


/// @function npc_dialogue()
/// @description Attempts to generate a speech balloon if none exists, incrementing dialogue.
function npc_dialogue()
{
	if !(myBalloon)
	{
		myBalloon = npc_speak(dialogue[dialogueIndex], name);
		dialogueIndex++;
		if (dialogueIndex >= array_length(dialogue))
		{
			dialogueIndex = 0;
		}
	}
}


/// @function npc_dialogue_ext(_myBalloon, _dialogue, _dialogueIndex, _name)
/// @description Attempts to generate a speech balloon if none exists, incrementing dialogue. Returns the incremented dialogue index.
/// @param _myBalloon Reference to the dialogue balloon object.
/// @param _dialogue Array of dialogue strings.
/// @param _dialogueIndex he index in the dialogue array to call.
/// @param _name The name to put in the dialogue balloon.
function npc_dialogue_ext(_dialogue = dialogue, _dialogueIndex = dialogueIndex, _name = name)
{
	if !(myBalloon)
	{
		myBalloon = npc_speak(_dialogue[_dialogueIndex], _name);
		_dialogueIndex++;
		if (_dialogueIndex >= array_length(_dialogue))
		{
			_dialogueIndex = 0;
		}
	}
	
	return _dialogueIndex;
}


/// @function speechBalloon_initialize(_text, _maxTime, _owner, _name)
/// @description Initializes variables for a specch balloon object.
/// @param _text The text that will be displayed.
/// @param _time The amount of time for which the balloon will exist.
/// @param _owner The instance that created this object.
/// @param _name The name of the npc that created this balloon.
function speechBalloon_initialize(_text, _maxTime, _owner, _name)
{
	text = _text;
	maxTime = _maxTime;
	time = maxTime;
	owner = _owner;
	name = _name;
	height =  string_height_ext(text, string_height(text), TEXT_BALLOON_MAXW);
}