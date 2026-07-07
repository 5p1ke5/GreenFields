/// @function bgm_play()
/// @description sets bgm.
/// @param _sound the sound to play as BGM.
function bgm_play(_sound)
{
	//If already playing the passed audio exits.
	if (audio_sound_get_asset(global.bgm) == _sound)
	{
		return;	
	}
	
	//Otherwise stops the bgm and plays the new one.
	audio_stop_sound(global.bgm);
	global.bgm = audio_play_sound(_sound, 0, true);
}


/// @function audio_play_sound_pos(_sound, _x, _y)
/// @desc Standardized falloff for audio_play_sound_at()
/// @param _sound Sound index to play
/// @param _x X coordinate to play sound at 
/// @param _y Y coordinate to play the sound at
function audio_play_sound_pos(_sound, _x, _y)
{
	audio_play_sound_at(_sound, _x, _y, 0, RANGE_LONG, RANGE_LONG * 8, 1, false, 0);
}