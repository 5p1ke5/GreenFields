// Inherit the parent event
event_inherited();
maxSpeed = MAX_ACCEL * 3 / 4; 

doll_initialize_appearance(doll_initialize_random_appearance());

living_initialize(10);
npc_initialize("Zombie", "BRAAAAAAINS!", [new NPCCommandIdle()], , FACTIONS.HOSTILE);

skinColor = c_green;

//Initialize inventory.
inventory = [new ITEM_UNARMED];
equipIndex = 0;
inventory[equipIndex].Equip(self);
