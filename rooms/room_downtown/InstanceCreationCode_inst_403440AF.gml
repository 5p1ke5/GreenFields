npc_initialize("Blues", "Blues for life!",  [new NPCCommandIdle()], , FACTIONS.POLICE);
doll_initialize_random();
shirtColor = c_blue;

inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_ASSAULTRIFLE], [new ITEM_MACHINEGUN]);
equipIndex = 0;

inventory[equipIndex].Equip(self)