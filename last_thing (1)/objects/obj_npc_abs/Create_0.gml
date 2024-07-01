/// @description Insert description here
// You can write your code in this editor
if (ds_map_exists(global.count_map, id)) {
	count = global.count_map[? id];	
}
else {
	count = 0;	
}
in_branch = -1;
branch_count = 0;
line_queue = [];
function branch(index) {
	if (in_branch != index) {
		in_branch = index;
		branch_count = 0;
	}
	else {
		if (array_length(line_queue[index]) <= branch_count) {
			branch_count--;
		}
	}
	return line_queue[index][branch_count++];
}

function get_line(index, answer = line_queue) {
	return answer[index];
}