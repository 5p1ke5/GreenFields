/// @desc Creates a button for each object in the player's inventory.
var _inventory = global.playerInventory;
for (var _i = 0; _i < array_length(_inventory); _i++) 
{
    var _element = _inventory[_i];
	
	var _button = instance_create_layer(room_width/2, (room_height/4) + (_i * 32), layer, obj_uiButton);
	var _function = function(){ show_debug_message("Clicked! {0}", current_time) };
	
	with (_button)
	{
		button_initialize(_element.itemName, _function, c_white);
		sprite_index = _element.icon;
	}
}