/// @description Insert description here
// You can write your code in this editor
with(obj_char_UI) {
	if (obj_turn_control.cur_char == index) {
		for (var i = 0; i < 5; i++) {
			if (i == cur_button) {
				draw_sprite(spr_battle_buttons_active, i, x + 70 * i + 20, y + 61);	
			}
			else {
				draw_sprite(spr_battle_buttons, i, x + 70 * i + 20, y + 61);
			}
		}	
	}
}