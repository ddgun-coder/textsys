/// @description Insert description here
// You can write your code in this editor
global.is_first = true;
global.gold = 499;
global.character = function(_level, _spr, _name, _UIindex, _sprs) constructor {
	sprite = _spr;
	name = _name;
	level = _level;
	max_hp = level * 5 + 100;
	hp = max_hp;
	char_max_exp = 100;
	char_exp = 0;
	UI_index = _UIindex;
	strength = level * 5 + 1;
	sprites = _sprs;
	live = true;
	conneted_id = noone;
}

global.char1 = new global.character(1, spr_main, "number", 0, {
	normal_spr : spr_me,
	attack_spr : spr_attack,
	ready_spr : spr_attack_ready,
	defense_spr : spr_defense,
	be_attaked_spr : spr_be_attaked,
	use_item_spr : spr_use_item
});

global.char2 = new global.character(1, spr_sans, "와샌즈", 1, {
	normal_spr : spr_me2,
	attack_spr : spr_attack2,
	ready_spr : spr_attack_ready2,
	defense_spr : spr_defense2,
	be_attaked_spr : spr_be_attaked2,
	use_item_spr : spr_use_item2
});

global.char3 = new global.character(1, spr_dota , "abcdefu", 2, {
	normal_spr : spr_me2,
	attack_spr : spr_attack2,
	ready_spr : spr_attack_ready2,
	defense_spr : spr_defense2,
	be_attaked_spr : spr_be_attaked2,
	use_item_spr : spr_use_item2
});
global.pre_room = -1;
global.pre_view = -1

global.my_char = ds_list_create();
ds_list_add(global.my_char, global.char1);
ds_list_add(global.my_char, global.char2);
ds_list_add(global.my_char, global.char3);
