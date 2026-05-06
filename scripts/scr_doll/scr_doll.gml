///@function doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
///@description Initializes variables for a draw. 
///@param _faceIndex Subimage in the faces sprite to set face.
///@param _hairIndex Subimage in the hair sprite to set hair.
///@param _shirtIndex Subimage in the shirt sprite to set shirt.
///@param _pantsIndex Which pants sprite to use.
///@param _shoeIndex Subimage in the shoes sprite to set shoes to.
///@param _skinColor Color for the doll's body.
///@param _hairColor Color to make the doll's hair.
///@param _shirtColor Color to make the doll's shirt.
///@param _pantsColor Color to make the doll's pants.
///@param _shoeColor Color to make the doll's shoes.
function doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
{
	faceIndex = _faceIndex;
	hairIndex = _hairIndex;
	shirtIndex = _shirtIndex;
	pantsIndex = _pantsIndex;
	shoeIndex = _shoeIndex;
	skinColor = _skinColor;
	hairColor = _hairColor;
	shirtColor = _shirtColor;
	pantsColor = _pantsColor;
	shoeColor = _shoeColor;
	
	sprite_index = spr_doll;
	pantsSprites = 
	[ //I'll think of a better way to do this later
		asset_get_index("spr_dollPants" + string(pantsIndex)), 
		asset_get_index("spr_dollPants" + string(pantsIndex) + "Jump"), 
		asset_get_index("spr_dollPants" + string(pantsIndex) + "Run")
	];
	pantsSprite = pantsSprites[0]
	
	shoeSprites = 
	[ //I'll think of a better way to do this later
		asset_get_index("spr_dollShoes" + string(shoeIndex)), 
		asset_get_index("spr_dollShoes" + string(shoeIndex) + "Jump"), 
		asset_get_index("spr_dollShoes" + string(shoeIndex) + "Run")
	];
	shoeSprite = shoeSprites[0]
	
	shirtSprite = spr_dollShirt;
	faceSprite = spr_dollFace;
	hairSprite = spr_dollHair;
	armSpriteA = spr_armA;
	armSpriteB = spr_armB;
}

///@function doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor)
///@description Creates a struct form of the doll component and returns it.
///@param _faceIndex Subimage in the faces sprite to set face.
///@param _hairIndex Subimage in the hair sprite to set hair.
///@param _shirtIndex Subimage in the shirt sprite to set shirt.
///@param _pantsIndex Which pants sprite to use.
///@param _shoeIndex Subimage in the shoes sprite to set shoes to.
///@param _skinColor Color for the doll's body.
///@param _hairColor Color to make the doll's hair.
///@param _shirtColor Color to make the doll's shirt.
///@param _pantsColor Color to make the doll's pants.
///@param _shoeColor Color to make the doll's shoes.
function doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor) 
{
	var _struct = {};
	
	with (_struct)
	{
		doll_initialize(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor);
	}
	
	return _struct;
}


///@function doll_animate()
///@description Sets which sprites are used in the draw event depending on what the doll is doing.
function doll_animate()
{
	image_xscale = facing;

	if (grounded)
	{
		if (hDir == 0)
		{
			sprite_index = spr_doll;	
			pantsSprite =  pantsSprites[0];
			shoeSprite = shoeSprites[0];
		}
		else
		{
			sprite_index = spr_dollRun;	
			pantsSprite = pantsSprites[2];
			shoeSprite = shoeSprites[2];
		}
	}
	else
	{
		sprite_index = spr_dollJump;		
		pantsSprite = pantsSprites[1];
		shoeSprite = shoeSprites[1];
	}
	
	armSpriteA = spr_armA;
	armSpriteB = spr_armB;
}


