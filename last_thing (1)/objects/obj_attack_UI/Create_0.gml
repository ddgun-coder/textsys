/// @description Insert description here
// You can write your code in this editor
//instance_deactivate_object(id);
view_array = array_create(3, false);
check = false;
function init_attack() {
	var num = ds_list_size(global.my_char);
	for (var i = 0; i < num; i++) {
		if (view_array[i]) {
			var idd = instance_create_depth(x + irandom_range(1, 3) * 300, y + i * 64 + 32, depth - 1, obj_attack_stick);
			idd.from = i;
			idd.to = obj_turn_control.battle_state[i].who;
		}
	}
	check = true;
}