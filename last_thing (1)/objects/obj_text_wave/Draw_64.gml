/// @description Insert description here
// You can write your code in this editor
var str = "";
for (var i = 1; i < next_text; i++) {
	var char = string_char_at(text, i);
	draw_text(x + string_width(str), y + sin(i + next_text) * 10, char);
	str += char;
}