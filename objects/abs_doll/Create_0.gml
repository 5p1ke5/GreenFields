/// @description Initializes variables, position at spawn.

hitbox_initialize([HURTBOX]);
phys_initialize(0.2, 0.2);
living_initialize(100, FLICKER_MAX);

//Doll movement control things.
hDir = 0; //Horizontal movement direction.
facing = 1; //Direction facing. Should always be 1 or -1.
maxSpeed = 3; 
accel = 0.5;

maxMultiJumps = 1;
multiJumps = maxMultiJumps;
jumpHeight = 4;
jumpOffset = 0.1; //This is applied to gravity to let the player jump higher while holding the jump button.

//Various variables dolls use to animate.
animSpeed = 0.2; //How fast the player animates normally
animSpeedRun = 0.5; //How fast the player animates while running
image_speed = animSpeed;
drawAngle = 0;

//How fast the doll is spinning
spinSpeed = 0;


handAngle = DEFAULT_ANGLE;

myHeld = noone;

//Initialize inventory.
inventory = [];
equipIndex = 0;