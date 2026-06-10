if (instance_number(obj_npc) == 0)
{
	var _x;
	do 
	{
	    _x = irandom(room_width);
	} until !(collision_point(_x, y, BLOCK, false, true));
	
	var _npc = instance_create_depth(_x, y, depth, obj_npc);
	var _combatLevel = 50// - (count * 5)
	with (_npc)
	{
		npc_initialize("Enemy", "Prepare to die!", [new NPCCommandFight(obj_player)], max(1, _combatLevel));
		living_initialize(20);
		inventory = choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_ASSAULTRIFLE], [new ITEM_MACHINEGUN]);
		equipIndex = 0;

		inventory[equipIndex].Equip(self);
	}
	
	count++;
}