/// @description does player things, inherits physics

npc_step();

doll_input_jump(aButtonPressed, aButton);
doll_input_move(rightButton, leftButton, runButton);
doll_input_equipment(upButtonReleased, downButtonReleased);
doll_input_aim(point_direction(x, y, mouseX, mouseY), myHeld, mLeftButton, mRightButton, mLeftButtonPressed, mRightButtonPressed, mLeftButtonReleased, mRightButtonReleased);


//Inherits physics and collision from doll.
event_inherited();