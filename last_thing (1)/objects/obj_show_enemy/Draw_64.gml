/// @description Insert description here
// You can write your code in this editor
var size = ds_list_size(global.enemy_list);
var hp_gap = 150;
for (var i = 0; i < size; i++) {
	var idd = global.enemy_list[| i];
	if (idd == noone) continue;
	var draw_y = y + 64 * i;
	
	draw_set_font(font_25);
	draw_text(x, draw_y, idd.name);
	draw_set_font(global.num_font);
	
	draw_sprite(spr_hp_bar, 0, x + 800, draw_y);
	draw_sprite_part(spr_hp_bar, 1, 0, 0, 128 * (idd.hp / idd.m_hp), 20, x + 800, draw_y);
	draw_text(x + 800, draw_y, string(floor(idd.hp/ idd.m_hp * 100)) + "%");
	
	draw_sprite(spr_hp_bar, 2, x + 800 + hp_gap, draw_y);
	draw_sprite_part(spr_hp_bar, 3, 0, 0, 128 * (idd.mercy / idd.m_mercy), 20, x + 800 + hp_gap, draw_y);
	draw_set_color(c_maroon);
	draw_text(x + 800 + hp_gap, draw_y, string(floor(idd.mercy/ idd.m_mercy * 100)) + "%");
	draw_set_color(c_white);
	
	if (i == cur_position) {
		draw_sprite(spr_heart, 0, x - 64, draw_y);	
	}
}
draw_sprite(spr_hp_bar, 4, x + 800, y - 32);
draw_sprite(spr_hp_bar, 5, x + 800 + hp_gap, y - 32);

draw_set_font(Font1);
