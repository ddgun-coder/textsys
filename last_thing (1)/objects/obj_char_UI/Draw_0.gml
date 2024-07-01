/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_sprite(spr_UI, image_index, x, y);
if (obj_turn_control.cur_char == index) {
	draw_sprite(spr_char_title, image_index, x, y + y_offset);
	draw_sprite(spr_char_title, image_index, x, y + 61 + y_offset);
}

