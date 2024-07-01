/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.dmg_font);
draw_set_valign(fa_bottom);
draw_set_alpha(image_alpha);
draw_text_transformed(x, y, num, 1, image_yscale, 0);
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_font(Font1);
