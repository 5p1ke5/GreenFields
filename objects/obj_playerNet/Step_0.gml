/// @desc Does player things, sends the player's keyboard input and other info in a packet.
event_inherited();


var _buffer = buffer_create(256, buffer_grow, 1);

buffer_seek(_buffer, buffer_seek_start, 0);
buffer_write(_buffer, buffer_bool, A_BUTTON_PRESSED);
buffer_write(_buffer, buffer_bool, A_BUTTON);
buffer_write(_buffer, buffer_bool, RIGHT_BUTTON);
buffer_write(_buffer, buffer_bool, LEFT_BUTTON);
buffer_write(_buffer, buffer_bool, X_BUTTON);
buffer_write(_buffer, buffer_bool, MOUSE_LEFT_BUTTON);
buffer_write(_buffer, buffer_bool, MOUSE_RIGHT_BUTTON);
buffer_write(_buffer, buffer_bool, MOUSE_LEFT_BUTTON_RELEASED);
buffer_write(_buffer, buffer_bool, MOUSE_RIGHT_BUTTON_RELEASED);
buffer_write(_buffer, buffer_bool, UP_BUTTON_RELEASED);
buffer_write(_buffer, buffer_bool, DOWN_BUTTON_RELEASED);
buffer_write(_buffer, buffer_s16, mouse_x);
buffer_write(_buffer, buffer_s16, mouse_y);

//Stuff to update the sprite periodically. Maybe apply this during the end step? Only if player desyncing becomes an issue.
/*
buffer_write(_buffer, buffer_s16, x);
buffer_write(_buffer, buffer_s16, y);
etc...Basically other variables abs_doll has
*/

network_send_packet(global.socketOther, _buffer, buffer_tell(_buffer))

buffer_delete(_buffer);