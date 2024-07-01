/// @description Insert description here
// You can write your code in this editor
draw_self();
if (afterimage) {
	var size = array_length(surface_array);
	for (var i = 0; i < size; i++) {
		var index = size - i - 1;
		draw_surface_ext(surface_array[index], x_array[index], y_array[index], 1, 1, 0, c_white, (index + 1) / size / 2);
	}
}