/// @description Insert description here
// You can write your code in this editor
event_inherited();

function get_line(index, answer = line_queue) {
	if (global.gold >= 0) {
		return line_queue[min(array_length(line_queue) - 1, count)];
	}
	else if (global.gold <= -125) {
		return 	branch_queue2;
	}
	else {
		return branch_queue;
	}
}

line_queue[0] = ds_queue_create();
line_queue[1] = ds_queue_create();

for (var i = 0; i < 3; i++ ){
	a_queue[i] = ds_queue_create();
}

for (var i = 0; i < 3; i++ ){
	c_queue[i] = ds_queue_create();
}

for (var i = 0; i < 2; i++ ){
	b_queue[i] = ds_queue_create();
}

branch_queue = ds_queue_create();
branch_queue2 = ds_queue_create();
ds_queue_enqueue(line_queue[0], "선택의 시간이다.");

ds_queue_enqueue(line_queue[1], "하나를 골라.", "|", a_queue, "1번", "2번", "3번");
ds_queue_enqueue(branch_queue2, "하나를 골라.", "|", c_queue, "5번", "-1번", "999번");

ds_queue_enqueue(a_queue[0], "1번", "좋은 숫자야");
ds_queue_enqueue(a_queue[1], "2번", "좋은 숫자야");
ds_queue_enqueue(a_queue[2], "3번", "음... 3번이라면 선택지를 하나 더 주지.", "|", b_queue, "정말?", "안속아");

ds_queue_enqueue(c_queue[0], "5번", "좋은 숫자야");
ds_queue_enqueue(c_queue[1], "-1번", "좋은 숫자야");
ds_queue_enqueue(c_queue[2], "999번", "음... 3번이라면 선택지를 하나 더 주지.", "|", b_queue, "정말?", "안속아");

ds_queue_enqueue(b_queue[0], "아니");
ds_queue_enqueue(b_queue[1], "맞아");

ds_queue_enqueue(branch_queue, "들켯나?");