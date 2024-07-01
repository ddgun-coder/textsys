 /// @description Insert description here
// You can write your code in this editor
curve_position = 0;
go_up = false;
go_up_sub = false;
image_speed = 0;

cur_button = 0;
go_down = false;
spr_UI = spr_char_UI;

y_offset = 0;

if (index < ds_list_size(global.my_char)) {
	image_index = global.my_char[| index].UI_index;
}
else {
	visible = false;	
}
alarm[0] = 20;


function init() {
	curve_position = 0;
	go_up_sub = false;
	cur_button = 0;
	go_down = false;
	spr_UI = spr_char_UI;
	y_offset = 0;
	if (index == 0) go_up_sub = true;
}

function act_sub(_act, _sub, _who) constructor {
	act = _act;
	sub = _sub;
	who = _who;
}