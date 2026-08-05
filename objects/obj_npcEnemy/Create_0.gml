// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("Enemy", "Get em boys!", [], , FACTIONS.ENEMY);

shirtColor = c_lime;
pantsColor = c_lime;

//Initialize inventory.
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
equipIndex = 0;
inventory[equipIndex].Equip(self);
