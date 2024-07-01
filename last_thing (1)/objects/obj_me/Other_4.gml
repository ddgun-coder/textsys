/// @description Insert description here
// You can write your code in this editor
view_set_visible(view_camera[0], true);
camera_set_view_target(view_camera[0], id);
camera_set_view_border(view_camera[0], 400, 384);
view_enabled = true;

if (room == room_battle) {
	var dx;
	var dy;
	with(obj_area) {
		if (index == 0) {
			dx = x;	
			dy = y;	
		}
	}
	to_x = (dx - x) / 60;
	to_y = (dy - y) / 60;
	afterimage = true;
	time = 60;
	
	with(obj_follow) {
		with(obj_area) {
			if (index == other.number) {
				dx = x;	
				dy = y;	
			}
		}
		to_x = (dx - x) / 60;
		to_y = (dy - y) / 60;
		afterimage = true;
		time = 60;
	}
}

check_follow();
if (global.is_first) {
	global.is_first = false;
	zoom_out = true;
	camera_set_view_size(view_camera[0], 0, 0);
}