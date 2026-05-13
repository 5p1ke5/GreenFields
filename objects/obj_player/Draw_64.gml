/// @description draws health, money.

draw_set_halign(fa_left);
draw_text_transformed(16, 10, "HP: " + string(hp), 2, 2, 0);
draw_text_transformed(16, 80, "Money: " + string(global.money), 2, 2, 0);