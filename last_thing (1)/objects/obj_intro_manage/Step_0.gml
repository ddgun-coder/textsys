/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("Z"))) {
	if (array_length(say) <= say_step) room_goto(room_main);
	alpha_up = false;
	alarm[1] = -1;
}
if (keyboard_check_pressed(ord("X"))) {
	room_goto(room_main);
}

if (alpha_up) {
	if (image_alpha < 1) image_alpha += 0.02;
}
else {
	image_alpha -= 0.03;
	if (image_alpha <= 0) {
		draw_say = "";
		my_say = say[say_step++];
		alarm[0] = 10;
		image_index += 1;
		image_alpha = 0;
		draw_say_num = 0;
		alpha_up = true;
	}
}