// Inherit the parent event
event_inherited();

doll_initialize_appearance(doll_initialize_random_appearance());

living_initialize(50);
npc_initialize("Hostile", "I'll destroy everything!", [], , FACTIONS.HOSTILE);

shirtColor = c_yellow;
pantsColor = c_yellow;

//Initialize inventory.
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
equipIndex = 0;
inventory[equipIndex].Equip(self);
