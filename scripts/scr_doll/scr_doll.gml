//intializes everything all at once
/*
function npc_doll_initialize ()
{
	hitbox_initialize([HURTBOX]);
	phys_initialize(0.2, 0.2);
	living_initialize();
	//doll_initialize(); //Make this take an array instead, maybe?
	npc_initialize("NPC", "Hello!", [new NPCCommandIdle()]);
	
	//Initialize inventory.
	inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
	equipIndex = 0;

	inventory[equipIndex].Equip(self);
}
*/

///@function doll_initialize_appearance(_appearanceArray)
///@description Initializes the appearance of a doll.
///@param _appearanceArray 10-element array with indexes for face, hair, shirt, pants, shoes, as well as skin color and then colors for face, hair, shirt, pants, shoes
function doll_initialize_appearance(_appearanceArray)
{
	faceIndex = _appearanceArray[0];
	hairIndex = _appearanceArray[1];
	shirtIndex = _appearanceArray[2];
	pantsIndex = _appearanceArray[3];
	shoeIndex = _appearanceArray[4];
	skinColor = _appearanceArray[5];
	hairColor = _appearanceArray[6];
	shirtColor = _appearanceArray[7];
	pantsColor = _appearanceArray[8];
	shoeColor = _appearanceArray[9];
	
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


///@function doll_initialize(_appearanceArray)
///@description Initializes variables for a doll. 
///@param _appearanceArray 10-element array with indexes for face, hair, shirt, pants, shoes, as well as skin color and then colors for face, hair, shirt, pants, shoes
///@param _inventoryArray An array of inventory items.
///@param _drops An array of items the NPC drops on death. Can be Items or objects to spawn
function doll_initialize(_appearanceArray, _inventoryArray = [new ITEM_NONE], _drops = _inventoryArray)
{
	
	//Doll movement control things.
	hDir = 0; //Horizontal movement direction.
	facing = 1; //Direction facing. Should always be 1 or -1.
	maxSpeed = MAX_ACCEL; 
	accel = PLAYER_ACCEL;

	maxMultiJumps = 1;
	multiJumps = maxMultiJumps;
	jumpHeight = JUMP_HEIGHT;
	jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

	//Various variables dolls use to animate.
	animSpeed = 0.2; //How fast the player animates normally
	animSpeedRun = 0.5; //How fast the player animates while running
	image_speed = animSpeed;
	drawAngle = 0;

	//How fast the doll is spinning
	spinSpeed = 0;

	//Dash stuff.
	dashCD = -1;

	handAngle = DEFAULT_ANGLE;

	myHeld = noone;
	//Initialize appearance, inventory.
	
	//Maybe I should just have these be outside doll initialize and then I have 3 functions I can initialize at different stages.
	doll_initialize_appearance(_appearanceArray);
	doll_initialize_inventory(_inventoryArray, _drops);
}

///@function doll_initialize()
///@description Initializes variables all dolls have.
/*
function doll_initialize()
{
	//Doll movement control things.
	hDir = 0; //Horizontal movement direction.
	facing = 1; //Direction facing. Should always be 1 or -1.
	maxSpeed = MAX_ACCEL; 
	accel = PLAYER_ACCEL;

	maxMultiJumps = 1;
	multiJumps = maxMultiJumps;
	jumpHeight = JUMP_HEIGHT;
	jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

	//Various variables dolls use to animate.
	animSpeed = 0.2; //How fast the player animates normally
	animSpeedRun = 0.5; //How fast the player animates while running
	image_speed = animSpeed;
	drawAngle = 0;

	//How fast the doll is spinning
	spinSpeed = 0;

	//Dash stuff.
	dashCD = -1;

	handAngle = DEFAULT_ANGLE;

	myHeld = noone;
}
*/

/// @function doll_initialize_inventory(_inventoryArray, _drops = _inventoryArray)
/// @description Initializes the inventory of the given doll.
/// @param _inventoryArray an array of all inventory items.
/// @param _drops An array of items dropped when the doll dies.
function doll_initialize_inventory(_inventoryArray = [new ITEM_NONE], _drops = _inventoryArray)
{
	inventory = _inventoryArray;
	equipIndex = 0;
	inventory[equipIndex].Equip(self);
	
	drops = _inventoryArray;
}

///@function doll_initialize_random_appearance()
///@description Initializes a randomly generated doll appearance.
function doll_initialize_random_appearance()
{
	var _faceIndex = irandom(sprite_get_number(spr_dollFace));
	var _hairIndex = irandom(sprite_get_number(spr_dollHair));
	var _shirtIndex = irandom(sprite_get_number(spr_dollShirt));
	var _pantsIndex = irandom(1);
	var _shoeIndex = irandom(1);
	
	var _skinColor = choose(c_asian1, c_white1, c_black1, c_hispanic1);
	var _hairColor = choose(c_blonde, c_lightBrunette, c_brunette, c_darkBrunette, c_ginger);
	var _shirtColor = choose(c_red, c_blue, c_green, c_purple, c_orange, c_yellow, c_violet, c_pink);
	var _pantsColor = choose(c_blue, c_gray, c_green, c_navy);
	var _shoeColor = choose(c_brunette, c_green, c_red, c_black, c_brown);
	
	var _appearance = [_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor]
	
	return _appearance;
}


///@function doll_struct(_appearance)
///@description Creates a struct form of the doll component and returns it.
///@param _appearance 10-element array with indexes for face, hair, shirt, pants, shoes, as well as skin color and then colors for face, hair, shirt, pants, shoes 
function doll_struct(_appearance) 
{
	var _struct = {};
	
	with (_struct)
	{
		doll_initialize(_appearance);
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
				if (spinSpeed = 0)
				{
					spinSpeed = facing * FLIP_SPEED;
				}
				else
				{
					spinSpeed = -spinSpeed;
				}
				
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
		return;	
	}
	
	if (!_dashDown)
	{
		return;	
	}
	
	//If DashCD < 0 and B_BUTTON is down...
	var _dir = (_rightPressed - _leftPressed)
	if (_dir != 0)
	{
		if (grounded)
		{
			multiJumps++;	
		}
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






/// @function doll_input_interact(_upReleased)
/// @descr Checks if the doll is touching an interactable. If so, lets them interact with it.
function doll_input_interact(_upReleased)
{
	interact = instance_place(x, y, INTERACTABLE);

	//update alert. TODO: once interactables are added add a thing that sets 'interact' to 'true'
	alert = "";

	if (interact)
	{
		alert += "?";
		
		if (_upReleased)
		{
			with (interact)
			{
				event_user(0);
			}
		}
	}
}


/// @function doll_input_pause(_pauseButton)
/// @desc Pauses the game.
/// @param _pauseButton The button to press to pause the game.
function doll_input_pause(_pauseButton)
{
	if (_pauseButton)
	{
		global.roomPausedFrom = room;
		room_persistent = true;
		room_goto(ROOM_PAUSE)	
	}
}









