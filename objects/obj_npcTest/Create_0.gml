// Inherit the parent event
event_inherited();

living_initialize(100);

doll_initialize(doll_initialize_random_appearance());

//npc_initialize("Marcus", "Use the arrow keys or WASD to move. Follow me!", 
npc_initialize("Marcus", ["foo"], 
[
	//new NPCCommandMove(obj_player, , RANGE_MEDIUM)
	new NPCCommandSpeak( ["Okay it's platforming time", "lets do some platforming", "we got this just jump over the blocks", "oof ow"]),
	new NPCCommandMove(new Point2(1574, 2318), SECOND/10),
	new NPCCommandSetDialogue(["fuck i fell down", "its alright im okay"]),
	new NPCCommandSpeak(),
	new NPCCommandMove(new Point2(4752, 2336), SECOND/10),
	new NPCCommandSpeak("We did it"),
	new NPCCommandMove(new Point2(4752, 2336), SECOND),
	new NPCCommandSpeak("We're heroes"),
	new NPCCommandMove(new Point2(4752, 2336), SECOND),
	new NPCCommandSetDialogue(["foo"])
	//new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	//new NPCCommandMove(new Point2(600, 2324), SECOND ),
	//new NPCCommandTalkTo(obj_player, ["Press space to jump over the debris.", "You can press space in midair to double jump!"]),
	//new NPCCommandMove(new Point2(2000, 2324), SECOND /2),
	//new NPCCommandTalkTo(instance_nearest(x, y, obj_itemPickup), ["Pick up this gun and press ENTER to equip it.", "Click on it in your inventory and drag it over to equip on the right.", "Use UP and DOWN or the scroll wheel to cycle through equipped gear."]),
	//new NPCCommandTalkTo(obj_player, ["There are enemies up ahead. Left click to shoot at them. SHIFT and A or D lets you dash.", "Once you get to the door you can press CTRL to go through it and finish the tutorial."]),
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
