// Inherit the parent event
event_inherited();
living_initialize(50);

doll_initialize_random();

npc_initialize("Hostile", "I'll destroy everything!", [], , FACTIONS.HOSTILE);

shirtColor = c_yellow;
pantsColor = c_yellow;

//Initialize inventory.
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
equipIndex = 0;
inventory[equipIndex].Equip(self);
