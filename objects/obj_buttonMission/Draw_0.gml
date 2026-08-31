var _string = title + " - " + description;

if (global.trackedMission == mission)
{
	var _color = c_yellow;	
}
else
{
	var _color = c_white;	
}

//Note to self: Later make it so this can be clicked to set x mission as being tracked
//draw_self();

draw_set_halign(fa_left);
draw_text_transformed_colour(x, y, _string, 1/2, 1/2, 0, _color, _color, _color, _color, 1);