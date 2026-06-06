// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("NPC", "Hello!", [new NPCCommandIdle()]);
living_initialize(20, FLICKER_MAX);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
