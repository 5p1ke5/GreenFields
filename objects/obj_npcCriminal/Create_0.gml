// Inherit the parent event
event_inherited();

doll_initialize_random();
living_initialize(100);

npc_initialize("Reds", "Reds rise up!", [new NPCCommandIdle()], , FACTIONS.CRIMINAL);

shirtColor = c_red;

//Initialize inventory.
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
equipIndex = 0;
inventory[equipIndex].Equip(self);
