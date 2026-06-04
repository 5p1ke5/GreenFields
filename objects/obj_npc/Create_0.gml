// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("", "");

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
