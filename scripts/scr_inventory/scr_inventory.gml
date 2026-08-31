///Inventory functions. inventory_* functions and Item* constructors.
///Structs for item types

/// @function Item(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "")
/// @description Constructor for an item struct.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount quantity of item in stack.
/// @param _description <String> string description of item.
/// @param _ai enum that tells an NPC how to behave when they have the item.
function Item(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "") constructor
{
		itemName = _itemName;
		icon = _icon;
		amount = _amount;
		description = _description;
		

		//These functions correspond to mouse buttons
		static RightButton = function(_user)
		{
			
		}

		static LeftButton = function(_user)
		{
			
		}
		
		static RightButtonPressed = function(_user)
		{
			
		}

		static LeftButtonPressed = function(_user)
		{
			
		}

		static RightButtonReleased = function(_user)
		{
			
		}

		static LeftButtonReleased = function(_user)
		{
			
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

/// @function ItemEquip(_itemName, _icon, _amount, _description, _ai, _equipObj)
/// @description Constructor for an item struct that creates an equipped item.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param description A description of the item.
/// @param _sprite_index Sprite for the struct.
function ItemEquip(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index) : Item(_itemName, _icon, _amount, _description = "")  constructor
{	
	sprite_index = _sprite_index;
	image_index = 0;
	
	// This should be called in the step event while the item is equipped
	static Step = function()
	{
		
	}
}


/// @function ItemEquipMelee(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index)
/// @description Will have melee weapons in here for later. For now is just a placeholder.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param description A description of the item.
/// @param _sprite_index Sprite for the struct.
function ItemEquipMelee(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _damage = noone, _arcLength = 90, _swingSpeed = 1): ItemEquip(_itemName, _icon, _amount, _description = "", _sprite_index)  constructor
{
	hurtbox = noone; //This will contain the generated hurtbox for the item.
	damage = _damage;
	arcLength = _arcLength;
	arc = 0;
	swingSpeed = _swingSpeed;
	swingDir = 1;
	
	static Step = function()
	{
		//If a hurtbox exists, increments its arc. 
		if (hurtbox)
		{
			//Once the arc is complete deletes the hitbox and sets the variable to noone and resets arc.
			if (abs(arc) < abs(arcLength))
			{
				arc += (swingSpeed * swingDir);		
			}
			else
			{
				instance_destroy(hurtbox);
				hurtbox = noone;
				arc = 0;
			}
			
			//Change the hurtbox's angle with the arc increment. 
			var _arc = arc;
			with (hurtbox)
			{
				angle = startAngle + _arc;
			}
		}
	}
	
	static Fire = function(_user)
	{
		
		//Creates hurtbox at user x, y, depth and sets reference.
		var _x = _user.x;
		var _y = _user.y;
		var _depth = _user.depth;
		hurtbox = instance_create_depth(_x, _y, _depth, obj_meleeHurtbox);
		
		swingDir = -_user.facing;
		
		var _swingDir = swingDir;
		var _damage = damage;
		var _handAngle = _user.handAngle;
		var _arcLength = arcLength;
		with (hurtbox)
		{
			damage = _damage;
			startAngle = (_handAngle - (_arcLength/(2 * _swingDir)));
			
			angle = startAngle;
			owner = _user;
		}
	}
	
	static LeftButtonPressed = function(_user)
	{
		Fire(_user);
	}
}



/* This one makes the melee weapon swing downwards but only works when facing left
/// @function ItemEquipMelee(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index)
/// @description Will have melee weapons in here for later. For now is just a placeholder.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param description A description of the item.
/// @param _sprite_index Sprite for the struct.
function ItemEquipMelee(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _damage = noone, _arcLength = 90, _swingSpeed = 1): ItemEquip(_itemName, _icon, _amount, _description = "", _sprite_index)  constructor
{
	hurtbox = noone; //This will contain the generated hurtbox for the item.
	damage = _damage;
	arcLength = _arcLength;
	arc = 0;
	swingSpeed = _swingSpeed;
	swingDir = 1;
	
	static Step = function()
	{
		//If a hurtbox exists, increments its arc. 
		if (hurtbox)
		{
			//Once the arc is complete deletes the hitbox and sets the variable to noone and resets arc.
			if (abs(arc) < abs(arcLength))
			{
				arc += (swingSpeed * swingDir);		
			}
			else
			{
				instance_destroy(hurtbox);
				hurtbox = noone;
				arc = 0;
			}
			
			//Change the hurtbox's angle with the arc increment. 
			var _arc = arc;
			with (hurtbox)
			{
				angle = startAngle + _arc;
			}
		}
	}
	
	static Fire = function(_user)
	{
		
		//Creates hurtbox at user x, y, depth and sets reference.
		var _x = _user.x;
		var _y = _user.y;
		var _depth = _user.depth;
		hurtbox = instance_create_depth(_x, _y, _depth, obj_meleeHurtbox);
		
		//Sets variables for that hurtbox.
		swingDir = -_user.facing;
		var _swingDir = swingDir;
		var _damage = damage;
		var _handAngle = _user.handAngle;
		var _arcLength = arcLength;
		with (hurtbox)
		{
			damage = _damage;
			startAngle = _swingDir * (_handAngle - (_arcLength/2));
			//startAngle = (sign(_swingDir + 1) * 360) + (_handAngle - (_arcLength/2));
			//startAngle = (_handAngle - (_arcLength/2));
			
			angle = startAngle;
			owner = _user;
		}
	}
	
	static LeftButtonPressed = function(_user)
	{
		Fire(_user);
	}
}
*/

/// @function ItemEquipFirearm(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldown = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone)
/// @description Constructor for an item struct that is used to fire the player's gun.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _description Description of the name in the inventory.
/// @param _sprite_index Sprite for the struct.
/// @param _cooldownMax How many frames to wait between shots.
/// @param _bullet Bullet object to fire.
/// @param _damage How much damage the bullet object does. Defaults to noone. If value is noone doesn't set the damage for the bullet object.
function ItemEquipFirearm(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone, _twoHanded = false) : ItemEquip(_itemName, _icon, _amount, _description, _sprite_index) constructor
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
		
		//Check if the gun has ammo
		if (amount <= 0)
		{
			//exit;	
		}
		else
		{
			amount--;	
		}
		

		var _depth = _user.depth;
		var _angle = _user.handAngle;
		var _x = _user.x;
		var _y = _user.y - 3;
		var _xOffset = lengthdir_x(16, _angle);
		var _yOffset = lengthdir_y(16, _angle);
		var _bullet = instance_create_depth(_x + _xOffset, _y + _yOffset, _depth + 1, bullet);

		var _speed = 1;
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
			else
			{
				owner = _owner;
			}
		}

		//Resets timer
		cooldown = cooldownMax;
	}	
	
	static LeftButtonPressed = function(_user)
	{
		Fire(_user);
	}
}

