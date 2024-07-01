/// @description Insert description here
// You can write your code in this editor
var dir = point_direction(x, y, follow_id.x, follow_id.y);
if (distance_to_object(follow_id) > 10 and room != room_battle) {
	var dis = floor(point_distance(x, y, follow_id.x, follow_id.y) * 0.1);
	x += lengthdir_x(dis, dir);
	y += lengthdir_y(dis, dir);
}

if (room == room_battle) {
	if (sprite_index == spr_attack and round(image_index) == sprite_get_number(global.my_char[| number].sprites.attack_spr)) {
		image_speed = 0;
		animation_delay--;
		if (animation_delay <= 0) {
			image_speed = 1;
			sprite_index = global.my_char[| number].sprites.ready_spr;	
		}
	}
}
else {
	image_index = floor((dir + 45) / 90);
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
		sprite_index = global.my_char[| number].sprites.normal_spr;
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