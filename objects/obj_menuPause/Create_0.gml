/// @desc Initializes variables, creates a button for each object in the player's inventory.

//A reference to the currently selected item.
selected = noone;

var _inventory = global.playerInventory;
for (var _i = 0; _i < array_length(_inventory); _i++) 
{
	var _button = instance_create_layer(room_width/2, (room_height/4) + (_i * 64), layer, obj_buttonWeapon);
    var _element = _inventory[_i];	
	var _menuPause = id;
	
	with (_button)
	{
		/*TODO: Maybe make this a buttonWeapon_initialize script. Maybe have the buttons reference the index in inventory?
		  But maybe having 'item' as a pointer will work too. I will experiment because that would be ideal.
		  i want to make it so deleting an item in inventory will also delete it on the equip panel.
		*/
		menuPause = _menuPause;
		item = _element;
		sprite_index = _element.icon;
		image_yscale = 2;
		image_xscale = 2;
	}
}