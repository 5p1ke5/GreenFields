/// @description Draws arms, body.

// Draws afterimage after dashing
if (dashCD > 0)
{
	doll_draw_ext(xprevious, yprevious, c_blue, 0.2);	
	doll_draw_ext((x + xprevious) / 2, (y + yprevious) / 2, c_blue, 0.5);
}

doll_draw();
