/// @description Insert description here
// You can write your code in this editor
if (!visible) exit;
if (in_choice) {
	ds_queue_copy(line_queue, npc_id.get_line(choice_this, answer_array));
	dequeue(line_queue);
	in_choice = false;
	instance_destroy(obj_text_abs);
}
else {
	if (alarm[0] == -1 and in_event == false) {
		max_font_x = 0;
		if (!ds_queue_empty(line_queue)) {
			dequeue(line_queue);
			surface_clear();
		}
		else {
			instance_destroy();
		}
	}
}