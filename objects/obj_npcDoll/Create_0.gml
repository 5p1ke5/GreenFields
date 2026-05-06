/// @description Initializes doll things. The firt two should be overwritten in creation code or by children.
npc_initialize("Error", "Hello world!");
doll_initialize(0, 0, 0, 0, 0, c_white, c_white, c_white, c_white, c_white);

phys_initialize(0.2, 0.2);

myCarry = noone;