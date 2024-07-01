/// @description Insert description here
// You can write your code in this editor
if (room == room_battle) {
	var dx;
	var dy;
	with(obj_area) {
		if (index == 3 + other.set_number) {
			dx = x;
			dy = y;
		}
	}
	to_x = (dx - x) / 60;
	to_y = (dy - y) / 60;
	time = 60;
}