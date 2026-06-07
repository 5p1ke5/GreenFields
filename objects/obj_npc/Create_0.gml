// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("NPC", "Hello!", [new NPCCommandIdle()]);

//Initialize inventory.
//inventory = [new ITEM_PISTOL];
inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_ASSAULTRIFLE], [new ITEM_MACHINEGUN]);
equipIndex = 0;

inventory[equipIndex].Equip(self);
