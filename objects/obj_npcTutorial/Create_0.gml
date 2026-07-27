// Inherit the parent event
event_inherited();

doll_initialize_random();

npc_initialize("Marcus", "Use the arrow keys or WASD to move. Follow me!", 
[
	//We need to get past the rubble from this plane crash press space to jump.
	//Press space in midair to double jump
	//new NPCCommandMove(new Point2(700, 2324)),
	//new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	new NPCCommandTalkTo(obj_player, ["Pick up this gun and press ENTER to equip it.", "Click on it in your inventory and drag it over to equip on the right.", "Use UP and DOWN or the scroll wheel to cycle through equipped gear."])
	// "Okay let's keep going" "Remember to equip your gun in the pause menu by pressing enter."
	// Fuck there are police up ahead we'll fight our way through them
	// Left click to shoot at enemies
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
