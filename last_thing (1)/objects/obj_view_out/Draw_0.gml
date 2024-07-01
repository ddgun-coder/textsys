/// @description Insert description here
// You can write your code in this editor
if (surface_exists(global.pre_view)) {
	draw_set_alpha(image_alpha);
	draw_surface(global.pre_view, 0, 0);
	draw_set_alpha(1);
}