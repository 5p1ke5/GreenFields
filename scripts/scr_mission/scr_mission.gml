/// @function Mission(_title, _description, _activeRooms, _reward)
/// @description Abstract class for a mission to be completed.
/// @param _title The mission's title.
/// @param _description The description of the mission's tasks.
/// @param _activeRooms Rooms in which the mission is active.
/// @param _reward The amount of money awared by the mission.
function Mission(_title, _description, _activeRooms, _reward) constructor
{
	title = _title;
	description = _description;
	
	//If it's not an array makes it an array.
	if (!is_array(_activeRooms))
	{
		_activeRooms = [_activeRooms];	
	}
	activeRooms = _activeRooms;
	reward = _reward;
	
	static Create = function()
	{
		if (!Active())
		{
			return;	
		}
		
	}
	
	
	static Step = function()
	{
		if (!Active())
		{
			return;	
		}
		
	}
	
	
	static Complete = function()
	{
		var _index = array_get_index(global.missions, self)
		array_delete(global.missions, _index, 1);
		global.money += reward;
		
		var _fanfare = instance_create_layer(0, 0, "Player", obj_fanfare);
		var _text = "Mission Complete!\n+" + string(reward) + " Money!"
		
		with (_fanfare)
		{
			fanfare_initialize(_text);
		}
		
		audio_play_sound(sfx_missionComplete, 0, false);
	}
	
	
	static Active = function()
	{
		return array_contains(activeRooms, room);	
	}
}



/// @function MissionEliminate(_title, _description, _activeRooms, _reward, _objects)
/// @description A mission where you must eliminate target(s)
/// @param _title The mission's title.
/// @param _description The description of the mission's tasks.
/// @param _activeRooms Rooms in which the mission is active.
/// @param _reward The amount of money awared by the mission.
/// @param _objects an Object or array of objects to be created as targets at the spawn points.
function MissionEliminate(_title, _description, _activeRooms, _reward, _objects) :  Mission(_title, _description, _activeRooms, _reward) constructor
{
	if (!is_array(_objects))
	{
		_objects = [_objects];	
	}
	
	objects = _objects;
	targets = []; //This will be filled with specific instance references.
	
	//Creates the objects in the objects[] array at a random spawn.
	static Create = function()
	{
		if (!Active())
		{
			return;	
		}
		
		var _spawnPoint = instance_find(obj_targetSpawnPoint, irandom(instance_number(obj_targetSpawnPoint) - 1))
		if (!_spawnPoint)
		{
			return;	
		}
		
		var _x = _spawnPoint.x;
		var _y = _spawnPoint.y;
		
		
		for (var _i = 0; _i < array_length(objects); _i++) 
		{    
			var _target = instance_create_layer(_x, _y, "NPC", objects[_i]);
			array_push(targets, _target);
		}
		
		show_debug_message("Targets array on create: {0}", targets);
	}
	
	
	static Step = function()
	{
		if (!Active())
		{
			return;	
		}
		
		var _allDead = true;
		for (var _i = 0; _i < array_length(targets); _i++) 
		{    
			if (instance_exists(targets[_i]))
			{
				_allDead = false;
			}
		}
		
		if (_allDead)
		{
			Complete();	
		}
	}
	
}


/// @function MissionExt(_title, _description, _activeRooms, _createFunction = noone, _stepFunction = noone, _completeFunction = noone) 
/// @description A mission to be completed.
/// @param _title The mission's title.
/// @param _description The description of the mission's tasks.
/// @param _activeRooms Rooms the mission effects. _createFunction and _stepFunction are only called in these rooms.
/// @param _createFunction This function is run in the create event of the function if in an active room.
/// @param _stepFunction This function is run every step if in an active room and should return true or false. If returns true ends the quest and called _completeFunction.
/// @param _completeFunction this function is called on completion of the quest.
function MissionExt(_title, _description, _activeRooms, _createFunction = noone, _stepFunction = noone, _completeFunction = noone) : Mission(_title, _description, _activeRooms) constructor 
{
	title = _title;
	description = _description;
	
	//If active rooms isn't an array turns it into a single element array.
	if !(is_array(_activeRooms))
	{
		_activeRooms = [_activeRooms]
	}
	
	activeRooms = _activeRooms;
	createFunction = _createFunction;
	stepFunction = _stepFunction;
	completeFunction = _completeFunction;
	
	//Array that this mission is part of.
	missionLog = global.missions;
	
	static Create = function()
	{
		if (!createFunction)
		{
			return;
		}
		
		if (Active())
		{
			createFunction();
		}
	}
	
	
	static Step = function()
	{
		if (!stepFunction)
		{
			return;
		}
		
		if (Active())
		{
			if (stepFunction() == true)
			{
				Complete();	
			}
		}
	}
	
	
	static Complete = function()
	{
		// Calls complete function and then removes self from missions array
		if (completeFunction)
		{
			completeFunction();
		}
		
		var _index = array_get_index(missionLog, self)
		array_delete(missionLog, _index, 1);
	}
}







/*
function mission_complete(_mission, _missionLog)
{
	var _index = array_get_index(_missionLog, _mission)
	array_delete(_missionLog, _index, 1);
}
*/