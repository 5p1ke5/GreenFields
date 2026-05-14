// Inherit the parent event
event_inherited();

var _doll = global.playerDoll;
doll_initialize(_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, _doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor);

//Initialize inventory.
inventory = [new ITEM_SHOTGUN, new ITEM_PISTOL];
equipIndex = 0;

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