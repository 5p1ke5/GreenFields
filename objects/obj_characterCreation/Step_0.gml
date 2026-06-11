event_inherited();

var _increment = RIGHT_BUTTON_RELEASED - LEFT_BUTTON_RELEASED;
			
//Set colors.
var _red = sliderRed.val;
var _green = sliderGreen.val;
var _blue = sliderBlue.val;

switch (optionSelected)
{
	case 0: //Face
		faceIndex += _increment;
			
		if (faceIndex < 0)
		{
			faceIndex = sprite_get_number(spr_dollFace) - 1;	
		}
		
		if (faceIndex >= sprite_get_number(spr_dollFace))
		{
			faceIndex = 0;
		}
		
		faceIndex = faceIndex;

		if (MOUSE_LEFT_BUTTON)
		{
			skinColor = make_color_rgb(_red, _green, _blue);
		}
		
		options[optionSelected] =  "FACE: " + string(faceIndex);
		break;
		
		
	case 1: //Hair
		hairIndex += _increment;
		
		if (hairIndex < 0)
		{
			hairIndex =  sprite_get_number(spr_dollHair) - 1;	
		}
		
		if (hairIndex >= sprite_get_number(spr_dollHair))
		{
			hairIndex = 0;
		}

		if (MOUSE_LEFT_BUTTON)
		{
			hairColor = make_color_rgb(_red, _green, _blue);
		}
	
		
		options[optionSelected] = "HAIR: " + string(hairIndex);
		break;
	
	
	case 2: //Shirt
		shirtIndex += _increment;
		
		if (shirtIndex < 0)
		{
			shirtIndex = sprite_get_number(spr_dollShirt) - 1;	
		}
		
		if (shirtIndex >= sprite_get_number(spr_dollShirt))
		{
			shirtIndex = 0;
		}
	
	
		if (MOUSE_LEFT_BUTTON)
		{
			shirtColor = make_color_rgb(_red, _green, _blue);
		}
		
		options[optionSelected] = 	"SHIRT: " + string(shirtIndex);
	break;
	
	case 3: //Pants.
		pantsIndex += _increment;
		
		if (pantsIndex < 0)
		{
			pantsIndex = array_length(PANTS_ARRAY) - 1;	
		}
		
		if (pantsIndex >= array_length(PANTS_ARRAY))
		{
			pantsIndex = 0;
		}
		
		
		pantsSprites = 
		[ //I'll think of a better way to do this later
			asset_get_index("spr_dollPants" + string(pantsIndex)), 
			asset_get_index("spr_dollPants" + string(pantsIndex) + "Jump"), 
			asset_get_index("spr_dollPants" + string(pantsIndex) + "Run")
		];
		pantsSprite = pantsSprites[0]
		options[optionSelected] = "PANTS: " + string(pantsIndex);
		
		if (MOUSE_LEFT_BUTTON)
		{
			pantsColor = make_color_rgb(_red, _green, _blue);
		}
	break;
	
	case 4: //Shoes
		shoeIndex += _increment;
		
		if (shoeIndex < 0)
		{
			shoeIndex =  array_length(SHOES_ARRAY) - 1;	
		}
		
		if (shoeIndex >= array_length(SHOES_ARRAY))
		{
			shoeIndex = 0;
		}
		
		shoeSprites = 
		[ //I'll think of a better way to do this later
			asset_get_index("spr_dollShoes" + string(shoeIndex)), 
			asset_get_index("spr_dollShoes" + string(shoeIndex) + "Jump"), 
			asset_get_index("spr_dollShoes" + string(shoeIndex) + "Run")
		];
		shoeSprite = shoeSprites[0]
		options[optionSelected] = "SHOES: " + string(shoeIndex);
		
		if (MOUSE_LEFT_BUTTON)
		{
			shoeColor = make_color_rgb(_red, _green, _blue);
		}
	break;
	
	case 5: //Exit
		if (FACE_BUTTON_RELEASED)
		{
			audio_stop_sound(global.bgm);
			global.playerDoll = doll_struct(faceIndex, hairIndex, shirtIndex, pantsIndex, shoeIndex, skinColor, hairColor, shirtColor, pantsColor, shoeColor);
			room_goto(ROOM_TITLE);
		}
	break;
}