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

/// @function npc_input_move_to(_target)
/// @desc Controls NPC input to make it move towards a given target (Point2 or instance)
/// @param _target A point2 or instance for the npc to move towards.
function npc_input_move_to(_target)
{
	
}

/// @function npc_speak(_text, _name = undefined)
/// @description generates a speech balloon for the npc.
/// @param _text The text to be put in the balloon.
/// @param _name The name to be put in the balloon.
function npc_speak(_text, _name = undefined)
{
	if (!_name)
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