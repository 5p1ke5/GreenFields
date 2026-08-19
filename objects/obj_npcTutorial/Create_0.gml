// Inherit the parent event
event_inherited();

doll_initialize(doll_initialize_random_appearance());
living_initialize(1000000000);

var _conditionMethod1 = function()
{
	var _number = instance_number(obj_npcEnemy);
	return _number <= 1;
}

var _conditionMethod2 = function()
{
	var _number = instance_number(obj_npcEnemy);
	return _number == 0;
}



npc_initialize("Marcus", ["Welcome to the Resistance Training Exercise.", "Use the arrow keys or WASD to move."], 
[
	new NPCCommandSpeak(),
	new NPCCommandMove(obj_player, 5 * SECOND),
	new NPCCommandSpeak("Follow me!"),
	new NPCCommandMove(new Point2(640, 2300), 10),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandSpeak(["Press space to jump over the debris."]),
	new NPCCommandMove(new Point2(800, 2300), 10),
	new NPCCommandMove(new Point2(1048, 2300), 10),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandMove(new Point2(1180, 2300), 10),
	new NPCCommandMove(new Point2(1320, 2300), 10),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandSpeak(["You can press space in midair to double jump!"]),
	new NPCCommandMove(new Point2(1520, 2100), 10),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandMove(new Point2(2024, 2300), 0),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandMove(instance_nearest(x, y, obj_itemPickup)),
	new NPCCommandSpeak(["Pick up this gun and press ENTER to equip it.", "Click on it in your inventory and drag it over to equip on the right.", "Use UP and DOWN or the scroll wheel to cycle through equipped gear."]),
	new NPCCommandMove(obj_player, 12 * SECOND),
	new NPCCommandSpeak(["There's an enemy up ahead. Use mouse to aim and Left Mouse Button to shoot."]),
	new NPCCommandMove(new Point2(2500, 2300), 0),
	new NPCCommandCheckCondition(_conditionMethod1),
	new NPCCommandSpeak(["You got em! Great job. Let's keep going."]),
	new NPCCommandMove(new Point2(3424, 2300), SECOND),
	new NPCCommandSpeak(["You press SHIFT while moving left or right to dash.", "There's another guy up ahead. Try dashing to dodge his attacks."]),
	new NPCCommandCheckCondition(_conditionMethod2),
	new NPCCommandSpeak(["Good job, you passed the training!"]),
	new NPCCommandMove(new Point2(4800, 2300), 0),
	new NPCCommandCheckVector(obj_player, 1, , RANGE_CLOSE),
	new NPCCommandSpeak(["Press CTRL to interact with objects when a '?' is over your head.", "Use CTRL to go through the door."]),
	new NPCCommandMove(obj_player),
], , FACTIONS.PLAYER);

//Initialize inventory.
inventory = [new ITEM_PISTOL];
equipIndex = 0;

inventory[equipIndex].Equip(self);
