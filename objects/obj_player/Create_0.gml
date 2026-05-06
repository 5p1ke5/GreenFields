/// @description Initializes variables, position at spawn.

phys_initialize(0.2, 0.2);

hitbox = new Hitbox([], FLICKER_MAX); 

var _doll = global.playerDoll;
doll_initialize(_doll.faceIndex, _doll.hairIndex, _doll.shirtIndex, _doll.pantsIndex, _doll.shoeIndex, 
			_doll.skinColor, _doll.hairColor, _doll.shirtColor, _doll.pantsColor, _doll.shoeColor);

//Doll movement control things.
hDir = 0; //Horizontal movement direction.
facing = 1; //Direction facing. Should always be 1 or -1.
maxSpeed = 3; 
accel = 0.5;
jumpHeight = 4;
jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

//Various variables dolls use to animate.
animSpeed = 0.2; //How fast the player animates normally
animSpeedRun = 0.5; //How fast the player animates while running
image_speed = animSpeed;

handAngle = DEFAULT_ANGLE;

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