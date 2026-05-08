

//old stuff delete later
/*
///@function button_initialize(_text, _description)
///@param _text The text displayed on the button.
///@param [_description] The text disaplayed when the button is hovered over. if "" nothing is displayed.
function button_initialize(_text, _description = "")
{
	text = _text;
	description = _description;
	tooltipOn = false;
}


///@function button_toggle_initialize(_text, _toggle = false, _description = "")
///@description Creates a button that displays if it's on or off.
///@param _text The text displayed on the button.
///@param _toggle If the button starts out toggled off or on.
///@param [_description] The text disaplayed when the button is hovered over. if "" nothing is displayed.
function button_toggle_initialize(_text, _toggle = false, _description = "")
{
	button_initialize(_text, _description);
	toggle = _toggle;
}

///@function button_shop_initialize(_text, _object, _price, _description, _enabled)
///@description Initializes variables for a button that a shop uses.
///@param _text The text displayed on the button.
///@param _object A reference to the Object this button will place in the player's inventory.
///@param _price The item's price.
///@param _description The text disaplayed when the button is hovered over. if "" nothing displayed.
///@param _enabled if the button is enabled or not, defaults to if the inventory contains an _object.
function button_shop_initialize(_text, _object, _price, _description = "", _enabled = !array_contains(global.inventory, _object))
{
	button_initialize(_text, _description);
	object = _object;
	price = _price;
	
	//Checks if the object is already in the player's inventory, and if so disables this object.
	//In special cases (eg food) this can be overwritten after intialization in the create event.
	enabled = _enabled;
	
}
*/