/// @function npc_initialize(_name = "", _dialogue = "")
/// @description Initializes npc variables.
/// @param _name Name of the character.
/// @param _dialogue Text string or array of text strings to be put in the speech balloon(s).
/// @param _commands An array of commands for the NPC to follow.
/// @param _combatLevel How strong the NPC is. Modifies aim and how often they fire. Higher = less skilled, lower = stronger.
function npc_initialize(_name = "", _dialogue = "", _commands = [], _combatLevel = 50, _faction = FACTIONS.NONE)
{
	name = _name;
	combatLevel = _combatLevel;
	faction = _faction;
	
	//If dialogue is just a string turns it into an array containing just that string as its single element.
	if (is_string(_dialogue))
	{
		_dialogue = [_dialogue];	
	}
	
	dialogue = _dialogue;
	dialogueIndex = 0;
	talkedToCount = 0;

	//An array of commands for the NPC to follow.
	commands = _commands;
	commandIndex = 0;
	
	//This will contain a reference to any dialogue balloon the NPC creates. Noone indicates the NPC does not have a dialgue balloon.
	myBalloon = noone;
	
	//Arrays containing the other dolls that are sensed and another one listing the enemies.
	sensedDolls = [];
	sensedEnemies = [];
	
	//These values correspond to palyer inputs. The NPC is essentially being 'controlled' by these variables being fed into the corresponding doll_input_* functions.
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
/// @description Sets input variables defined in npc_initialize to make them move according to npc behavior, updates sensed NPCs.
function npc_step()
{
	//If dialogue is in progress tries to continue.
	if (dialogueIndex > 0)
	{
		npc_dialogue();
	}
	
	npc_update_sensed();
	
	//If there are enemies ignores the current command to try and fight them, then exits the function.
	if (array_length(sensedEnemies) > 0)
	{
		var _enemy = sensedEnemies[0];
		npc_input_fight(_enemy);
		return;
	}
	
	//If there are no commands just exits.
	if (array_length(commands) == 0)
	{
		return;	
	}
	
	//Otherwise calls the Perform method of the first command in the array.
	/*TODO: make this more like 
		var _command = commands[commandIndex];
		
	then I can have stuff like NPCCommandGoto(_condition, _indexes[])
	*/
	var _command = commands[commandIndex];
	_command.Perform(self);
}


/// @function npc_update_sensed()
/// @descr Updates the arrays of sensed dolls.
function npc_update_sensed()
{
	sensedDolls = collision_circle_array(x, y, RANGE_LONG, abs_doll, false, true, false);
	
	//Add any enemies sensed to the sensedEnemies array if they're not already there.
	for (var _i = 0; _i < array_length(sensedDolls); _i++) 
	{
		var _sensed = sensedDolls[_i];
		
		//If it's already in the sensedEnemies array we don't need to do anything else so breaks.
		if (array_get_index(sensedEnemies, _sensed) > -1)
		{
			break;
		}
		
		//Can't sense through walls
		if (collision_line(x, y, _sensed.x, _sensed.y, BLOCK, false, true))
		{
			break;	
		}
		
		//Adds enemies to the enemies array based on the faction of the NPC calling this function.
	    switch (faction)
		{
			case FACTIONS.HOSTILE: //If HOSTILE just adds anyone they see that's in a different faction.
				if (_sensed.faction != faction)
				{
					array_insert(sensedEnemies, 0, _sensed);
				}
			break;
			
			case FACTIONS.ENEMY: //If ENEMY then it is hostile to just the player.
				if (_sensed.faction == FACTIONS.PLAYER)
				{
					array_insert(sensedEnemies, 0, _sensed);
				}
			break;
			
			case FACTIONS.POLICE: //if Police adds all criminals + player if wanted
				if (_sensed.faction == FACTIONS.CRIMINAL)
				{
					array_insert(sensedEnemies, 0, _sensed);
				}
				
				/*
				if (_sensed.faction == FACTIONS.PLAYER)
				{
					//Check wanted level here...	
				}
				*/
			break;
			
			case FACTIONS.CRIMINAL: //if criminal adds all police to enemies.
				if (_sensed.faction == FACTIONS.POLICE)
				{
					array_insert(sensedEnemies, 0, _sensed);
				}
			break;
		}
	}	

	//Filters out destroyed enemies.
	var _filter = function(element, index){ return instance_exists(element);}
	sensedEnemies = array_filter(sensedEnemies, _filter);

}


/// @function npc_enemies_add(_target)
/// @desc Adds a target to the front of the sensedEnemies array. If already in the array, removes it and then adds it to the start.
/// @param _target The object to be added to the front of the array.
function npc_enemies_add(_target)
{
	var _index = array_get_index(sensedEnemies, _target);
	
	//If the target is in the list, removes it from the list before putting it back in front.
	if (_index > -1)
	{
		array_delete(sensedEnemies, _index, 1);
	}
	array_insert(sensedEnemies, 0, _target);
}

/// @function npc_input_moveto(_target)
/// @desc Controls NPC input to make it move towards a given target (Point2 or instance). Return true if they are at the position, false if still moving towards it.
/// @param _target A point2 or instance for the npc to move towards.
/// @param _range How close the move to the target.
function npc_input_moveto(_target, _range = RANGE_CLOSE/2)
{
	aButton = false;
	aButtonPressed = false;
	rightButton = false;
	leftButton = false;
	
	//If the npc is at position we're done so it returns true.
	if (distance_to_point(_target.x, _target.y) < _range)
	{
		return true;	
	}
	
	//Jumps up if target is horizontally close and vertically above calling instace
	if (point_distance(x, y, _target.x, y) < _range)
	{
		if (_target.y < y)
		{
			aButton = true;
			aButtonPressed = (vsp == 0);
		}
	}
	
	rightButton = (_target.x - x > _range);
	leftButton = (_target.x - x < -_range);
	
	
	var _dir = rightButton - leftButton;
	
	//Tries to jump if an obstacle is in the way
	//if (collision_line(x, y, x + (_dir * abs(sprite_width) * 4), y, BLOCK, false, true))
	if (collision_line(x, bbox_bottom - 1, x + (_dir * abs(sprite_width) * 4), y, BLOCK, false, true))
	{
		aButton = true;
		aButtonPressed = (vsp == 0);
	}
	
	//Jumps if there's no floor beneath where the player is goin
	// if !(place_meeting(x + (_dir * abs(sprite_width) * 2), bbox_bottom + 1, GROUND))
	//if !collision_line(x + (_dir * abs(sprite_width) * 2), y, x + (_dir * abs(sprite_width) * 2), y + (sprite_height), GROUND, false, true )
	if !collision_line(x + (_dir * abs(sprite_width)), bbox_bottom, x + (_dir * abs(sprite_width) * 2), bbox_bottom + (sprite_height * 4), GROUND, false, true )
	{
		aButton = true;
		aButtonPressed = grounded;
	}
	
	//Since the instance is not at position returns false.
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
			return false;
		}
		
		//If the target is within range tries to shoot at them.
		if (_inRange)
		{
			mLeftButton = (irandom(combatLevel/2) == 0);
			mLeftButtonPressed = (irandom(combatLevel/2) == 0);
			mouseX = _target.xprevious + (mLeftButton || mLeftButtonPressed) * irandom_range(-combatLevel, combatLevel);
			mouseY = _target.yprevious + (mLeftButton || mLeftButtonPressed) * irandom_range(-combatLevel, combatLevel);
			
			return true
		}
	}
	
	return false;
}


///@function npc_exit_command()
///@description Attempts to exit the npc's current command. Can only exit command if there's a command corresponding to commandIndex + 1, Needs to be called from within an NPC instance. Returns the next command.
///@returns The next command in the array or noone if at the end of the command array.
function npc_exit_command()
{
	if (commandIndex < array_length(commands))
	{
		commandIndex++;
		return commands[commandIndex];
	}
	
	return noone;
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
	
	var _balloon = instance_create_depth(x, y - (sprite_height) - (_balloonHeight), depth, obj_speechBalloon);
	with (_balloon)
	{
		speechBalloon_initialize(_text, string_length(_text) * TEXT_BALLOON_SPEED, other, _name);
	}
	
	return _balloon;
}
/* 
Most likely deprecated, probably remove later.
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
*/


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