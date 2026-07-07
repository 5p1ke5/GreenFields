/// @desc Initializes physics. This one accelerates to max speed.
hsp = 0;
vsp = 0;

grav = 0.02;
spd = BULLET_SPEED/2;

//Play sound effect
audio_play_sound_pos(sfx_fireGrenadegun, x, y);