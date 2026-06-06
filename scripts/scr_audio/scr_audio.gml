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