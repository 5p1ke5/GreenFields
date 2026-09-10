/// @function fanfare_initialize(_text, _duration = SECOND)
/// @description Initializes variables for a fanfare object.
function fanfare_initialize(_text, _duration = SECOND)
{
	text = _text;
	maxDuration = _duration;
	duration = _duration;
}