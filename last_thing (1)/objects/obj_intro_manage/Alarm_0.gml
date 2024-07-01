/// @description Insert description here
// You can write your code in this editor
if (draw_say_num < string_length(my_say)) {
	alarm[0] = 10;
	draw_say_num++;
	var at_string = string_char_at(my_say, draw_say_num);
	draw_say += at_string
	if (at_string != " ") {
		audio_play_sound(snd_main_txt, 1, false);
	}
}
else {
	alarm[1] = 60;	
}