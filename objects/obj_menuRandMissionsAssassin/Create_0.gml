/// @desc Creates buttons that give missions when clicked
var _missionsNumber = 3;
var _x = room_width()/2;
var _y = room_width()/10;

//Creates buttons, 
for (var _i = 0; _i < _missionsNumber; _i++) 
{
	var _button = instance_create_depth(_x, _y + (_i * (room_width / 4)), depth, obj_buttonMission);
	
	with (_button)
	{
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
			//create target		
		}
				
		var _stepFunction = function()
		{
			//check if target is dead.	
		}
				
		var _completeFunction = function()
		{
			global.money += 500;	
		}
		
		
		mission = new Mission(_title, _desc, _room, _createFunction, _stepFunction, _completeFunction);
	}
}