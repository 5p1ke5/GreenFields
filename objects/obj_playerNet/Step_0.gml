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
buffer_write(_buffer, buffer_bool, MOUSE_RIGHT_BUTTON_RELEASED);
buffer_write(_buffer, buffer_s16, mouse_x);
buffer_write(_buffer, buffer_s16, mouse_y);

network_send_packet(global.socketClient, _buffer, buffer_tell(_buffer))

buffer_delete(_buffer);