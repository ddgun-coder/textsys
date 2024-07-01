/// @description Insert description here
// You can write your code in this editor
var n = ds_list_size(global.my_char);
for (var i = 0; i < n; i++) {
	if (view_array[i]) {
		draw_sprite(spr_attack_UI, global.my_char[| i].UI_index, x, y + i * 64);
		draw_sprite(spr_char_UI, global.my_char[| i].UI_index, x - 64, y + i * 64);
	}
}