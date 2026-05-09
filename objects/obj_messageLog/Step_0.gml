
scroll += MOUSE_WHEEL_DOWN - MOUSE_WHEEL_UP;
scroll = max(0, scroll);
scroll = min(array_length(global.messageLog) - 1, scroll);