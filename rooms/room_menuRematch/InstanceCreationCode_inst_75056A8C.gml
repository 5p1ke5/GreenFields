var _clickFunction = function()
{
	with (inst_rematch)	
	{
		status = REMATCH.ACCEPTED;
		text = "AWAITING RESPONSE";
	}
	text = "ACCEPTED";
}

button_initialize("Rematch?", _clickFunction);