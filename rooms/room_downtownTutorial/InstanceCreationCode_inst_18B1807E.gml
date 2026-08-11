//These guys are easy.
living_initialize(20);
npc_initialize("Enemy", "Get em boys!", [], 100, FACTIONS.ENEMY);
inventory = [new ITEM_PISTOL];
equipIndex = 0;
inventory[equipIndex].Equip(self);

