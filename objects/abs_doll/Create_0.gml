/// @description Initializes variables, position at spawn.

//TODO: Maybe move this into doll_initialize, none of it relies on parameters
hitbox_initialize([HURTBOX]);
phys_initialize(0.2, 0.1);
living_initialize(100, FLICKER_MAX);

//Doll movement control things.
hDir = 0; //Horizontal movement direction.
facing = 1; //Direction facing. Should always be 1 or -1.
maxSpeed = MAX_ACCEL; 
accel = PLAYER_ACCEL;

maxMultiJumps = 1;
multiJumps = maxMultiJumps;
jumpHeight = JUMP_HEIGHT;
jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

//Various variables dolls use to animate.
animSpeed = 0.2; //How fast the player animates normally
animSpeedRun = 0.5; //How fast the player animates while running
image_speed = animSpeed;
drawAngle = 0;

//How fast the doll is spinning
spinSpeed = 0;

//Dash stuff.
dashCD = -1;

handAngle = DEFAULT_ANGLE;

myHeld = noone;

//Initialize inventory.
inventory = [];
equipIndex = 0;