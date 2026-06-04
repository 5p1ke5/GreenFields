/// @function npc_initialize(_name = "", _dialogue = "")
/// @description Initializes npc variables.
/// @param _name Name of the character.
/// @param _dialogue Text string to be put in the speech balloon.
/// @param _target The current target the NPC is trying to attack. Noone means the NPC is passive and not doing anything. 
function npc_initialize(_name = "", _dialogue = "", _target = noone)
{
	name = _name;
	
	if (is_string(_dialogue))
	{
		_dialogue = [_dialogue];	
	}
	
	dialogue = _dialogue;
	dialogueIndex = 0;
	talkedToCount = 0;

	/*This should be noone or a reference to an instance. Later I will add a Point2 struct. Basically a state. What each one does:
	**Instance: Something that the NPC is trying to attack.
	**noone: The npc is doing nothing and can be idle.
	**Point2: The npc should move here.
	
	Hmm I could also make this something like State and have an NPCState struct that it gets data from. Decisions, decisions.
	*/
	target = _target;
	
	//This will contain a reference to any dialogue balloon the NPC creates.
	//If it equals noone the NPC has no created dialogue balloons.
	myBalloon = noone;
	
	
	//These values correspond to palyer inputs. The NPC is essentially being 'controlled' by the computer.
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