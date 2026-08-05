// Inherit the parent event
event_inherited();

doll_initialize_random();
living_initialize(1000000000);

//Returns true if the player object is to the right of the clling instance or does not exist.
var _conditionMethod = function()
{
	var _player = instance_find(obj_player, 0);
	
	if (_player)
	{
		return (_player.x > x) || (distance_to_point(_player.x, _player.y) < RANGE_CLOSE);	
	}
	else
	{
		return true;	
	}
}

npc_initialize("Marcus", "Use the arrow keys or WASD to move. Follow me!", 
[
	new NPCCommandSpeak(),
	new NPCCommandMove(new Point2(684, 2324), 10),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandSpeak(["Press space to jump over the debris."]),
	new NPCCommandMove(new Point2(800, 2300), 10),
	new NPCCommandMove(new Point2(1048, 2300), 10),
	new NPCCommandMove(new Point2(1180, 2300), 10),
	new NPCCommandMove(new Point2(1320, 2300), 10),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandSpeak(["You can press space in midair to double jump!"]),
	new NPCCommandMove(new Point2(2024, 2300), 0),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandMove(instance_nearest(x, y, obj_itemPickup), 60),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandSpeak(["Pick up this gun and press ENTER to equip it.", "Click on it in your inventory and drag it over to equip on the right.", "Use UP and DOWN or the scroll wheel to cycle through equipped gear."]),
	new NPCCommandMove(instance_nearest(x, y, obj_itemPickup), 60),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandSpeak(["There's enemies up ahead. Use mouse to aim and Left Mouse Button to shoot."]),
	new NPCCommandMove(new Point2(2674, 2300), 0),
	new NPCCommandCheckCondition(_conditionMethod),
	new NPCCommandMove(new Point2(5674, 2300), 0),
	
	//new NPCCommandMove(new Point2(700, 2324)),
	//new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	//new NPCCommandMove(new Point2(600, 2324), SECOND ),
	//new NPCCommandTalkTo(obj_player, ["Press space to jump over the debris.", "You can press space in midair to double jump!"]),
	//new NPCCommandMove(new Point2(2000, 2324), SECOND /2),
	//new NPCCommandTalkTo(instance_nearest(x, y, obj_itemPickup),
	//new NPCCommandTalkTo(obj_player, ["There are enemies up ahead. Left click to shoot at them. SHIFT and A or D lets you dash.", "Once you get to the door you can press CTRL to go through it and finish the tutorial."]),
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
