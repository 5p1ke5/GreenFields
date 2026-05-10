/// @desc Activates if clicked on, deactivates if clicked anywhere else.
if (mouse_x < bbox_right) && (mouse_x > bbox_left) && (mouse_y < bbox_bottom) && (mouse_y > bbox_top)
{
	active = true;
	keyboard_string = text;
}
else
{
	active = false;	
}