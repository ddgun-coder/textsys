/// @description Insert description here
// You can write your code in this editor
depth = 99999;
line_queue = ds_queue_create();

pre_height = 0;
sub_say = "";
text_color = c_white;
font_scale = 1;
font_x = 0;
font_y = 0;
max_size = 0;
draw_spr = noone;
back = false;
out = false;
clear = false;
curve_position = 0;
go_up = false;
my_say = "";
draw_say = "";
draw_say_num = 0;
face_index = spr_face_normal;
alarm[0] = 3;
answer_array = array_create(10, "");
sound = snd_main_txt;

choices = array_create(4, "");
in_choice = false;
choice_num = 0;
choice_this = 0;
npc_id = noone;
in_event = false;

max_font_x = 0;

text_surface = surface_create(1366, 256);

function surface_clear() {
	pre_height = 0;
	font_x = 0;
	font_y = 0;
	sub_say = "";
	max_size = 0;
	surface_set_target(text_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	instance_destroy(obj_text_abs);
}

function digit_to_num(str) {
	var str1 = string_char_at(str, 1);
	var str2 = string_char_at(str, 2);
	if (ord(str1) > 64 and ord(str1) < 71) {
		str1 = ord(str1) - 55;	
	}
	else {
		str1 = real(str1);
	}
	
	if (ord(str2) > 64 and ord(str2) < 71) {
		str2 = ord(str2) - 55;	
	}
	else {
		str2 = real(str2);
	}
	return str1 * 16 + str2;
}

function set_font_var(num) {
	var ret;
	switch (string_char_at(my_say, num + 1)) {
		case "$" :
			var r = digit_to_num(string_copy(my_say, num + 2, 2));
			var g = digit_to_num(string_copy(my_say, num + 4, 2));
			var b = digit_to_num(string_copy(my_say, num + 6, 2));
			text_color = make_color_rgb(r, g, b);
			ret = 8;
			at_string = string_char_at(my_say, num + 8);
		break;
		case "@" :
			for (var i = 1; i < string_length(my_say); i++) {
				if (string_char_at(my_say, num + i + 1) == "|") {
					font_scale = real(string_copy(my_say, num + 2, i - 1));
					break;
				}
			}
			ret = i + 2;
			at_string = string_char_at(my_say, num + 2 + i);
		break;
		case "#" :
			if (draw_spr != noone) {
				surface_set_target(text_surface);
				draw_sprite(draw_spr, 0, font_x, font_y);
				font_x += sprite_get_width(draw_spr);
				show_debug_message(sprite_get_width(draw_spr))
				max_size = max(max_size, sprite_get_height(draw_spr) / string_height(sub_say));
				
				draw_spr = noone;
				surface_reset_target();
			}
			for (var i = 1; i < string_length(my_say); i++) {
				if (string_char_at(my_say, num + i + 1) == "|") {
					draw_spr = asset_get_index(string_copy(my_say, num + 2, i - 1));
					break;
				}
			}
			ret = i + 2;
			back = true;
			at_string = string_char_at(my_say, num + 2 + i);
		break;
		case "%" :
			for (var i = 1; i < string_length(my_say); i++) {
				if (string_char_at(my_say, num + i + 1) == "|") {
					var index = asset_get_index(string_copy(my_say, num + 2, i - 1));
					instance_create_depth(x + font_x + 150, y + font_y, depth - 1, index);
					font_x += index.width;
					break;
				}
			}
			ret = i + 2;
			out = true;
			at_string = string_char_at(my_say, num + 2 + i);
			max_size = max(max_size, index.height / string_height(sub_say));
		break;
	}
	return ret;
}

function surface_add(num) {
	var ret = 0;
	if (my_say == "|") return ret;
	at_string = string_char_at(my_say, num);

	while (at_string == "|") {
		ret += set_font_var(num + ret);
	}
	if (back) {
		back = false;
		ret -= 1;
	}
	if (out) {
		out = false;
		return ret - 1;	
	}
	
	draw_say += at_string
	sub_say += at_string;
	var sh = string_height(draw_say)
	if (pre_height == 0) pre_height = sh;
	if (pre_height != sh) {
		sub_say = at_string;
		pre_height = sh;
		font_x = 0;
		font_y += string_height(sub_say) * max_size;
		max_size = 0;
	}
	if (at_string == " ") {
		font_x += string_width(at_string) * font_scale;
		return ret;
	}

	max_size = max(max_size, font_scale);
	
	draw_set_color(text_color);
	surface_set_target(text_surface);
	draw_set_font(Font1);
	if (draw_spr != noone) {
		draw_sprite(draw_spr, 0, font_x, font_y);
		font_x += sprite_get_width(draw_spr);
		show_debug_message(sprite_get_width(draw_spr))
		max_size = max(max_size, sprite_get_height(draw_spr) / string_height(sub_say));
		
		draw_spr = noone;
		surface_reset_target();
		draw_set_color(c_white);

		return ret;
	}
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_text_transformed(font_x, font_y + string_height(sub_say) * (max_size - font_scale) / 2, at_string, font_scale, font_scale, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_set_color(c_white);
	
	font_x += string_width(at_string) * font_scale;
	max_font_x = max(max_font_x, font_x);
	return ret;
}

function dequeue(q) {
	var dq = ds_queue_dequeue(q);
	switch(asset_get_type(dq)) {
		case asset_sprite :
			face_index = asset_get_index(dq);
			if (!ds_queue_empty(q)) dequeue(q);
		break;
		case asset_sound :
			sound = asset_get_index(dq);
			if (!ds_queue_empty(q)) dequeue(q);
		break;
		default :
			if (dq == "|") {
				choice_num = 0;
				choice_this = 0;
				var tq = ds_queue_dequeue(q);
				array_copy(answer_array, 0, tq, 0, array_length(tq));
 				while(!ds_queue_empty(q)) {
					choices[choice_num] = ds_queue_dequeue(q);
					choice_num++;
				}
				in_choice = true;
			}
			else if (dq == ":") {
				timeline_index = ds_queue_dequeue(q);
				timeline_running = true;
				timeline_position = 0;
				in_event = true;
			}
			my_say = dq;
			alarm[0] = 5;
			draw_say = "";
			draw_say_num = 0;
		break;
	}
}