/// @description Initializes firearm variables.
var _damage = 2;
var _cooldown = game_get_speed(gamespeed_fps) / 4;
var _bullet = obj_bullet;

equip_firearm_initialize(_damage, _cooldown, _bullet);