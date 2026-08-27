/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.money = 500;
	
	global.clockSteps = 360 * SECOND;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;
	
	
	//These may be moved to a file but for now reading from memory is fine.
	global.bgm = noone;
	global.spawnX = undefined;
	global.spawnY = undefined;
	global.spawnHsp = undefined;
	global.spawnVsp = undefined;
	
	global.socketOther = noone;
	global.socketSelf = noone;
	
	global.roomPausedFrom = noone;
	
	global.messageLog = [];
	
	global.missions = []
	
	
	//Test missions, delete later
	var _createFunction = function()
	{
		show_debug_message("Create Event");
	}
	
	var _stepFunction = function()
	{
		show_debug_message("Foo");
		
		var _player = instance_find(obj_player, 0);
		if (_player)
		{
			if (_player.y < 1800)
			{
				return true;
			}
		}
	}
	
	var _completeFunction = function()
	{
		show_debug_message("Complete");
	}
	
	
	
	var _createFunctionBountyHunter = function()
	{
		var _hunter = instance_create_layer(4952, 2112, "NPCs", obj_npcBountyHunter);		
	}
	
	var _stepFunctionBountyHunter = function()
	{
		return !instance_exists(obj_npcBountyHunter);
	}
	
	var _completeFunctionBountyHunter = function()
	{
		show_debug_message("Bounty hunter defeated!");
	}
	
	
	
	
	

	
	var _mission1 = new Mission("Test Mision", "Basic test mission", [room_downtown], _createFunction, _stepFunction, _completeFunction);
	var _mission2 = new Mission("Test Mision", "Basic test mission", [room_suburbs], _createFunction, _stepFunction, _completeFunction); 
	var _mission3 = new Mission("Bounty Hunter", "A bouny hunter has been dispatched in the badlands to kill you.", [room_badlands], _createFunctionBountyHunter, _stepFunctionBountyHunter, _completeFunctionBountyHunter); 
	//var _mission2 = new Mission("The Hunter", "A mutant super soldier is stalking you! Kill him before he kills you!", [room_downtown, room_suburbs], , , , );
	
	array_push(global.missions, _mission1);
	array_push(global.missions, _mission2);
	array_push(global.missions, _mission3);
	
	
	//global.playerDoll = doll_struct(0, 0, 0,0, 0, c_white1, c_darkBrunette, c_red, c_aqua, c_red);
	var _faceIndex = irandom(sprite_get_number(spr_dollFace));
	var _hairIndex = irandom(sprite_get_number(spr_dollHair));
	var _shirtIndex = irandom(sprite_get_number(spr_dollShirt));
	var _pantsIndex = irandom(1);
	var _shoeIndex = irandom(1);
	
	var _skinColor = choose(c_asian1, c_white1, c_black1, c_hispanic1);
	var _hairColor = choose(c_blonde, c_brunette, c_darkBrunette, c_red);
	var _shirtColor = choose(c_red, c_blue, c_green, c_purple, c_orange, c_yellow);
	var _pantsColor = choose(c_blue, c_gray, c_green, c_navy);
	var _shoeColor = choose(c_brunette, c_green, c_red, c_black);
	
	var _appearance = [_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor];
	global.playerDoll = doll_struct(_appearance);
	//global.playerInventory = [new ITEM_PISTOL, new ITEM_SHOTGUN, new ITEM_ASSAULTRIFLE] new ITEM_MACHINEGUN, new ITEM_BAZOOKA, new ITEM_RAYGUN, new ITEM_GRENADEGUN ];
	global.playerInventory = [];
	
	//global.playerEquip = [global.playerInventory[0], global.playerInventory[1], global.playerInventory[2]];
	global.playerEquip = [new ITEM_NONE, new ITEM_NONE, new ITEM_NONE];
	show_debug_message("Globals initialized.");
}