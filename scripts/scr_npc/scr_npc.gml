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
function npc_input_moveto(_target)
{
	if (point_distance(x, y, _target.x, _target.y) < RANGE_CLOSE/2)
	{
		//If the npc is at position returns true.
		//Note: After making a fight script onsider if I should have it set aButton etc to false before returning true or just leave as is 
		return true;	
	}
	
	var _aButton = false;
	var _aButtonPressed = false;
	var _rightButton = (_target.x - x > RANGE_CLOSE/2);
	var _leftButton =  (_target.x - x < -RANGE_CLOSE/2);
	
	if (point_distance(x, y, _target.x, _target.y) < RANGE_CLOSE)
	{
		if (_target.y < y)
		{
			_aButton = true;
			_aButtonPressed = (vsp == 0);
		}
	}
	
	aButton = _aButton;
	aButtonPressed = _aButtonPressed;
	rightButton = _rightButton;
	leftButton = _leftButton;
	
	//Since the player is not at position returns false.
	return false;
}


/// @function npc_input_fight(_target)
/// @desc Controls NPC to make them move into position and attack a target.
function npc_input_fight(_target)
{
	//checks weapon type, assesses a good point at which to attack the target (melee, ranged vantage point)
	
	//Something like
	//npc_input_moveto(position)
	//to get into position
	
	//And then sets input to attack the target if in position
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
	
	var _balloon = instance_create_layer(x, y - 32 - (_balloonHeight/2), layer, obj_speechBalloon);
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