// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("Marcus", "Use the arrow keys or WASD to move. Follow me!", 
[
	new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	new NPCCommandTalkTo(obj_player, ["Pick up this gun and press ENTER to equip it.", "Click on it in your inventory and drag it over to equip on the right.", "Use UP and DOWN or the scroll wheel to cycle through equipped gear."])
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
