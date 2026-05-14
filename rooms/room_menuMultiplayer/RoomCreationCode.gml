///@ desc if you came to the main menu assumes that your network connection is being shut down.

network_destroy(global.socketSelf);
network_destroy(global.socketOther);