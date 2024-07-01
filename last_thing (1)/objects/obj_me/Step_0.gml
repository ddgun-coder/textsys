 /// @description Insert description here
// You can write your code in this editor
if (zoom_out) {
	zoom_out_val += 1 / 60;
	camera_set_view_size(view_camera[0], 1366 * zoom_out_val, 768 * zoom_out_val);
	camera_set_view_pos(view_camera[0], (1 - zoom_out_val) / 2 * 1366,(1 - zoom_out_val) / 2 * 768)
	if (zoom_out_val >= 1) {
		zoom_out = false;
		camera_set_view_size(view_camera[0], 1366, 768);
		camera_set_view_pos(view_camera[0], 0, 0);
	}
}

if (time > 0) {
	if (time % 2) {
		var surface = surface_create(64, 64);
		surface_set_target(surface);
		draw_sprite(sprite_index, image_index, 0, 0);
		surface_reset_target();
		var size = array_length(surface_array)
		if (size < ARRAY_SIZE) {
			array_push(surface_array, surface);
			x_array[size] = x;
			y_array[size] = y;
		}
		else {
			surface_free(surface_array[0]);
			for (var i = 0; i < ARRAY_SIZE - 1; i++) {
				surface_array[i] = surface_array[i + 1];
				x_array[i] = x_array[i + 1];
				y_array[i] = y_array[i + 1];
			}
			surface_array[ARRAY_SIZE - 1] = surface;
			x_array[ARRAY_SIZE - 1] = x;
			y_array[ARRAY_SIZE - 1] = y;
		}
	}
	
	x += to_x;
	y += to_y;
	time--;
	if (time == 0) {
		sprite_index = spr_me;
		obj_text.go_up = true;
		obj_char_UI_back.go_up = true;
		with(obj_char_UI) {
			go_up = true;
			if (index == 0) go_up_sub = true;
		}
	}
}
else {
	if (afterimage) {
		surface_free(surface_array[0]);
		var size = array_length(surface_array);
		for (var i = 0; i < size - 1; i++) {
			surface_array[i] = surface_array[i + 1];
			x_array[i] = x_array[i + 1];
			y_array[i] = y_array[i + 1];
		}
		array_pop(surface_array);
		if (size == 1) afterimage = false;
	}
}
if (room == room_battle) {
	if (sprite_index == spr_attack and round(image_index) == sprite_get_number(spr_attack)) {
		image_speed = 0;
		animation_delay--;
		if (animation_delay <= 0) {
			image_speed = 1;
			sprite_index = spr_me;	
		}
	}
}
else if (!obj_text.visible) {
	var step_speed = 0;
	if (keyboard_check(vk_shift)) {
		step_speed = 6;
	}
	else {
		step_speed = 3;
	}
	
	if (keyboard_check(ord("A"))) {
		x -= step_speed;
		image_index = 2;
		my_direction = 180;
	}
	if (keyboard_check(ord("D"))) {
		x += step_speed;
		image_index = 1;
		my_direction = 0;
	}
	if (keyboard_check(ord("W"))) {
		y -= step_speed;
		image_index = 3;
		my_direction = 90;
	}
	if (keyboard_check(ord("S"))) {
		y += step_speed;
		image_index = 0;
		my_direction = 270;
	}
	if (keyboard_check(ord("L"))) {
		var _x, _y;
		go_x = x + lengthdir_x(30, my_direction);
		go_y = y + lengthdir_y(30, my_direction);
		var idd = collision_point(go_x, go_y, all, true, true);
		show_debug_message(idd);
		if (idd != noone) {
			var check = idd.object_index;
			var parent = object_get_parent(idd.object_index);
			if (parent != -100) {
				check = parent;
			}
			switch(check) {
				case obj_sign :
					with(obj_text) {
						ds_queue_enqueue(line_queue, idd.my_text);
						visible = true;
						dequeue(line_queue);
					}
				break;
				case obj_npc_abs :
					with(obj_text) {
						var real_count = 0;
						var al = array_length(idd.line_queue)
						if (al <= idd.count) {
							real_count = al - 1;
						}
						else {
							real_count = idd.count;	
						}
						ds_queue_copy(line_queue, idd.get_line(real_count));
						idd.count++;
						global.count_map[? idd] = idd.count;
						npc_id = idd;
						visible = true;
						dequeue(line_queue);
					}
				break;
			}
		}
	}
}