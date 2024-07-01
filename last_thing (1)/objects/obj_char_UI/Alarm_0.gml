/// @description Insert description here
// You can write your code in this editor
alarm[0] = 20;
if (obj_turn_control.cur_char == index) {
	if (!go_up_sub) {
		var l = instance_create_depth(x, y + 64, depth - 1, obj_stick_right);	
		var r = instance_create_depth(x + 375, y + 64, depth - 1, obj_stick_left);
		l.image_index = index;
		r.image_index = index;
	}
}