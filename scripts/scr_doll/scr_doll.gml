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
	
	
	var _twoHanded = false;
	if (myHeld)
	{
		if (is_instanceof(myHeld, ItemEquipFirearm))
		{
			_twoHanded = myHeld.twoHanded;
		}
	}
	
	if (!_twoHanded)
	{
		draw_sprite_ext(armSpriteB, 0, x, y, 1, image_yscale, handAngle, skinColor, 1);
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, drawAngle, skinColor, 1);
	draw_sprite_ext(faceSprite, faceIndex, x, y, image_xscale, image_yscale, drawAngle, c_white, 1);
	draw_sprite_ext(hairSprite, hairIndex, x, y, image_xscale, image_yscale, drawAngle, hairColor, 1);
	draw_sprite_ext(pantsSprite, image_index, x, y, image_xscale, image_yscale, drawAngle, pantsColor, 1);
	draw_sprite_ext(shirtSprite, shirtIndex, x, y, image_xscale, image_yscale, drawAngle, shirtColor, 1);
	draw_sprite_ext(shoeSprite, image_index, x, y, image_xscale, image_yscale, drawAngle, shoeColor, 1);
	
	if (myHeld)
	{
		draw_sprite_ext(myHeld.sprite_index, myHeld.image_index, x, y, 1, image_xscale, handAngle, c_white, 1);	
	}
	
	if (_twoHanded)
	{
		draw_sprite_ext(armSpriteB, 0, x - (_twoHanded * image_xscale * 6), y, 1, image_yscale, handAngle, skinColor, 1);
	}
	draw_sprite_ext(armSpriteA, 0, x, y, 1, image_yscale, handAngle, skinColor, 1);
}




