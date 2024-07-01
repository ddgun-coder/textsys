/// @description Insert description here
// You can write your code in this editor
to_x = 0;
to_y = 0;
time = 0;
hp = m_hp;
mercy = 0;
disappear = false;

spr_origin = sprite_index;
animation_delay = 0;

function link_set(ids) {
	var size = array_length(ids);
	linked_id = noone;
	linked_ids = ds_list_create();
	var idd;
	for (var i = 0; i < size; i++) {
		idd = ids[i];
		idd.set_number = i;
		ds_list_add(linked_ids, idd);
		if (idd == id) continue;
		idd.linked_id = id;
	}
}

function be_attaked() {
	image_index = 0;
	sprite_index = Battaked_spr;
	animation_delay = 240;
	image_speed = 1;
}

function attack() {
	show_debug_message(object_get_name(id) + " attack()이 비어있음")
};
function say() {
	show_debug_message(object_get_name(id) + " say()가 비어있음")
};
function event() {
	instance_create_depth(0, 0, depth, obj_event_abs);
};