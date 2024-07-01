/// @description Insert description here
// You can write your code in this editor
if (time > 0) {
	x += to_x;
	y += to_y;
	time--;
}

if (sprite_index == Battaked_spr and round(image_index) == sprite_get_number(Battaked_spr)) {
	image_speed = 0;
	animation_delay--;
	if (animation_delay <= 0) {
		image_speed = 1;
		sprite_index = spr_origin;	
	}
}

if (disappear) {
	image_xscale -= 0.01;
	image_yscale += 0.02;
	y += 2;
	image_alpha -= 0.01;
	if (image_alpha <= 0) instance_destroy();
}
else {
	if (hp <= 0) {
		var n = ds_list_find_index(global.enemy_list, id);
		global.enemy_list[| n] = noone;
		disappear = true;
		
		var out = true;
		for (var i = 0; i < ds_list_size(global.enemy_list); i++) {
			if (global.enemy_list[| i] != noone) {
				out = false;
			}
		}
		if (out) {
			obj_turn_control.end_game();
		}
	}	
}