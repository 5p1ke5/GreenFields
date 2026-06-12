/// @function transition_initialize(_roomTo, _spawnX, _spawnY, _spawnHsp = 0, _spawnVsp = 0)
/// @description Initializes variables for a room transition.
/// @param _roomTo Index of the room the player will be sent to.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _spawnHsp hsp the player will be spawned with.
/// @param _spawnVsp vsp the player will be spawned with.
function transition_initialize(_roomTo, _spawnX, _spawnY, _spawnHsp = 0, _spawnVsp = 0)
{
	roomTo = _roomTo;
	spawnX = _spawnX;
	spawnY = _spawnY;
	spawnHsp = _spawnHsp;
	spawnVsp = _spawnVsp;
}

/// @function transition_goto(_roomTo, _spawnX, _spawnY, _spawnHsp, _spawnVsp)
/// @param _roomTo Index of the room the player will be sent to.
/// @description Saves variables to global, sends player to next room.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _spawnHsp hsp the player will be spawned with
/// @param _spawnVsp vsp the player will be spawned with
function transition_goto(_roomTo, _spawnX, _spawnY, _spawnHsp = 0, _spawnVsp = 0)
{
	global.spawnX = _spawnX;
	global.spawnY = _spawnY;
	global.spawnHsp = _spawnHsp;
	global.spawnVsp = _spawnVsp;
	room_goto(_roomTo);
}