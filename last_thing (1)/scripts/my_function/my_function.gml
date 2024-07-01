// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.num_font = font_add_sprite_ext(Spr_numbers, "0123456789%", true, 2);
global.dmg_font = font_add_sprite_ext(Spr_numbers_dmg, "0123456789mis", true, 2);
global.count_map = ds_map_create();
global.enemy_list = noone;

function start_battle(){
	
	room_goto(room_battle);
}

function attack_start(_obj) {
	var idd = instance_create_depth(x, y, depth, _obj);
	idd.to = id;
}

function create_share() {
	function attacking() {
		image_index = 0;
		sprite_index = sprites.attack_spr;
		animation_delay = 240;
		image_speed = 1;
	}	
}

function check_follow() {
	var size = ds_list_size(global.my_char);
	if (size == 1) return;
	
	if (size - 1 != instance_number(obj_follow)) {
		instance_destroy(obj_follow);
		var pre_id = obj_me.id;
		
		for (var i = 1; i < size; i++) {
			var idd = instance_create_depth(obj_me.x - i * 100, obj_me.y, obj_me.depth, obj_follow);	
			idd.follow_id = pre_id;
			idd.char = global.my_char[| i];
			idd.sprite_index = global.my_char[| i].sprites.normal_spr
			idd.number = i;
			idd.image_index = 0;
			idd.sprites = global.my_char[| i].sprites
			pre_id = idd;
			global.my_char[| i].conneted_id = idd;
		}
	}
	global.my_char[| 0].conneted_id = obj_me;
}
