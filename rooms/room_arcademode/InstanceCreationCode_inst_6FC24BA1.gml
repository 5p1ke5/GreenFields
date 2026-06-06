npc_initialize("Enemy", "Prepare to die!", 
	[
		new NPCCommandFight(obj_player)
	])
living_initialize(50, FLICKER_MAX);