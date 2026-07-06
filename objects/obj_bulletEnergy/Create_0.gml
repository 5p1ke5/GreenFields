/// @description Overwites parent, Initializes physics, is not solid. Hurtbox things should be intialized on creation.
hsp = 0;
vsp = 0;

spd = BULLET_SPEED/2;

//Play sound effect
audio_play_sound(sfx_fireRaygun, 0, false);