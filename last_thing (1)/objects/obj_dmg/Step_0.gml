/// @description Insert description here
// You can write your code in this editor
if (curve_position < 1) {
	curve_position += 1 / 120;		
}
else {
	image_alpha -= 1 / 60;
	image_yscale += 0.03;
	ystart -= 1;
}
if (image_alpha <= 0) {
	instance_destroy();	
}

var channel_y = animcurve_get_channel(dmg_bounse, 0);
var pos_y = animcurve_channel_evaluate(channel_y, curve_position);
var channel_x = animcurve_get_channel(dmg_bounse, 1);
var pos_x = animcurve_channel_evaluate(channel_x, curve_position);

y = ystart - pos_y * 50;
x = xstart + pos_x * 80;
