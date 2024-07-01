/// @description Insert description here
// You can write your code in this editor
function init_choice() {
	var n = 0;
	for (var i = 0; i < size; i++) {
		if (global.enemy_list[| i] != noone) {
			break;
		}
		n++;
	}
	if (n == size) return;
	cur_position = n;
	visible = true;
}

size = ds_list_size(global.enemy_list)
cur_position = 0;
sub_num = 0;