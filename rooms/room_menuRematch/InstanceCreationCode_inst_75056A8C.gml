var _clickFunction = function()
{
	with (inst_rematch)	
	{
		status = REMATCH.ACCEPTED;
	}
	text = "ACCEPTED";
}

button_initialize("Rematch?", _clickFunction);