/// @function shop_item_initialize(_item, _price)
/// @desc Initializes variables for an item that the player can purchase at a shop.
/// @param _item The item that will be added to the player's inventory when purchased.
/// @param _price How much money is needed to purchase the item
function shop_item_initialize(_item, _price)
{
	item = _item;
	price = _price;
	
	sprite_index = _item.icon;
}