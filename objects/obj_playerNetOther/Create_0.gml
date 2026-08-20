// Inherit the parent event
event_inherited();

var _doll = global.playerDoll;
var _appearance = [_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, _doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor];
doll_initialize_appearance(_appearance);
doll_initialize_inventory([new ITEM_PISTOL]);

inventory[equipIndex].Equip(self);


aButtonPressed = false;
aButton = false;
rightButton = false;
leftButton = false;
runButton = false;
mLeftButton = false;
mRightButton = false;
mLeftButtonReleased = false;
mRightButtonReleased = false;
upButtonReleased = false;
downButtonReleased = false;
mouseX = x;
mouseY = y;