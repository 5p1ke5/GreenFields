if (active)
{
	if (string_length(keyboard_string) <= maxLength) || (maxLength < 0)
	{
		text = keyboard_string;	
	}
	keyboard_string = text;
}