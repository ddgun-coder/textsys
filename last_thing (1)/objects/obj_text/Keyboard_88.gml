/// @description Insert description here
// You can write your code in this editor
if (visible) {
	if (draw_say_num != string_length(my_say)) {
		draw_say_num = string_length(my_say);
		
		surface_clear();
		for (var i = 0; i < draw_say_num; i++) {
			i += surface_add(i + 1);	
		}
	}
}