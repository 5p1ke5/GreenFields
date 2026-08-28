#region Object references
#macro BLOCK obj_block
#macro ONEWAY obj_oneWay
#macro GROUND abs_ground
#macro HURTBOX abs_hurtbox
#macro HURTBOX_ANY abs_hurtboxAny
#macro INTERACTABLE abs_interactable
#endregion


#region items
#macro ITEM_NONE ItemEquip("None", spr_iconBlank, 1, "Nothing.", spr_equipEmpty)
#macro ITEM_PISTOL ItemEquipFirearm("Pistol", spr_iconPistol, 50, "A basic but useful handgun.", spr_equipPistol, game_get_speed(gamespeed_fps)/4, obj_bullet, 10, false)
#macro ITEM_RAYGUN ItemEquipFirearmAuto("Ray Gun", spr_iconRaygun, 20, "A gun that shoots bursts of energy.", spr_equipRaygun, game_get_speed(gamespeed_fps)/4, obj_bulletEnergy, 20, false)
#macro ITEM_AUTOPISTOL ItemEquipFirearmAuto("Auto Pistol", spr_iconAutopistol, 50, "A fully automatic handgun.", spr_equipAutopistol, game_get_speed(gamespeed_fps)/4, obj_bullet, 10, false)
#macro ITEM_SHOTGUN ItemEquipFirearm("Shotgun", spr_iconShotgun, 20, "A powerful shotgun.", spr_equipShotgun, game_get_speed(gamespeed_fps)/2, obj_bulletShotgun, 2, true)
#macro ITEM_ASSAULTRIFLE ItemEquipFirearmAuto("Assault Rifle", spr_iconAssaultRifle, 60, "A rapid-fire rifle.", spr_equipAssaultRifle, game_get_speed(gamespeed_fps)/10, obj_bullet, 4, true)
#macro ITEM_MACHINEGUN ItemEquipFirearmAuto("Machine Gun", spr_iconMachinegun, 60, "A powerful machine gun.", spr_equipMachinegun, game_get_speed(gamespeed_fps)/5, obj_bullet, 8, true)
#macro ITEM_BAZOOKA ItemEquipFirearm("Bazooka", spr_iconBazooka, 4, "A bazooka that fires rockets.", spr_equipBazooka, game_get_speed(gamespeed_fps), obj_projectileMissile, noone, true)
#macro ITEM_GRENADEGUN ItemEquipFirearm("Grenade Gun", spr_iconGrenadegun, 6, "A handgun the shoots explosive grenades.", spr_equipGrenadeGun, game_get_speed(gamespeed_fps)/2, obj_projectileGrenade, noone, true)
#macro ITEM_BAT ItemEquipMelee("Bat", spr_iconBat, 1, "A big wooden baseball bat.", spr_equipBat, 50, 120, 8)
#endregion

#region rooms
#macro ROOM_TITLE room_menuTitle
#macro ROOM_TEST room_downtownTutorial
#macro ROOM_SINGLEPLAYER room_downtown
#macro ROOM_TRAINING room_trainingmode
#macro ROOM_ARCADE room_arcademode
#macro ROOM_MULTIPLAYER room_menuMultiplayer
#macro ROOM_REMATCH room_menuRematch
#macro ROOM_SERVER room_menuServer
#macro ROOM_CLIENT room_menuClient
#macro ROOM_PAUSE_EQUIP room_menuPauseEquip
#macro ROOM_PAUSE_MISSIONS room_menuPauseMissions
#macro ROOM_CHARACTER_CREATOR room_menuCharacterCreation
#endregion


#region Sprite references
#macro PANTS_ARRAY [spr_dollPants0, spr_dollPants1]
#macro SHOES_ARRAY [spr_dollShoes0, spr_dollShoes1]
#endregion

#region Ranges
#macro RANGE_MELEE 16
#macro RANGE_CLOSE 100
#macro RANGE_MEDIUM 200
#macro RANGE_CAMERA 320
#macro RANGE_LONG 400
#endregion


#region Constant numbers
#macro STARTING_HP 3
#macro TERMINAL_VELOCITY 20
#macro BULLET_SPEED 16
#macro MAX_ACCEL 3
#macro PLAYER_ACCEL 0.5
#macro JUMP_HEIGHT 5
#macro SECOND game_get_speed(gamespeed_fps)
#macro DASH_COOLDOWN (SECOND * 5 / 8)
#macro DASH_INPUT_CD (SECOND / 2)
#macro NPC_PASSIVE_CD (SECOND)
#macro DASH_SPEED 10
#macro DEFAULT_ANGLE 300
#macro FLIP_SPEED 12
#macro TEXT_BALLOON_SPEED 5
#macro TEXT_BALLOON_MAXW 150
#macro INVENTORY_MAX 16
#macro MISSIONLOG global.missions
#endregion

#region	Controls.
#macro ANY_BUTTON (keyboard_check(vk_anykey))
#macro RIGHT_BUTTON (keyboard_check(vk_right)	 || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr))
#macro DOWN_BUTTON (keyboard_check(vk_down)		 || keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd))
#macro LEFT_BUTTON (keyboard_check(vk_left)		 || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl))
#macro UP_BUTTON (keyboard_check(vk_up)			 || keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu))
#macro A_BUTTON (keyboard_check(vk_space) || gamepad_button_check(0, gp_face1))
#macro B_BUTTON (keyboard_check(vk_shift) || gamepad_button_check(0, gp_face3))
#macro X_BUTTON (keyboard_check(vk_lcontrol) || keyboard_check(vk_control) || keyboard_check(ord("X")) || gamepad_button_check(0, gp_face2))
#macro Y_BUTTON (keyboard_check(ord("C")) || gamepad_button_check(0, gp_face4))
#macro FACE_BUTTON (A_BUTTON || B_BUTTON || X_BUTTON || Y_BUTTON) 
#macro START_BUTTON ((gamepad_button_check(0, gp_start)) || (keyboard_check(vk_enter)))
#macro RESTART_BUTTON (keyboard_check(vk_f8))
#macro MOUSE_LEFT_BUTTON mouse_check_button(mb_left)
#macro MOUSE_RIGHT_BUTTON mouse_check_button(mb_right)
#macro MOUSE_LEFT_BUTTON_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON)
#macro MOUSE_RIGHT_BUTTON_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON)
#macro MOUSE_WHEEL_UP mouse_wheel_up()
#macro MOUSE_WHEEL_DOWN mouse_wheel_down()

