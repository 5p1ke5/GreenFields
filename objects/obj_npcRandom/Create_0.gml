// Inherit the parent event
event_inherited();

doll_initialize_appearance(doll_initialize_random_appearance());
doll_initialize_inventory(choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]));

living_initialize(100);
npc_initialize("NPC", "Hello!", [new NPCCommandIdle()]);