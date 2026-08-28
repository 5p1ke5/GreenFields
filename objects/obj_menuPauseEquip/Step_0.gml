/// @description If Enter is released, return to the room that was paused from. Otherwise go to tile screen.
if (START_BUTTON_RELEASED)
{
	room_goto(global.roomPausedFrom);
}


if (RIGHT_BUTTON_RELEASED)
{
	room_goto(ROOM_PAUSE_MISSIONS);
}