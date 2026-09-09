/// @desc Creates buttons that give missions when clicked
var _missionsNumber = 3;
var _x = room_width / 2;
var _y = room_width / 10;

//Creates buttons, 
for (var _i = 0; _i < _missionsNumber; _i++) 
{
	var _button = instance_create_depth(_x, _y + (_i * (room_width / 4)), depth, obj_buttonUI);
	var _missionType = irandom(1);
		
	switch (_missionType) 
	{    
		case 0:
			var _title = "I Hate My Boss!"
			var _room = choose(room_downtownOffice, room_downtownSkyBuilding);
			var _roomString = _room == room_downtownOffice ? "Call Center" : "Sky Building"; // consider moving to a map or something
			var _desc = "I hate my boss so I want you to kill him! He's in " + _roomString + ".";
	        break;
		case 1:
			var _title = "I Hate My Worker!"
			var _room = choose(room_downtownOffice, room_downtownSkyBuilding);
			var _roomString = _room == room_downtownOffice ? "Call Center" : "Sky Building"; // consider moving to a map or something
			var _desc = "My employee is underperforming so I'm just going to have you kill him. He's in " + _roomString + ".";
		    break;
	}
				
				
	var _createFunction = function()
	{
		var _spawnPoint = instance_find(obj_targetSpawnPoint, irandom(instance_number(obj_targetSpawnPoint)))
		if (!_spawnPoint)
		{
			return;	
		}
		
		var _x = _spawnPoint.x;
		var _y = _spawnPoint.y;
		
		target = instance_create_layer(_x, _y, "NPC", obj_npcMurderTarget);
		
		show_debug_message(title)
	}
				
	var _stepFunction = function()
	{
		//check if target is dead.	
		return !instance_exists(target);
	}
		
		
	var _completeFunction = function()
	{
		global.money += 500;	
	}
	
	with (_button)
	{	
		mission = new Mission(_title, _desc, _room, _createFunction, _stepFunction, _completeFunction);
	
		var _clickFunction = function()
		{
			array_push(global.missions, mission);
			instance_destroy();
		}
	
		
		uibutton_initialize(_title, _clickFunction, , , _desc);	
		
		
		/* Make some function that lets me neatly scale image to a given height/width in pixels eg image_xscale_to(300)
		image_xscale = sprite_width / string_width(_title) * 2
		image_yscale = sprite_height / string_height(_title) * 2
		*/
		
		//For now im just going to do it like this
		image_xscale = 4;
		image_yscale = 1/2;
		x -= sprite_width/2;
	}
}