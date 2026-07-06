npc_initialize("Red", "Reds rise up!",  [new NPCCommandIdle()], , FACTIONS.CRIMINAL);
doll_initialize_random();
shirtColor = c_red;

inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_ASSAULTRIFLE], [new ITEM_MACHINEGUN]);
equipIndex = 0;

inventory[equipIndex].Equip(self)