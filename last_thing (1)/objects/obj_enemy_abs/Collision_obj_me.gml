/// @description Insert description here
// You can write your code in this editor
if (room == room_battle) exit;

if (!surface_exists(global.pre_view)) {
	global.pre_view = surface_create(1366, 768);
}
view_surface_id[0] = global.pre_view;
global.pre_room = room;
persistent = true;

if (alarm[0] == -1) {
	other.sprite_index = spr_char_attack1;
	other.image_speed = 1;
	other.image_index = 0;
	alarm[0] = 1;
	if (variable_instance_exists(id, "linked_id")) {
		if (ds_exists(global.enemy_list, ds_type_list)) {
			ds_list_destroy(global.enemy_list);
		}
		if (linked_id == noone) {
			global.enemy_list = linked_ids;
		}
		else {
			global.enemy_list = linked_id.linked_ids;
		}
		var size = ds_list_size(global.enemy_list);
		for (var i = 0; i < size; i++) {
			global.enemy_list[| i].persistent = true;
		}
	}
}