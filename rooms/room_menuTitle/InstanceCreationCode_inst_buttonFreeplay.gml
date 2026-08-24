
var _clickFunction = function()
{
	global.playerInventory = [new ITEM_PISTOL, new ITEM_BAT];
	global.playerEquip = [global.playerInventory[0], new ITEM_NONE, new ITEM_NONE];
	
	global.clockSteps = 360 * SECOND;
	global.clockMinutes = global.clockSteps/SECOND;
	global.clockHours = global.clockMinutes / 60;
	room_goto(ROOM_SINGLEPLAYER);
}

uibutton_initialize("Free Play", _clickFunction);