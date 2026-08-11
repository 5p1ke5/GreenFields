
var _clickFunction = function()
{
	global.playerInventory = [new ITEM_PISTOL, new ITEM_SHOTGUN, new ITEM_ASSAULTRIFLE, new ITEM_MACHINEGUN, new ITEM_BAZOOKA, new ITEM_RAYGUN, new ITEM_GRENADEGUN ];
	global.playerEquip = [global.playerInventory[0], global.playerInventory[1], global.playerInventory[2]];
	room_goto(ROOM_ARCADE);
}

uibutton_initialize("Arcade Mode", _clickFunction);