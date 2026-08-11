
var _clickFunction = function()
{
	global.playerInventory = [];
	global.playerEquip = [ new ITEM_NONE, new ITEM_NONE, new ITEM_NONE];
	room_goto(ROOM_TEST);
}

uibutton_initialize("Tutorial", _clickFunction);