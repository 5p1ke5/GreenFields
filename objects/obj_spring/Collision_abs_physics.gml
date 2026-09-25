var _bounceHeight = bounceHeight;

with (other)
{
	vsp = _bounceHeight;
}

image_speed = 0.5;

if !(audio_is_playing(sound))
{
	sound = audio_play_sound(sfx_bounce, 0, false);
}