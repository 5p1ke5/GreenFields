/// @description Overwites parent, Initializes physics, is not solid. Hurtbox things should be intialized on creation.
hsp = 0;
vsp = 0;

spd = BULLET_SPEED;

//Play sound effect
//audio_play_sound(sfx_fireBullet, 0, false);
audio_play_sound_at(sfx_fireBullet, x, y, 0, RANGE_LONG, RANGE_LONG * 8, 1, false, 0);