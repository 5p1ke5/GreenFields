/// @desc Sets the assigned inventory slot as menuPause's selected item.
var _item = global.playerInventory[index];
with (menuPause)
{
	selected = _item;
}