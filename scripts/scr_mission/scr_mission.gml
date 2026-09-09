/// @function Mission(_title, _description, _activeRooms, _createFunction = noone, _stepFunction = noone, _completeFunction = noone) 
/// @description A mission to be completed.
/// @param _title The mission's title.
/// @param _description The description of the mission's tasks.
/// @param _activeRooms Rooms the mission effect. _createFunction and _stepFunction are only called in these rooms.
/// @param _createFunction This function is run in the create event of the function if in an active room.
/// @param _stepFunction This function is run every step if in an active room and should return true or false. If returns true ends the quest and called _completeFunction.
/// @param _completeFunction this function is called on completion of the quest.
function Mission(_title, _description, _activeRooms, _createFunction = noone, _stepFunction = noone, _completeFunction = noone) constructor 
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
	
	
	static Active = function()
	{
		return array_contains(activeRooms, room);	
	}
}







/*
function mission_complete(_mission, _missionLog)
{
	var _index = array_get_index(_missionLog, _mission)
	array_delete(_missionLog, _index, 1);
}
*/