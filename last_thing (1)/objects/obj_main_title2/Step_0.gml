 /// @description Insert description here
// You can write your code in this editor
if (idd.curve_position >= 1 and part < 1) {
	part += 0.02;
}
if (part >= 1) {
	if (rgb_time <= 1) { 
		rgb_time += 0.03;
	}
	else {
		rgb_time = 0;
		rgb_goR = irandom(100) + 155;
		rgb_goG = irandom(100) + 155;
		rgb_goB = irandom(100) + 155;
		rgb_pre = image_blend;
	}
	var r = color_get_red(rgb_pre)
	var g = color_get_green(rgb_pre)
	var b = color_get_blue(rgb_pre)
	var rt = min(rgb_time, 1);
	
	r = lerp(r, rgb_goR, rt);
	g = lerp(g, rgb_goG, rt);
	b = lerp(b, rgb_goB, rt);
	
	image_blend = make_color_rgb(r, g, b);
}