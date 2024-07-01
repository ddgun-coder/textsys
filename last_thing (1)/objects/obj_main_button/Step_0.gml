/// @description Insert description here
// You can write your code in this editor
if (idd.part >= 1 and curve_position < 1) {
	curve_position += 1 / 120;		
}

var channel_y = animcurve_get_channel(dmg_bounse, 0);
var pos_y = animcurve_channel_evaluate(channel_y, curve_position);

image_xscale = -pos_y;
image_yscale = -pos_y;

if (zooming) {
	zoom_in_val -= 1 / 90;
	camera_set_view_size(view_camera[0], 1366 * zoom_in_val, 768 * zoom_in_val);
	camera_set_view_pos(view_camera[0], (1 - zoom_in_val) / 2 * 1366,(1 - zoom_in_val) / 2 * 768)
	if (zoom_in_val <= 0) room_goto(Room3);
}