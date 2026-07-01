/// @desc Initializes variables, creates a button for each object in the player's inventory.

//A reference to the currently selected item.
selected = noone;

var _inventory = global.playerInventory;
for (var _i = 0; _i < array_length(_inventory); _i++) 
{
	var _button = instance_create_layer(room_width/12, (room_height/4) + (_i * 64), layer, obj_buttonWeapon);
    var _element = _inventory[_i];	
	var _menuPause = id;
	
	with (_button)
	{
		menuPause = _menuPause;
		item = _element;
		sprite_index = _element.icon;
		image_yscale = 2;
		image_xscale = 2;
	}
}


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