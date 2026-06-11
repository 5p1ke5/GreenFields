/// @description Initialize variables.

var _doll = global.playerDoll;

doll_initialize(_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, 
			_doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor);

var _array;
_array[0] = "FACE: " + string(faceIndex);
_array[1] = "HAIR: " + string(hairIndex);
_array[2] = "SHIRT: " + string(shirtIndex);
_array[3] = "PANTS: " + string(pantsIndex);
_array[4] = "SHOES: " + string(shoeIndex);
_array[5] = "START GAME";

menu_initialize(_array);

//Get sliders, set self as owner.
var _self = self;
sliderRed = instance_find(obj_colorSliderRed, 0);
with (sliderRed)
{
	owner = _self;
}

sliderGreen = instance_find(obj_colorSliderGreen, 0);
with (sliderGreen)
{
	owner = _self;
}

sliderBlue = instance_find(obj_colorSliderBlue, 0);
with (sliderBlue)
{
	owner = _self;
}
