/// @desc Creates a button for each object in the player's inventory.
var _inventory = global.playerInventory;
for (var _i = 0; _i < array_length(_inventory); _i++) 
{
    var _element = _inventory[_i];
	
	var _button = instance_create_layer(room_width/2, (room_height/4) + (_i * 32), layer, obj_buttonWeapon);
	
	with (_button)
	{
		item = _element;
		sprite_index = _element.icon;
	}
}