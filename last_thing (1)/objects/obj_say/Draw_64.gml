/// @description Insert description here
// You can write your code in this editor
if (in_event) exit;
image_xscale = (max_font_x + font_get_size(Font1) * max_size + 32) / 64;
image_yscale = (font_y + font_get_size(Font1) * max_size + 32) / 64;

x = xstart - max_font_x;

draw_self();
if (!surface_exists(text_surface)) {
	text_surface = surface_create(1366, 256);
	pre_height = 0;
	sub_say = "";
	draw_say = "";
	font_x = 0;
	font_y = 0;
	max_size = 0;
	instance_destroy(obj_text_abs);
	for (var i = 0; i < draw_say_num; i++) {
		i += surface_add(i + 1);	
	}
}
draw_surface(text_surface, x + 16, y + 16);