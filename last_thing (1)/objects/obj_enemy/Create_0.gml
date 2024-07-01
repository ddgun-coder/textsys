/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
name = "enemy";
hp = 1;
function attack() {
	switch(instance_number(id)) {
		case 0:
			attack_start(obj_enemy_attack1);
		break;
		case 1:
			attack_start(obj_enemy_attack1);
		break;
		case 2:
			attack_start(obj_enemy_attack1);
		break;
	}
	if (instance_exists(id)) {
		attack_start(obj_enemy_attack1);
	}
}

function say() {
	var idd = instance_create_depth(x - 50, y, depth, obj_say);
	
	var say_array = ["아닌데", "어쩌라고", "i am error"];
	var random_num = irandom(array_length(say_array) - 1);
	
	with(idd) {
		ds_queue_enqueue(line_queue , say_array[random_num]);
		dequeue(line_queue);
	}
}