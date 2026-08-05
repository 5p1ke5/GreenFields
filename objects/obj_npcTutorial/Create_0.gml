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
	new NPCCommandMove(new Point2(640, 2300), 10),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_MEDIUM),
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
	new NPCCommandMove(new Point2(2674, 2300), 0)
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
