/// @function game_initialize()
/// @description Sets up things right as the game starts. Sets random seed, initializes globals.
function game_initialize()
{
	randomise();
	game_set_speed(60, gamespeed_fps);
	globals_initialize();
	draw_set_font(fnt_default);
	room_goto(ROOM_TITLE);
	window_set_cursor(cr_cross);
	audio_listener_orientation(0, 0, 1, 0, -1, 0);
	audio_falloff_set_model(audio_falloff_linear_distance);
	show_debug_message("Game initialized.");
}