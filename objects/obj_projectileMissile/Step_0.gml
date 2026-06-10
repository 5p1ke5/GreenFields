/// @desc Accelerates to top speed.
if (spd < maxSpeed)
{
	spd += 0.1;	
}

y += vsp * spd;
x += hsp * spd;