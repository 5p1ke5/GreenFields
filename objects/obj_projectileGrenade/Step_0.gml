/// @desc Applies gravity, moves.
vsp = phys_gravity(vsp, grav, TERMINAL_VELOCITY);

y += vsp * spd;
x += hsp * spd;