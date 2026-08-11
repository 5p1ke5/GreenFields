
var _clickFunction = function()
{
	global.playerInventory = [new ITEM_PISTOL];
	global.playerEquip = [global.playerInventory[0], new ITEM_NONE, new ITEM_NONE];
	room_goto(ROOM_SINGLEPLAYER);
}

uibutton_initialize("Free Play", _clickFunction);