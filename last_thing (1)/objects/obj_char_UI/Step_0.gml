/// @description Insert description here
// You can write your code in this editor
if (go_up) {
	var channel = animcurve_get_channel(textbox_curve, 0);
	var pos = animcurve_channel_evaluate(channel, curve_position);
	curve_position += 0.02;
	y = ystart - (pos * 400);
	if (curve_position >= 1) {
		curve_position = 0;
		go_up = false;
	}
}
else {
	if (go_up_sub) {
		var channel = animcurve_get_channel(textbox_curve, 0);
		var pos = animcurve_channel_evaluate(channel, curve_position);
		curve_position += 0.1;
		y = ystart - ((pos + 1) * 53);
		if (curve_position >= 1) {
			curve_position = 0;
			go_up_sub = false;
		}
	}
	else {
		if (obj_turn_control.cur_char == index) {
			if (!obj_show_enemy.visible) {
				if (keyboard_check_pressed(vk_left)) {
					if (cur_button > 0) cur_button--;
				}
				if (keyboard_check_pressed(vk_right)) {
					if (cur_button < 4) cur_button++;
				}
			}
			if (keyboard_check_pressed(ord("Z"))) {
				switch(cur_button) {
					case 0:
						if (!obj_show_enemy.visible) {
							obj_show_enemy.init_choice();
						}
						else {
							obj_turn_control.battle_state[index] = new act_sub(cur_button, 0, obj_show_enemy.cur_position);
							obj_turn_control.next_char(index);
							if (index == 0) {
								obj_me.sprite_index = spr_attack_ready;
								obj_me.image_speed = 1;
							}
							else {
								with(obj_follow) {
									if (other.index == number) {
										sprite_index = sprites.ready_spr;
										image_speed = 1;
									}
								}
							}
							spr_UI = spr_char_attack;
							obj_show_enemy.visible = false;
						}
					break;
					case 1:
						
					break;
					case 2:
					
					break;
					case 3:
					
					break;
					case 4:
					
					break;
				}
			}
		}
		else {
			if (go_down) {
				var channel = animcurve_get_channel(textbox_curve2, 0);
				var pos = animcurve_channel_evaluate(channel, curve_position);
				curve_position += 0.1;
				y = ystart - ((pos + 1) * 53);
				if (curve_position >= 1) {
					curve_position = 0;
					go_down = false;
				}
			}
		}
	}
}