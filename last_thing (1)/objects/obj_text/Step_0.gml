/// @description Insert description here
// You can write your code in this editor
if (go_up) {
	var channel = animcurve_get_channel(textbox_curve, 0);
	var pos = animcurve_channel_evaluate(channel, curve_position);
	curve_position += 0.02;
	y = ystart - (pos * 400) + 56;
	if (curve_position >= 1) {
		curve_position = 0;
		clear = false;
		go_up = false;
	}
}
if (in_choice) {
	if (keyboard_check_pressed(ord("A"))) {
		if (choice_this > 0) {
			choice_this--;
		}
	}
	if (keyboard_check_pressed(ord("D"))) {
		if (choice_this < choice_num - 1) {
			choice_this++;
		}
	}
}
if (in_event) {
	if (timeline_position >= timeline_max_moment(timeline_index)) {
		in_event = false;
		if (!ds_queue_empty(line_queue)) {
			dequeue(line_queue);
		}
		else {
			visible = false;	
		}
	}
}