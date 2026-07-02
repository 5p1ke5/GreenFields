/// @desc If collides with a player, adds the item in 'item' to the player's inventory and then destroys self.

//later check if inventory is full, like...
if (array_length(global.playerInventory) < INVENTORY_MAX)
{
	inventory_add(global.playerInventory, item);
	instance_destroy();
}
