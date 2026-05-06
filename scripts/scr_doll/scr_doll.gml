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
	draw_sprite_ext(armSpriteB, 0, x, y, image_xscale, image_yscale, 0, skinColor, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, skinColor, 1);
	draw_sprite_ext(faceSprite, faceIndex, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	draw_sprite_ext(hairSprite, hairIndex, x, y, image_xscale, image_yscale, image_angle, hairColor, 1);
	draw_sprite_ext(pantsSprite, image_index, x, y, image_xscale, image_yscale, image_angle, pantsColor, 1);
	draw_sprite_ext(shirtSprite, shirtIndex, x, y, image_xscale, image_yscale, image_angle, shirtColor, 1);
	draw_sprite_ext(shoeSprite, image_index, x, y, image_xscale, image_yscale, image_angle, shoeColor, 1);
	draw_sprite_ext(armSpriteA, 0, x, y, image_xscale, image_yscale, 0, skinColor, 1);
}