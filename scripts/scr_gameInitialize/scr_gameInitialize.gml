/// @function game_initialize()
/// @description Sets up things right as the game starts. Sets random seed, initializes globals.
function game_initialize()
{
	randomise();
	game_set_speed(60, gamespeed_fps);
	globals_initialize();
	draw_set_font(fnt_default);
	room_goto(ROOM_TITLE);
	show_debug_message("Game initialized.");
	window_set_cursor(cr_cross)
}