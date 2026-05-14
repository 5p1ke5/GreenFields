/// @descr Periodically sends out updates depending on if the user has decided to rematch

var _buffer = buffer_create(8, buffer_fixed, 1);
buffer_seek(_buffer, buffer_seek_start, 0);
buffer_write(_buffer, buffer_u8, status);
network_send_packet(global.socketOther, _buffer, buffer_tell(_buffer))
buffer_delete(_buffer);