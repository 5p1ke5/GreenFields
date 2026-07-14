/// @desc Draws self, back square, price.
draw_set_alpha(0.3);
draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_white, c_white, c_white, c_white, true);
draw_sprite(sprite_index, 0, x, y);
