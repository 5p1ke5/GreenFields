global.money += value;
instance_destroy();
message_create(x, y, depth, string(value) + "$ GOT!");
audio_play_sound(sfx_moneyGet, 0, false);