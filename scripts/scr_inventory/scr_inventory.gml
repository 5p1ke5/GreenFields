///Inventory functions. inventory_* functions and Item* constructors.
///Structs for item types

/// @function Item(_itemName,  _inventory, _icon, _amount, _description, _ai) constructor
/// @description Constructor for an item struct.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory array the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount quantity of item in stack.
/// @param _description <String> string description of item.
/// @param _ai enum that tells an NPC how to behave when they have the item.
function Item(_itemName,  _inventory, _icon, _amount, _description, _ai) constructor
{
		itemName = _itemName;
		icon = _icon;
		inventory = _inventory;
		amount = _amount;
		description = _description;
		ai = _ai;
		
		/// @description Uses the item. Called when owner tries to use an item in the inventory.
		static Use = function(_user)
		{
			show_debug_message("Item used!" + string(self) + "by " + string(_user));
		}
		
		/// @description Alternate use for the item. Usually called by right clicking.
		static AltUse = function(_user)
		{
			show_debug_message("Item alt used!" + string(self) + "by " + string(_user));
		}
		
		/// @description Script that gets called when an item is equipped. Can be used to spawn equipped items.
		static Equip = function(_user)
		{
			//If left blank just destroys the current held item and unbinds it from the user's myHeld.
			//TODO: maybe make this a function? Could put it in equip_initialize, maybe, but if equip_initialize isn't called the player still keeps the equipped instance..
			with (_user)
			{
				if (myHeld)
				{
					instance_destroy(myHeld);	
				}
				
				myHeld = noone;	
			}
		}
		
		static GetAmount = function()
		{
			return amount;
		}
		static GetName = function()
		{
			return itemName;
		}
		static GetInventory = function()
		{
			return inventory;
		}
		static GetAI = function()
		{
			return ai;
		}
		
		static GetIcon = function()
		{
			return icon;
		}
		
		static GetId = function()
		{
			return GetName() + string(icon);
		}
		
		static SetAmount = function(_amount)
		{
			amount = _amount;
		}
		
		static SetName = function(_name)
		{
			name = _name;
		}
		
		static SetInventory = function(_inventory)
		{
			inventory = _inventory;
		}
}

/// @function ItemEquip(_itemName, _inventory, _icon, _amount, _description, _ai, _equipObj)
/// @description Constructor for an item struct that creates an equipped item.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory list the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _descrtiption A description of the item.
/// @param _ai enum that tells an NPC how to behave when they have the item.
/// @param _equipObj Object to spawn an instance equipped to the player.
function ItemEquip(_itemName, _inventory, _icon, _amount, _description, _ai, _equipObj) : Item(_itemName,  _inventory, _icon, _amount, _description, _ai)  constructor
{	
	equipObj = _equipObj;
	static Use  = function(_user)
	{

	}
	
		
	/// @description Script that gets called when an item is equipped. Can be used to spawn equipped items.
	static Equip = function(_user)
	{
		
		var _equip = instance_create_depth(_user.x, _user.y, _user.depth, equipObj);
		with (_equip)
		{
			equip_initialize(_user);
		}
		
		with (_user)
		{
			if (myHeld)
			{
				instance_destroy(myHeld);	
			}
			
			myHeld = _equip;
		}
	}
}


/// @function ItemFirearm(_itemName, _inventory, _icon, _amount, _description, _ai, _equipObj)
/// @description Constructor for an item struct that creates a firearm object using passed parameters and binds it to myHeld.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory list the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _ai enum that tells an NPC how to behave when they have the item.
/// @param _equipObj Object to spawn an instance equipped to the player.
function ItemFirearm(_itemName, _inventory, _icon, _amount, _description, _ai, _equipObj) : Item(_itemName,  _inventory, _icon, _amount, _description, _ai)  constructor
{	
	equipObj = _equipObj;
	static Use  = function(_user)
	{

	}
	
		
	/// @description Script that gets called when an item is equipped. Can be used to spawn equipped items.
	static Equip = function(_user)
	{
		var _firearm = instance_create_depth(_user.x, _user.y, _user.depth, equipObj);
		
		with (_firearm)
		{
			owner = _user;
		}
	}
}


