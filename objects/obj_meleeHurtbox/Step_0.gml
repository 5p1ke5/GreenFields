/// Locks position to owner's. If no owner exists destroys self.
if (owner)
{
	x = owner.x;
	y = owner.y;
}
else
{
	instance_destroy();	
}