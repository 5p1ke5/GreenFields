/// @desc When interacted with checks if player has enough money to purchase the item. If so adds the item to inventory.

if (global.money >= price)
{
	if (array_length(global.playerInventory) < INVENTORY_MAX)
	{
		inventory_add(global.playerInventory, item);
		instance_destroy();
	}
	
	global.money -= price;

	audio_play_sound(sfx_itemGet, 0, false);
	message_create(x, y, depth, item.itemName + " Acquired!");
}
else
{
	if (obj_player)
	{
		with (obj_player)
		{
			npc_speak("I don't have enough money for this.", "Player");	
		}
	}
}