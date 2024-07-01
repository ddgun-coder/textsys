/// @description Insert description here
// You can write your code in this editor
if (in_event) exit;
if (room == room_battle) {
	sprite_index = spr_textbox2;
}
else {
	sprite_index = spr_textbox;
}
if (!surface_exists(text_surface)) {
	text_surface = surface_create(1366, 256);
	pre_height = 0;
	sub_say = "";
	draw_say = "";
	font_x = 0;
	font_y = 0;
	max_size = 0;
	instance_destroy(obj_text_abs);
	for (var i = 0; i < draw_say_num; i++) {
		i += surface_add(i + 1);	
	}
}
else {
	draw_self();
}
if (clear) exit;
if (in_choice) {
	for (var i = 0; i < choice_num; i++) {
		if (i == choice_this) {
			draw_set_color(c_yellow);
		}
		draw_text_ext(x + 50 + i * 1000 / choice_num, y, choices[i], 30, 300);
		draw_set_color(c_white);
		draw_sprite(spr_pointer, 0, x + 50 + choice_this * 1000 / choice_num, y + 100);
	}
}
else {
	if (face_index == spr_noone) {
		draw_surface(text_surface, x + 50, y);
	}
	else {
		draw_surface(text_surface, x + 150, y);
		//draw_text(x + 150, y + 150, draw_say);
		draw_sprite(face_index, 0, x + 10, y + 10);
	}
	if (alarm[0] == -1) {
		draw_sprite(spr_next_text, 0, x + 700, y + 220);
	}
}
//draw_line(font_x + 150, 0, font_x + 150, 768);
//draw_line(0, font_y + y, 1366, font_y + y);