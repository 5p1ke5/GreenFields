/// @description Decrements duration, destroys self if duration expires.
duration -= 1;
if (duration < 0)
{
	instance_destroy();	
}