// Inherit the parent event
event_inherited();
living_initialize(100);

doll_initialize_random();

npc_initialize("Blue", "I'm blue for life!", [new NPCCommandIdle()], , FACTIONS.POLICE);

shirtColor = c_blue;

//Initialize inventory.
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]);
equipIndex = 0;
inventory[equipIndex].Equip(self);
