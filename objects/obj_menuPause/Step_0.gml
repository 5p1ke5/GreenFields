/// @description If Space is down return to the room that was paused from.
if (START_BUTTON_RELEASED)
{
	room_goto(global.roomPausedFrom);
}