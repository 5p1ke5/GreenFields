/// @desc On room start sets room_persistent as false
room_persistent = false;

//Updates player equipment.
inventory = global.playerEquip;
inventory[equipIndex].Equip(self);