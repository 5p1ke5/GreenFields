/// @desc Sets the assigned inventory slot as menuPause's selected item.
var _item = item;
with (menuPause)
{
	selected = _item;
	show_debug_message(string(selected))
}