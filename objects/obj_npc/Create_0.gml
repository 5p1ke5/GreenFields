// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("", "", [new NPCCommandMove(obj_player, game_get_speed(gamespeed_fps) * 5)]);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
