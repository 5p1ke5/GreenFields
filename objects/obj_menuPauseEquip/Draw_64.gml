// @description Displays text on how to display the game.
draw_set_halign(fa_center);
draw_set_font(fnt_default);
var _text = "PAUSE\nPress Start to Continue\nMouse to Move Inventory to Equip"
draw_text_transformed_color(window_get_width()/2, 5, _text, 3,3, 0, c_white, c_white, c_white, c_white, 1);
