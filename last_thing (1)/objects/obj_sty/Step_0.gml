/// @description Insert description here
// You can write your code in this editor
if (spin) {
	var out = true;
	if (image_xscale < to_xscale) {
		image_xscale += 0.1;
		out = false;
	}
	if (image_yscale < to_yscale) {
		image_yscale += 0.1;
		out = false;
	}
	if (out) spin = false;
	image_angle += 6;
}else if (image_angle % 90 != 0 and !rev_spin) {
	image_angle += 6;
}

if (rev_spin) {
	image_xscale -= 0.05;
	image_yscale -= 0.05;
	image_angle -= 5;
	if (image_xscale <= 0 or image_yscale <= 0) {
		instance_destroy();
	}
}