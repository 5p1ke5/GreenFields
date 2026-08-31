/// @desc Initializes variables, creates a button for each mission.

var _missions = global.missions;

//Creates a button for each mission and initializes variables.
for (var _i = 0; _i < array_length(_missions); _i++) 
{    
	var _button = instance_create_depth(x, 64 + (_i * 16), depth, obj_buttonMission);
	var _menuPause = id;
	
	with (_button)
	{
		mission = _missions[_i];
		title = mission.title;
		description = mission.description;
		menuPause = _menuPause;
	}
}