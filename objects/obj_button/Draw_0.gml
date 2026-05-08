/// @desc Draws self, text.
draw_self();



var _x = (bbox_right + bbox_left) / 2;
draw_set_halign(fa_center);
draw_set_font(fnt_default);

draw_text_colour(_x, y, text, fgColor, fgColor, fgColor, fgColor, 1);