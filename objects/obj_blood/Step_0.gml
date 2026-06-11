/// @desc Inherits physics, decrements duration and sets alpha. If duration is expired destrys self.
event_inherited();

duration--;
image_alpha = duration / maxDuration;
if (duration < 0)
{
	instance_destroy();	
}