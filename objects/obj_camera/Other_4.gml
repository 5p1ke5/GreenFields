view_enabled = true;
view_visible[0] = true;
view_xport[0] =	0;
view_yport[0] = 0;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, 640, 640);


width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);
mousePreviousX = device_mouse_raw_x(0);
mousePreviousY = device_mouse_raw_y(0);

xOffset = - (camera_get_view_width(view_camera[0]) / 2)
yOffset = - (camera_get_view_height(view_camera[0]) * 7 / 10)