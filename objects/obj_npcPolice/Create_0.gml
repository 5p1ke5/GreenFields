// Inherit the parent event
event_inherited();

var _array = doll_initialize_random_appearance()
_array[1] = CLOTHING_POLICEHAIR;
_array[2] = CLOTHING_POLICESHIRT;
_array[3] = 0;
_array[6] = c_dkblue;
_array[7] = c_dkblue;
_array[8] = c_dkgray;

doll_initialize_appearance(_array);

doll_initialize_inventory(choose([new ITEM_PISTOL], [new ITEM_SHOTGUN], [new ITEM_MACHINEGUN]));

living_initialize(30);
npc_initialize("Police", "Move along! Nothing to see here!", [new NPCCommandIdle()], , FACTIONS.POLICE);

