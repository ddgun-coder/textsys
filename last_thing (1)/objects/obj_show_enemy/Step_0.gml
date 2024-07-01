/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_up)) {
	if (cur_position > 0) {
		for (var i = 1; i < size; i++) {
			sub_num = cur_position - i;
			if (sub_num < 0) {
				sub_num = cur_position;
				break;
			}
			if (global.enemy_list[| sub_num] != noone) {
				break;
			}
		}
		cur_position = sub_num;	
	}
}

if (keyboard_check_pressed(vk_down)) {
	if (cur_position < size - 1) {
		for (var i = 1; i < size; i++) {
			sub_num = cur_position + i;
			if  (cur_position > size - 1) {
				sub_num = cur_position;
				break;
			}
			if (global.enemy_list[| sub_num] != noone) {
				break;
			}
		}
		cur_position = sub_num;
	}
}