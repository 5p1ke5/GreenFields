npc_initialize("Testicle",  ["Penis. Penis penis penis pensi penis penis"], 
				[
					new NPCCommandTalkTo(obj_player, ["Hello! My name is Testicle.", "I'm here to help Ben test out the game!", "Welcome to the test map."]),
					new NPCCommandMove(obj_player, game_get_speed(gamespeed_fps) * 14),
					new NPCCommandIdle()
				]);