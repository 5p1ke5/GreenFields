/// @desc Initialize variables
view_enabled = true;

view_visible[0] = true;

view_xport[0] =	0;
view_yport[0] = 0;
width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 640, 640);
