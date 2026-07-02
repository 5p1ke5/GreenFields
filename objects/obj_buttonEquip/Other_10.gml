/// @desc If an item is selected, sets it to the equipment slot. If it's already equipped swaps the items position instead.

if (menuPause.selected)
{
	//If the element does not exist in the array, puts it in.
	var _index = array_get_index(global.playerEquip, menuPause.selected);
	if (_index == -1)
	{
		global.playerEquip[index] = menuPause.selected;
	}
	//Otherwise '_index' is the place the item is already in at Equip, so we switch it with the one at 'index'.
	else
	{
		array_swap(global.playerEquip, _index, index);
	}
	
	menuPause.selected = noone;
}