// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);
draw_text_transformed_color(display_get_gui_width()/2, display_get_gui_height()/16, "Green Fields", 4, 4, 0, c_white, c_white, c_white, c_white, 1);