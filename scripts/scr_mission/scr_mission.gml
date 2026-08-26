// If a mission is active it has a set of rooms it's active in
// if its in a room its active in it calls it's 'active' script on room load
// So like if you have a mission where you have to kill a dude the _active script activates when you go into his room
// (guys like this might need their own object like "obj_npcQuestTarget" maybe and that checks for associated missions when they die)
// COuld maybe also give it a step event that calls a passed script like _stepScript? But thats a lot but maybe not if I keep it simple like (if (instanceCount(target) < 0)

function Mission(_name, _description, _activeRooms, _createFunction = noone, _stepFunction = noone, _completeFunction = noone) constructor 
{
	name = _name;
	description = _description;
	activeRooms = _activeRooms;
	createFunction = _createFunction;
	stepFunction = _stepFunction;
	completeFunction = _completeFunction;
	
	//Array that this mission is part of.
	missionLog = global.missions;
	
	static Create = function()
	{
		if (Active())
		{
			createFunction();
		}
	}
	
	static Step = function()
	{
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


function mission_complete()
{
	Complete();	
}

/*
function mission_complete(_mission, _missionLog)
{
	var _index = array_get_index(_missionLog, _mission)
	array_delete(_missionLog, _index, 1);
}
*/