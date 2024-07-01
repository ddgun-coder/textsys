/// @description Insert description here
// You can write your code in this editor
if (invin != 0) exit;
var idd;
var n = ds_list_size(global.my_char);
switch(other.who) {
	case dmg.to_all :
		for (var i = 0; i < n; i++) {
			idd = global.my_char[| i];
			damagef(idd, other.damage);
		}
	break;
	case dmg.to_1 :
		idd = global.my_char[| 0];
		damagef(idd, other.damage);
	break;
	case dmg.to_2 :
		idd = global.my_char[| 1];
		damagef(idd, other.damage);
	break;
	case dmg.to_3 :
		idd = global.my_char[| 2];
		damagef(idd, other.damage);
	break;
	case dmg.rand :
		var seq_list = ds_list_create();
		for (var i = 0; i < n; i++) {
			seq_list[| i] = i;
		}
		for (var i = 0; i < n; i++) {
			var r = irandom(n - 1 - i)
			var rand_index = seq_list[| r];
			ds_list_delete(seq_list, r);
			idd = global.my_char[| rand_index]
			if (idd.live == true) {
				idd.hp -= other.damage;
				
				var dmg_id = instance_create_depth(idd.conneted_id.x, idd.conneted_id.y, depth, obj_dmg);
				dmg_id.num = other.damage;
				invin = 30;
				break;
			}
		}
		ds_list_destroy(seq_list);
	break;
}

for (var i = 0; i < n; i++) {
	idd = global.my_char[| i];
	if (idd.hp <= 0) {
		idd.live = false;	
	}
}