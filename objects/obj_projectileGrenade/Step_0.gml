/// @desc Accelerates to top speed.
vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);

y += vsp * spd;
x += hsp * spd;