///@function doll_draw_ext(_x, _y, _color, _alpha)
///@description Draws the sprites associated with the doll, with params for coordinate, color, and alpha.
///@param _x X coordinae to draw at 
///@param _y Y coordinae to draw at 
///@param _color Color to draw everything as.
///@param _alpha Alpha to draw everything at.
function doll_draw_ext(_x, _y, _color, _alpha)
{
	var _twoHanded = false;
	if (myHeld)
	{
		if (is_instanceof(myHeld, ItemEquipFirearm))
		{
			_twoHanded = myHeld.twoHanded;
		}
	}
	
	if (!_twoHanded)
	{
		draw_sprite_ext(armSpriteB, 0, _x, _y, 1, image_yscale, handAngle, _color, _alpha);
	}
	
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	draw_sprite_ext(faceSprite, faceIndex, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	draw_sprite_ext(hairSprite, hairIndex, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	draw_sprite_ext(pantsSprite, image_index, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	draw_sprite_ext(shirtSprite, shirtIndex, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	draw_sprite_ext(shoeSprite, image_index, _x, _y, image_xscale, image_yscale, drawAngle, _color, _alpha);
	
	if (myHeld)
	{
		draw_sprite_ext(myHeld.sprite_index, myHeld.image_index, _x, _y, 1, image_xscale, handAngle, _color, _alpha);	
	}
	
	if (_twoHanded)
	{
		draw_sprite_ext(armSpriteB, 0, _x - (_twoHanded * image_xscale * 6), _y, 1, image_yscale, handAngle, _color, _alpha);
	}
	draw_sprite_ext(armSpriteA, 0, _x, _y, 1, image_yscale, handAngle, _color, _alpha);
}


//These function take input to issue commands to the doll. The function vets the commands, and if the conditions are met performs the action.

/// @function doll_input_jump(_jump, _jumpOffset)
/// @desc Makes the doll attempt to jump. Height can be varied with _jumpOffset
/// @param _jump If the doll should attempt to jump.
/// @param _jumpOffset if the doll should offset their jump to jump higher.
function doll_input_jump(_jump, _jumpOffset)
{
	
	if (grounded)
	{
		//If grounded refills dash and jumps, resets spinspeed and drawangle
		// TODO: Make canDash more of a cooldown thing
		canDash = 1;
		multiJumps = maxMultiJumps;
		spinSpeed = 0;
		drawAngle = 0;
	}
	
	if (_jump) //Jumps
	{
		if (grounded) || (multiJumps > 0)
		{
			if (!grounded)
			{
				//Makes the player flip when they double jump.
				spinSpeed = facing * FLIP_SPEED;
				
				multiJumps--;
			}
			vsp = -jumpHeight;
		}
	} 

	//Offsets gravity to allow for jump cancelling
	if (_jumpOffset) 
	{
		vsp -= jumpOffset;
	}
	
	
	drawAngle += spinSpeed;
}


/// @function doll_input_move(_right, _left, _run)
/// @descr Commands the doll to move left or right. _run raises the maximum speed by 50%.
/// @param _right Moves right.
/// @param _left Move left.
/// @param _run Raises the maximum speed that can be accelerated  to.
function doll_input_move(_right, _left, _run)
{
	image_speed = _run ? animSpeedRun : animSpeed;
	
	hDir = _right - _left;
	
	if (hDir != 0)
	{
		hsp = phys_force_add(hsp, accel * hDir, maxSpeed + (0.5 * maxSpeed * _run));
		facing = hDir;
	}
}



/// @function doll_input_dash(_rightReleased, _leftReleased)
/// @descr Decrements dash input cooldowns. If dash button is down while left or right is pressed, makes the player dash.
/// @param _rightReleased right button released
/// @param _leftReleased left button released
function doll_input_dash(_dashDown, _rightPressed, _leftPressed)
{
	if (dashCD >= 0)
	{
		dashCD--;
		/* I can uncomment this to make the player stop at the end of their dash.
		if (dashCD == 0)// && (grounded)
		{
			hsp = 0;	
		}
		*/
		
		
		return;	
	}
	
	if (!B_BUTTON)
	{
		return;	
	}
	
	//If DashCD < 0 and B_BUTTON is down...
	var _dir = (_rightPressed - _leftPressed)
	if (_dir != 0)
	{
		vsp = -1;
		hsp = _dir * DASH_SPEED;
		dashCD = DASH_COOLDOWN;
		spinSpeed = 0;
		
		audio_play_sound(sfx_dash, 1, false);
	}
	
}



/// @function doll_input_aim(_angle, _myHeld, _mbLeft, _mbRight, _mbLeftPressed, _mbRightPressed, _mbLeftReleased, _mbRightReleased)
/// @descr Aims the player's weapon, controls fire and alt fire.
/// @param _angle The angle the player is pointing the weapon at.
/// @param _myHeld A reference to the currently equipped struct.
/// @param _mbLeft is the left mouse button presently down
/// @param _mbRight is the right mouse button presently down
/// @param _mbLeftPressed Was the left mouse button pressed this frame
/// @param _mbRightPressed Was the right mouse button pressed this frame
/// @param _mbLeftReleased Was the left mouse button released this frame
/// @param _mbRightReleased Was the right mouse button released this frame
function doll_input_aim(_angle, _myHeld, _mbLeft, _mbRight, _mbLeftPressed, _mbRightPressed, _mbLeftReleased, _mbRightReleased)
{
	handAngle = _angle;
	
	if (_myHeld)
	{
		if (_mbLeft)			{_myHeld.LeftButton(self);}
		if (_mbRight)			{_myHeld.RightButton(self);}
		if (_mbLeftPressed)		{_myHeld.LeftButtonPressed(self);}
		if (_mbRightPressed)	{ _myHeld.RightButtonPressed(self);}
		if (_mbLeftReleased)	{_myHeld.LeftButtonReleased(self);}
		if (_mbRightReleased)	{ _myHeld.RightButtonReleased(self);}
	}
}


/// @function doll_input_equipment(_incrementUp, _incrementDown)
/// @desc Sets equipIndex, equips selected inventory iem.
/// @param _incrementUp should equipmentIndex be incremented upwards
/// @param _incrementDown should equipmentIndex be incremented downwards
function doll_input_equipment(_incrementUp, _incrementDown)
{
	var _increment = _incrementDown - _incrementUp;
	var _index = equipIndex + _increment;
	
	//If index is too low loops around to the end of the array.
	if (_index < 0) 
	{
		equipIndex = array_length(inventory) - 1;
	}
	//Sets it to the new index if it's not too high
	else if (_index < array_length(inventory))
	{
		equipIndex = _index;	
	}
	//If the new index is too high just set it to zero.
	else 
	{
		equipIndex = 0;	
	}
	
	//If index was changed then re-equips.
	if (_increment != 0)
	{
		inventory[equipIndex].Equip(self);
	}

}















