/// @description Insert description here
// You can write your code in this editor
if (say_check) {
	if (instance_number(obj_say) == 0) {
		say_check = false;
		enemy_next_act();
	}
}
if (attack_check) {
	if (instance_number(obj_attack_abs) == 0) {
		attack_check = false;
		instance_destroy(obj_heart);
		obj_sty.rev_spin = true;
		alarm[0] = 120;
	}
}
if (event_check) {
	if (instance_number(obj_event_abs) == 0) {
		event_check = false;
		enemy_next_act();
	}
}