#macro ANY_BUTTON_PRESSED (keyboard_check_pressed(vk_anykey))
#macro RIGHT_BUTTON_PRESSED (keyboard_check_pressed(vk_right)	|| keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr))
#macro DOWN_BUTTON_PRESSED (keyboard_check_pressed(vk_down)		|| keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd))
#macro LEFT_BUTTON_PRESSED (keyboard_check_pressed(vk_left)		|| keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl))
#macro UP_BUTTON_PRESSED (keyboard_check_pressed(vk_up)			|| keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu))
#macro A_BUTTON_PRESSED (keyboard_check_pressed(vk_space)	|| gamepad_button_check_pressed(0, gp_face1))
#macro B_BUTTON_PRESSED (keyboard_check_pressed(ord("Z"))	|| gamepad_button_check_pressed(0, gp_face3))
#macro X_BUTTON_PRESSED (keyboard_check_pressed(vk_lcontrol) || keyboard_check_pressed(vk_control) || keyboard_check_pressed(ord("X"))	|| gamepad_button_check_pressed(0, gp_face2))
#macro Y_BUTTON_PRESSED (keyboard_check_pressed(ord("C"))	|| gamepad_button_check_pressed(0, gp_face4))
#macro RESTART_BUTTON_PRESSED (keyboard_check_pressed(vk_f8))
#macro MOUSE_LEFT_BUTTON_PRESSED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_PRESSED mouse_check_button_pressed(mb_right)
#macro MOUSE_LEFT_BUTTON_PRESSED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON_PRESSED)
#macro MOUSE_RIGHT_BUTTON_PRESSED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON_PRESSED)

#macro ANY_BUTTON_RELEASED (keyboard_check_released(vk_anykey))
#macro START_BUTTON_RELEASED ((gamepad_button_check_released(0, gp_start)) || (keyboard_check_released(vk_enter)))
#macro RIGHT_BUTTON_RELEASED (keyboard_check_released(vk_right) || keyboard_check_released(ord("D")) || gamepad_button_check_released(0, gp_padr))
#macro DOWN_BUTTON_RELEASED (keyboard_check_released(vk_down)	|| keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_padd) || mouse_wheel_down())
#macro LEFT_BUTTON_RELEASED (keyboard_check_released(vk_left)	|| keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_padl))
#macro UP_BUTTON_RELEASED (keyboard_check_released(vk_up)		|| keyboard_check_released(ord("W")) || gamepad_button_check_released(0, gp_padu) || mouse_wheel_up())
#macro A_BUTTON_RELEASED (keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1))
#macro B_BUTTON_RELEASED (keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face3))
#macro X_BUTTON_RELEASED (keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face2))
#macro Y_BUTTON_RELEASED (keyboard_check_released(ord("C")) || gamepad_button_check_released(0, gp_face4))
#macro FACE_BUTTON_RELEASED (A_BUTTON_RELEASED || B_BUTTON_RELEASED || X_BUTTON_RELEASED || Y_BUTTON_RELEASED) 
#macro MOUSE_LEFT_BUTTON_RELEASED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_RELEASED mouse_check_button_pressed(mb_right)
#macro MOUSE_LEFT_BUTTON_RELEASED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON_RELEASED)
#macro MOUSE_RIGHT_BUTTON_RELEASED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON_RELEASED)
#endregion



#region extra colors
//Human skin colors
#macro c_black1 make_color_rgb(120, 65, 35)
#macro c_black2 make_color_rgb(160, 65, 35)
#macro c_black3 make_color_rgb(160, 85, 60)
#macro c_white1 make_color_rgb(255, 195, 140)
#macro c_white2 make_color_rgb(255, 215, 130)
#macro c_white3 make_color_rgb(255, 195, 140)
#macro c_hispanic1 make_color_rgb(175, 105, 75)
#macro c_hispanic2 make_color_rgb(255, 205, 165)
#macro c_hispanic3 make_color_rgb(255, 170, 140)
#macro c_asian1 make_color_rgb(210, 135, 100)
#macro c_asian2 make_color_rgb(255, 205, 105)
#macro c_asian3 make_color_rgb(255, 180, 90)

//Human hair colors.
#macro c_blonde make_color_rgb(235, 255, 0)
#macro c_darkBrunette make_color_rgb(100, 70, 0)
#macro c_brunette make_color_rgb(150, 70, 0)
#macro c_lightBrunette make_color_rgb(200, 125, 0)
#macro c_ginger make_color_rgb(220, 110,0)

//Other colors
#macro c_violet make_colour_rgb(200,0, 140)
#macro c_pink make_colour_rgb(255, 50, 255)
#macro c_brown make_colour_rgb(190, 85, 0)
#macro c_cream make_color_rgb(255, 255, 200)

#endregion

enum REMATCH 
{
	UNDECIDED, 
	ACCEPTED,
	REJECTED,
	READY
}


enum FACTIONS
{
	NONE,
	PLAYER,
	CRIMINAL,
	POLICE,
	ENEMY,
	HOSTILE
}