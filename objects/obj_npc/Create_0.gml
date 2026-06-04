// Inherit the parent event
event_inherited();

doll_initialize_random();

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);

//These values correspond to palyer inputs. Essentially the NPC is the
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