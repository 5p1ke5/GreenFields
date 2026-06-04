/// @description Draws arms, body. Flickers if taken damage. 

if (flicker % 5 != 0)
{
	
	if (dashCD > 0)
	{
		doll_draw_ext(xprevious, yprevious, c_blue, 0.2);	
		doll_draw_ext((x + xprevious) / 2, (y + yprevious) / 2, c_blue, 0.5);
	}
	doll_draw();
}
