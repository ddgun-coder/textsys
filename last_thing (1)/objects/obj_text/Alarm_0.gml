/// @description Insert description here
// You can write your code in this editor
if (clear) {
	alarm[0] = 1;
	exit;
}
if (draw_say_num < string_length(my_say)) {
	alarm[0] = 3;
	draw_say_num++;
	draw_say_num += surface_add(draw_say_num);
	
	if (at_string != " ") {
		if (sound != noone) {
			audio_play_sound(sound, 1, false);	
		}
	}
}