///@function doll_draw()
///@description Draws the sprites associated with the doll.
function doll_draw()
{
	draw_sprite_ext(armSpriteB, 0, x, y, 1, image_yscale, handAngle, skinColor, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, skinColor, 1);
	draw_sprite_ext(faceSprite, faceIndex, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	draw_sprite_ext(hairSprite, hairIndex, x, y, image_xscale, image_yscale, image_angle, hairColor, 1);
	draw_sprite_ext(pantsSprite, image_index, x, y, image_xscale, image_yscale, image_angle, pantsColor, 1);
	draw_sprite_ext(shirtSprite, shirtIndex, x, y, image_xscale, image_yscale, image_angle, shirtColor, 1);
	draw_sprite_ext(shoeSprite, image_index, x, y, image_xscale, image_yscale, image_angle, shoeColor, 1);
	draw_sprite_ext(armSpriteA, 0, x, y, 1, image_yscale, handAngle, skinColor, 1);
}


//Stuff that creates instances on the doll's end. Usually this entails adding a reference to the doll as an 'owner' on the created an instance.

/// @function doll_instance_create(_doll, _object, _spd = 0)
/// @description Creates an instance of _object at the x, y coordinates of a specified _doll instance. Sets owner and angle variables on the created instance. Returns created instance.
/// @param _doll Doll object. 
/// @param _object Object to create an instance of.
/// @param spd Speed for object to move towards 'angle' at.   If 'undefined' does not define physics for the object.
function doll_instance_create( _doll, _object, _spd)
{
		//Maybe put in some manner of non-static doll_instance_create(_doll, _object, _spd = 0) function?
		// would return created instance so in the Use() function for children could be further modified.
		var _x = _doll.x;
		var _y = _doll.y;
		var _depth = _doll.depth - 1;
		var _angle = _doll.angle;
		
		var _instance = instance_create_depth(_x, _y, _depth, _object);
		
		with (_instance)
		{
			owner = _doll;
			angle = _angle;
			
			if (_spd != undefined)
			{
				hsp = dsin(_angle) * _spd;
				vsp = dcos(_angle) * _spd;
			}
		}
		
		return _instance;
}

/// @function doll_meleeInstance_initialize(_owner, _sprite, _damage, _arc, _spd, _angle)
/// @description initialized a held melee instance
/// @param _owner Instance index of creating object (usually a doll)
/// @param _sprite sprite index to be assigned to the created melee instance.
/// @param _damage damage the melee instance will deal.
/// @param _arc degrees the arc the instance will swing across
/// @param _spd How fast the instance will swing across that arc
/// @param _angle the angle the instance starts at.
function doll_meleeInstance_initialize(_owner, _sprite, _damage, _arc, _spd, _angle)
{
	owner = _owner;
	//Todo: Actually program knockback values.
	hurtbox_initialize(_damage, 3, 3, owner);
	
	sprite_index = _sprite;
	mask_index = _sprite;
	
	damage = _damage;
	
	arc = _arc;
	spd = _spd;
	
	angle = _angle;
	image_angle = angle;
	
	dir = -power(-1, angle div 180);
}

/// @function doll_firearmInstance_initialize(_owner, _sprite, _damage, _cooldown, _rounds, _angle, _projectile = obj_round)
/// @param _owner Instance index of creating object (usually a doll)
/// @description Creates a firearm instance held by a doll object.
/// @param _sprite sprite index to be assigned to the created firearm instance.
/// @param _damage damage the melee instance will deal.
/// @param _cooldown time in between firing bullets.
/// @param _rounds number of bullets to be fired per burst.
/// @param _angle Angle to start at
/// @param [_projectile] Object to be fired. By default a bullet but you could do a rocket or something too.
function doll_firearmInstance_initialize(_owner, _sprite, _damage, _cooldown, _rounds, _angle, _projectile = obj_round)
{
	//Make instance and owner reference each other.
	owner = _owner;
	
	
	sprite_index = _sprite;
	damage = _damage;
	cooldown = _cooldown;
	cooldownTimer = cooldown/4;
	rounds = _rounds;
	angle = _angle;
	image_angle = angle;
	
	projectile = _projectile;
}