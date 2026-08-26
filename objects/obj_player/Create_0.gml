/// @description Inherits, initiralizes variables, position at spawn.
event_inherited();

living_initialize(100);

var _doll = global.playerDoll;
var _appearance = [_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, _doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor];
doll_initialize_appearance(_appearance);
doll_initialize_inventory(global.playerEquip)

faction = FACTIONS.PLAYER;

//The target for interaction.
interact = undefined;

//The alert being displayed.
alert = "";

//Positions at spawn point if defined.
if (global.spawnX != undefined)
{
	x = global.spawnX;
	y = global.spawnY;
}

if (global.spawnHsp != undefined)
{
	hsp = global.spawnHsp;	
}

if (global.spawnVsp != undefined)
{
	vsp = global.spawnVsp;	
}

missions = global.missions;
for (var _i = 0; _i < array_length(missions); _i++)
{
	var _mission = missions[_i];
	with (_mission)
	{
		Create();    
	}
}