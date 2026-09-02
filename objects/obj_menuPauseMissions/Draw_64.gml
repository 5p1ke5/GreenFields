// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);
var _text = "PAUSE"
draw_text_transformed_color(display_get_gui_width()/2, 5, _text, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
