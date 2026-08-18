/// @description Inerhits, initiralizes variables, position at spawn.

event_inherited();
living_initialize(100);

var _doll = global.playerDoll;
doll_initialize([_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, _doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor]);

faction = FACTIONS.PLAYER;

//Initialize inventory.
inventory = global.playerEquip;
equipIndex = 0;
inventory[equipIndex].Equip(self);


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