/// @description Draws a preview of the player character, then menu options.

doll_draw();

/// Draws the menu
menu_draw_transformed(display_get_gui_width() * 3 / 4, 8, options, c_white, c_gray, room_height, optionSelected, 2, 2, 0)
