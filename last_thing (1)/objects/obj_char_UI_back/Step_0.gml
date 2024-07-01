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