//huh this doesn't quite work how i hoped...


/// @function ItemEquipFirearmAuto(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone)
/// @description Constructor for an item struct that is used to fire the player's gun. This one fires automatically.
/// @param _itemName <String> item's name.
/// @param _icon <sprite> Sprite representation of item.
/// @param _amount  quantity of item in stack.
/// @param _description Description of the name in the inventory.
/// @param _sprite_index Sprite for the struct.
/// @param _cooldownMax How many frames to wait between shots.
/// @param _bullet Bullet object to fire.
/// @param _damage How much damage the bullet object does. Defaults to noone. If value is noone doesn't set the damage for the bullet object.
function ItemEquipFirearmAuto(_itemName, _icon = spr_iconBlank, _amount = 1, _description = "", _sprite_index = spr_equipEmpty, _cooldownMax = game_get_speed(gamespeed_fps) / 4, _bullet = obj_bullet, _damage = noone, _twoHanded = false) : ItemEquipFirearm(_itemName, _icon, _amount, _description, _sprite_index, _cooldownMax, _bullet, _damage, _twoHanded) constructor
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


/// @function itemPickup_initialize(_item)
/// @description Initializes an itemPickup object from the passed item.
function itemPickup_initialize(_item)
{
	item = _item;
	sprite_index = _item.icon;
}


///@function inventory_add(_inventory, _Item)
///@description Adds an item to the inventory. Returns index 
///@param _inventory inventory list to add to.
///@param _Item Item struct to add.
function inventory_add(_inventory, _Item)
{
	var _index = -1;
	
	for (var _i = 0; _i < array_length(_inventory); _i++) 
	{
	    if (_inventory[_i].itemName == _Item.itemName)
		{
			_index = _i;
			break;
		}
	}
	
	//If an item with the same name was not found, just updates inventory and adds it to the list.
	if (_index == -1)
	{
		array_push(_inventory, _Item);	
	}
	
	else
	{
		var _foundItem = array_get(_inventory, _index);
		
		with (_foundItem)
		{
			amount = amount + _Item.amount;
		}
	}
}
