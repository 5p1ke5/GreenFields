
var _clickFunction = function()
{
	global.playerInventory = [new ITEM_PISTOL, new ITEM_BAT];
	global.playerEquip = [global.playerInventory[0], new ITEM_NONE, new ITEM_NONE];
	
	
	//Test missions, may delete later
	var _createFunction = function()
	{
		
	}
	
	var _stepFunction = function()
	{
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
	}
	
	
	
	var _createFunctionBountyHunter = function()
	{
		instance_create_layer(4952, 2112, "NPCs", obj_npcBountyHunter);		
	}
	
	var _stepFunctionBountyHunter = function()
	{
		return !instance_exists(obj_npcBountyHunter);
	}
	
	var _completeFunctionBountyHunter = function()
	{
		
	}

	
	var _mission1 = new Mission("Test Mision", "test mission, complete by getting higher than 1800 y", [room_downtown], _createFunction, _stepFunction, _completeFunction);
	var _mission2 = new Mission("Bounty Hunter", "A bouny hunter has been dispatched in the badlands to kill you.", [room_badlands], _createFunctionBountyHunter, _stepFunctionBountyHunter, _completeFunctionBountyHunter); 

	
	array_push(global.missions, _mission1);
	array_push(global.missions, _mission2);
	
	
	
	
	global.clockSteps = 360 * SECOND;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;
	room_goto(ROOM_SINGLEPLAYER);
}

uibutton_initialize("Free Play", _clickFunction);