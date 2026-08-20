// Inherit the parent event
event_inherited();

doll_initialize_appearance(doll_initialize_random_appearance());
doll_initialize_inventory(choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]));

living_initialize(20);
npc_initialize("Enemy", "Get em boys!", [], , FACTIONS.ENEMY);