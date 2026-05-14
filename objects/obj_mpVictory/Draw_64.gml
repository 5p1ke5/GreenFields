// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);
draw_text_transformed_color(window_get_width()/2, window_get_height()/8, "You Win!", 4, 4, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(window_get_width()/2, window_get_height()/2, "Press Space to View Results", 2, 2, 0, c_white, c_white, c_white, c_white, 1);