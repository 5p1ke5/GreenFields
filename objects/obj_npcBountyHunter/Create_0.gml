// Inherit the parent event
event_inherited();

doll_initialize_appearance(doll_initialize_random_appearance());
doll_initialize_inventory([new ITEM_ASSAULTRIFLE]);

living_initialize(120);
npc_initialize("Bounty Hunter", "You got a price on your head!", [new NPCCommandFight(obj_player)], , FACTIONS.ENEMY);