///@function inventory_initialize()
///@description Initializes the inventory. Returns an array for an inventory. This should usually be set to a variable (eg inventory = inventory_initialize();
function inventory_initialize()
{
	return array_create(1, noone);
}



///@function inventory_equip_initialize()
///@description Initializes gear, which are the equipped items
function inventory_equip_initialize()
{
	return array_create(1, noone);
}


/// @function inventory_find(_inventory, _Item)
/// @description returns the first index of the given item in the given inventory. If none is found, returns -1.
/// @param _inventory inventory list data structure.
/// @param _Item Item struct to search for.
function inventory_find(_inventory, _Item)
{
	return array_get_index(_inventory, _Item)
}

///@function inventory_add(_inventory, _Item)
///@description Adds an item to the inventory. Returns index 
///@param _inventory inventory list to add to.
///@param _Item Item struct to add.
function inventory_add(_inventory, _Item)
{
	//Tries to check if the player already has a copy of the item in their inventory.
	var _index = inventory_find(_inventory, _Item);
	
	//If an item with the same name was not found, just updates inventory and adds it to the list.
	if (_index == -1)
	{
		with (_Item)
		{
			inventory = _inventory;
		}
		array_push(_inventory, _Item);	
	}
	//Otherwise, gets the found Item and adds 1 to amount.
	else
	{
		var _foundItem = array_get(_inventory, _index);
		
		with (_foundItem)
		{
			amount = amount + _Item.GetAmount();
		}
	}
}

///@function inventory_remove(_inventory, _Item)
///@description Removes a stack of an item from the inventory. If amount is 0 from this deletes it from the inventory. 
///@param _inventory inventory list to remove from.
///@param _Item Item struct to remove from.
///@param _user (optional) The instance id of the instance the inventory is associated with. Used to alter inventoryIndex if applicable.
function inventory_remove(_inventory, _Item, _user = noone)
{
	_Item.SetAmount(_Item.GetAmount() - 1);
	
	show_debug_message("New amount: " + string(_Item.GetAmount()));
	
	if (_Item.GetAmount() <= 0)
	{
			var _index = ds_list_find_index(_inventory, _Item);
			ds_list_delete(_inventory, _index);
			show_debug_message("item removed");
	}
	
	//If a reference to a user instance was passed, attempts to set the inventoryIndex for them.
	//Maybe make inventories a struct??
	if (instance_exists(_user))
	{
		with (_user)
		{
			//Makes sure it has an inventoryIndex variable and if so caps it at ds_list_size - 1, but not below 0.
 			if (variable_instance_exists(_user, "inventoryIndex"))
			{
				show_debug_message("index resiezed" + string(ds_list_size(_inventory) ));
				inventoryIndex = min(ds_list_size(_inventory) - 1, inventoryIndex);
				inventoryIndex = max(inventoryIndex, 0);
			}
			
		}
	}
}

/// @function inventory_meleeInstance_initialize(_name, _owner, _sprite, _damage, _knockback, _arc, _spd, _angle)
/// @description Initializes variables for a melee object instance.
/// @param _name Name of item this instance was spawned from.
/// @param _owner Instance taht creaeted the obj_melee instance.
/// @param _sprite Sprite for the object. Also serves as its collision mask.
/// @param _arc Arc for the object to rotate along.
/// @param _spd Speed at which to rotate along he arc.
/// @param _angle angle for the instance to start  at.
function inventory_meleeInstance_initialize(_name, _owner, _sprite, _damage, _knockback, _arc, _spd, _angle)
{
	name = _name;
	owner = _owner;
	hurtbox_initialize(_damage, _knockback, owner);
	
	sprite_index = _sprite;
	mask_index = _sprite;
	
	damage = _damage;
	
	arc = _arc;
	spd = _spd;
	
	angle = _angle - (arc/2);
	startingOrientation = _angle;
	
	image_angle = _angle;
	
	dir = 1;
	
	//checks if attack is being parried as it's created.
	parryCheck();
}
