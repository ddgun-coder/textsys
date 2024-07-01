/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(ord("A"))) {
	if (place_free(x - 4, y)) {
		x -= 4;		
	}
}	
if (keyboard_check(ord("S"))) {
	if (place_free(x, y + 4)) {
		y += 4;		
	}
}	
if (keyboard_check(ord("D"))) {
	if (place_free(x + 4, y)) {
		x += 4;		
	}
}	
if (keyboard_check(ord("W"))) {
	if (place_free(x, y - 4)) {
		y -= 4;
	}
}	
if (invin > 0) {
	invin--;
}