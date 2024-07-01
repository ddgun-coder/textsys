/// @description Insert description here
// You can write your code in this editor
if (time > 0) {
	if (time % 4 == 0) {
		var surface = surface_create(8, 64);
		surface_set_target(surface);
		draw_sprite(sprite_index, image_index, 4, 32);
		surface_reset_target();
		var size = array_length(surface_array)
		if (size < array_size) {
			array_push(surface_array, surface);
			x_array[size] = x;
			y_array[size] = y;
		}
		else {
			surface_free(surface_array[0]);
			for (var i = 0; i < array_size - 1; i++) {
				surface_array[i] = surface_array[i + 1];
				x_array[i] = x_array[i + 1];
				y_array[i] = y_array[i + 1];
			}
			surface_array[array_size - 1] = surface;
			x_array[array_size - 1] = x;
			y_array[array_size - 1] = y;
		}
	}
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
if (disappear) {
	image_xscale += 0.04;	
	image_yscale += 0.04;	
	image_alpha -= 0.03;
	if (image_alpha <= 0) {
		instance_destroy();	
	}
}
else if (disappear_fail) {
	image_xscale -= 0.01;
	image_yscale -= 0.01;
	image_alpha -= 0.03;
	if (image_alpha <= 0) {
		obj_me.attacking();
		var enemy_id = global.enemy_list[| to];
		var idd = instance_create_depth(enemy_id.x, enemy_id.y, depth, obj_dmg);
		idd.num = "miss";
		instance_destroy();	
	}
}
else {
	x -= 5;	
}

if (x < obj_attack_UI.x) {	
	disappear_fail = true;
	afterimage = false;
}
