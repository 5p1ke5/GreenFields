// Inherit the parent event
event_inherited();

if (FACE_BUTTON_RELEASED)
{
	switch (options[optionSelected]) 
	{   
		case "Single Player":
			room_goto(ROOM_SINGLEPLAYER);
		break;
		case "MultiPlayer":
			room_goto(ROOM_MULTIPLAYER);
		break;
		case "Options":
		
		break;
		case "Exit":
			game_end();
		break;
	}
}

