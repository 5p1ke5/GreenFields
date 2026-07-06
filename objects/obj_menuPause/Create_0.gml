/// @desc Initializes variables, creates a button for each object in the player's inventory.

//A reference to the currently selected item.
selected = noone;

//Makes a button for each item in the player inventory.
var _inventory = global.playerInventory;
for (var _i = 0; _i < array_length(_inventory); _i++) 
{
	var _button = instance_create_layer(room_width/12 + ((_i div 5) * 96), (room_height/4) + ((_i % 5) * 64), layer, obj_buttonItem);
    var _element = _inventory[_i];	
	var _menuPause = id;
	
	with (_button)
	{
		index = _i
		menuPause = _menuPause;
		sprite_index = _element.icon;
		image_yscale = 2;
		image_xscale = 2;
	}
}

//Make blank buttons for the rest....Later.
/*
for (; _i < INVENTORY_MAX; _i++) 
{
	show_debug_message("{0}", _i);
}
*/


var _equip = global.playerEquip;
for (var _i = 0; _i < array_length(_equip); _i++) 
{
	var _button = instance_create_layer(room_width * 3/4, (room_height/4) + (_i * 64), layer, obj_buttonEquip);
	var _element = _equip[_i];	
	var _menuPause = id;
	
	with (_button)
	{
		index = _i;
		menuPause = _menuPause;
		image_yscale = 2;
		image_xscale = 2;
	}
}