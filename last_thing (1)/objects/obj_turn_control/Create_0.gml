/// @description Insert description here
// You can write your code in this editor
size = ds_list_size(global.my_char);
for (var i = 0; i < size; i++) {
	my_count[i] = false;		
}
cur_char = 0;
battle_state = array_create(size, -1);
phase = -1;

say_check = false;
attack_check = false;
event_check = false;

turn_end = false;

function init() {
	for (var i = 0; i < size; i++) {
		my_count[i] = false;
		battle_state[i] = -1;
	}
	cur_char = 0;
}

function start_game_txt() {
	with(obj_text) {
		ds_queue_enqueue(line_queue, "전투시작!");
		visible = true;
		dequeue(line_queue);
	}
}

function result() {
	with(obj_text) {
		ds_queue_enqueue(line_queue, "전투끝!보상 : 없지롱");
		visible = true;
		dequeue(line_queue);
	}
}
function end_game() {
	if (turn_end) return;
	turn_end = true;
	alarm[1] = 300;
};

function next_char(_index) {
	my_count[_index] = true;
	instance_destroy(obj_stick_left);	
	instance_destroy(obj_stick_right);	
	with(obj_char_UI) {
		if (index == _index) go_down = true;
	}
	for (var i = 0; i < size; i++) {
		if (my_count[i] == false) {
			cur_char = i;
			
			with(obj_char_UI) {
				if (index == i) {
					go_up_sub = true;
				}
				else {
					go_up_sub = false;
				}
			}
			return;
		}
	}
	
	with(obj_char_UI) {
		go_up_sub = false;
	}
	cur_char = -1;
	
	phase = -1;
	next_act();
}

function next_act() {
	var a = [attack, item, magic, act, mercy];
	if (phase < 4) {
		phase++;
	}
	else {
		show_debug_message("turn_end!");
		phase = -1;
		enemy_next_act();
		return;
	}
	a[phase]();
}

function enemy_next_act() {
	var a = [enemy_say, enemy_attack, enemy_event];
	if (phase < 2) {
		phase++;
	}
	else {
		show_debug_message("enemy_turn_end!");
		phase = -1;
		init();
		with(obj_char_UI) {
			init();
		}
		return;
	}
	a[phase]();
}

function enemy_say() {
	if (instance_number(obj_enemy_abs) > 0) {
		with(obj_enemy_abs) {
			say();	
		}
	}
	say_check = true;
}

function enemy_attack() {
	instance_create_depth(683, 300, depth, obj_heart);
	instance_create_depth(683, 300, depth, obj_sty);
	if (instance_number(obj_enemy_abs) > 0) {
		with(obj_enemy_abs) {
			attack();
		}
	}
	attack_check = true;
}

function enemy_event() {
	if (instance_number(obj_enemy_abs) > 0) {
		with(obj_enemy_abs) {
			event();
		}
	}
	event_check = true;
}

function attack() {
	var check = false;
	for (var i = 0; i < size; i++) {
		if (battle_state[i].act == 0) {
			obj_attack_UI.view_array[i] = true;
			check = true;
		}
	}
	if (check) {
		obj_attack_UI.visible = true;
		obj_attack_UI.init_attack();
	}
	else {
		next_act();	
	}
}

function act() {
	if (turn_end) return;
	var check = false;
	for (var i = 0; i < size; i++) {
		if (battle_state[i].act == 1) {
		
			check = true;
		}
	}
	if (check) {
		
	}
	else {
		next_act();	
	}
}

function item() {
	var check = false;
	for (var i = 0; i < size; i++) {
		if (battle_state[i].act == 2) {

			check = true;
		}
	}
	if (check) {
		
	}
	else {
		next_act();	
	}
}

function magic() {
	var check = false;
	for (var i = 0; i < size; i++) {
		if (battle_state[i].act == 3) {

			check = true;
		}
	}
	if (check) {
		
	}
	else {
		next_act();	
	}
}

function mercy() {
	var check = false;
	for (var i = 0; i < size; i++) {
		if (battle_state[i].act == 4) {

			check = true;
		}
	}
	if (check) {
		
	}
	else {
		next_act();	
	}
}	

start_game_txt();