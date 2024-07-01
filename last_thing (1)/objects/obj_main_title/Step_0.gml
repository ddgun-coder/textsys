/// @description Insert description here
// You can write your code in this editor
if (curve_position < 1) {
	curve_position += 1 / 120;		
}

if (keyboard_check(ord("X"))) {
	curve_position = 1;	
}

var channel_y = animcurve_get_channel(dmg_bounse, 0);
var pos_y = animcurve_channel_evaluate(channel_y, curve_position);

y = ystart - pos_y * 330;