// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("Marcus", "Use the arrow keys or WASD to move. Follow me!", [new NPCCommandMove(new Point2(1280, 2320))]);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
