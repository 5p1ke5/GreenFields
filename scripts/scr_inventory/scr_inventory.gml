///Inventory functions. inventory_* functions and Item* constructors.
///Structs for item types

/// @function Item(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "")
/// @description Constructor for an item struct.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory array the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount quantity of item in stack.
/// @param _description <String> string description of item.
/// @param _ai enum that tells an NPC how to behave when they have the item.
function Item(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "") constructor
{
		itemName = _itemName;
		inventory = _inventory;
		icon = _icon;
		amount = _amount;
		description = _description;
		

		//These functions correspond to mouse buttons
		static RightButton = function(_user)
		{
			show_debug_message("Right button!");
		}

		static LeftButton = function(_user)
		{
			show_debug_message("Left button!");
		}
		
		static RightButtonPressed = function(_user)
		{
			show_debug_message("Right button pressed!");
		}

		static LeftButtonPressed = function(_user)
		{
			show_debug_message("Left button pressed!");
		}

		static RightButtonReleased = function(_user)
		{
			show_debug_message("Right button released!");
		}

		static LeftButtonReleased = function(_user)
		{
			show_debug_message("Left button released!");
		}

		
		/// @description Script that gets called when an item is equipped.
		static Equip = function(_user)
		{
			var _self = self;
			
			with (_user)
			{
				myHeld = _self;	
			}
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
function ItemEquip(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index) : Item(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "")  constructor
{	
	sprite_index = _sprite_index;
	image_index = 0;
	
	// This should be called in the step event while the item is equipped
	static Step = function()
	{
		
	}
}


/// @function ItemEquipFirearm(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldown = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone)
/// @description Constructor for an item struct that is used to fire the player's gun.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory list the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _description Description of the name in the inventory.
/// @param _sprite_index Sprite for the struct.
/// @param _cooldownMax How many frames to wait between shots.
/// @param _bullet Bullet object to fire.
/// @param _damage How much damage the bullet object does. Defaults to noone. If value is noone doesn't set the damage for the bullet object.
function ItemEquipFirearm(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone, _twoHanded = false) : ItemEquip(_itemName,  _inventory, _icon, _amount, _description, _sprite_index) constructor
{	
	damage = _damage;
	cooldownMax = _cooldownMax;
	cooldown = -1;
	bullet = _bullet;
	twoHanded = _twoHanded;
	
	// Increments coodlwon
	static Step = function()
	{
		if (cooldown >= 0)
		{
			cooldown--;	
		}
	}
	
	static Fire = function(_user)
	{
		if (cooldown > 0)
		{
			exit;	
		}

		var _depth = _user.depth;
		var _angle = _user.handAngle;
		var _x = _user.x;
		var _y = _user.y - 3;
		var _xOffset = lengthdir_x(16, _angle);
		var _yOffset = lengthdir_y(16, _angle);
		var _bullet = instance_create_depth(_x + _xOffset, _y + _yOffset, _depth + 1, bullet);

		var _speed = 16;
		var _damage = damage;
		var _owner = _user;
		with (_bullet)
		{
			hsp = lengthdir_x(_speed, _angle);
			vsp = lengthdir_y(_speed, _angle);
			image_angle = _angle;
			angle = _angle;
	
			//If damage was set initializes a hurtbox.
			if (_damage != noone)
			{
				hurtbox_initialize(_damage, _owner);
			}
		}

		//Resets timer
		cooldown = cooldownMax;

		//Play sound effect
		audio_play_sound(sfx_fire, 0, false);
	}
	
	static LeftButtonPressed = function(_user)
	{
		Fire(_user);
	}
}

//huh this doesn't quite work how i hoped...


/// @function ItemEquipFirearmAuto(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone)
/// @description Constructor for an item struct that is used to fire the player's gun. This one fires automatically.
/// @param _itemName <String> item's name.
/// @param _inventory Inventory list the item is inside of.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _description Description of the name in the inventory.
/// @param _sprite_index Sprite for the struct.
/// @param _cooldownMax How many frames to wait between shots.
/// @param _bullet Bullet object to fire.
/// @param _damage How much damage the bullet object does. Defaults to noone. If value is noone doesn't set the damage for the bullet object.
function ItemEquipFirearmAuto(_itemName,  _inventory, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone, _twoHanded = false) : ItemEquipFirearm(_itemName,  _inventory, _icon, _amount, _description, _sprite_index, _cooldownMax, _bullet, _damage, _twoHanded) constructor
{
	//Overrides parent, instead just uses LeftButton to fire.
	static LeftButtonPressed = function(_user)
	{
		
	}
	
	static LeftButton = function(_user)
	{
		Fire(_user);
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
