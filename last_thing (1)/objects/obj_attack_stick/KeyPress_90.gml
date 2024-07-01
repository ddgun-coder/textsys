/// @description Insert description here
// You can write your code in this editor
if (disappear or disappear_fail) exit;
var dx = abs(x - obj_attack_UI.x - 8);
var enemy_id = global.enemy_list[| to]
if (enemy_id == noone) {
	disappear = true;
	afterimage = false;
	exit;	
}
var normal_dmg = floor((256 - dx) * global.my_char[| from].strength / 100) + irandom(10);

if (dx > 256) {
	
}
else if (dx > 15) {
	disappear = true;
	afterimage = false;
	
	enemy_id.hp -= normal_dmg;
	var idd = instance_create_depth(enemy_id.x, enemy_id.y, depth, obj_dmg);
	idd.num = normal_dmg;
	
	enemy_id.be_attaked();
	attack_con();
}
else {
	disappear = true;
	afterimage = false;
	image_blend = c_yellow;
	normal_dmg = floor(normal_dmg * 1.5);
	
	enemy_id.hp -= normal_dmg;
	var idd = instance_create_depth(enemy_id.x, enemy_id.y, depth, obj_dmg);
	idd.num = normal_dmg;
	
	enemy_id.be_attaked();
	attack_con();
}
