
var _clickFunction = function()
{
	global.playerInventory = [];
	global.playerEquip = [ new ITEM_NONE, new ITEM_NONE, new ITEM_NONE];
	
	
	global.clockSteps = 1320 * SECOND;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;
	room_goto(ROOM_TUTORIAL);
}

uibutton_initialize("Tutorial", _clickFunction);