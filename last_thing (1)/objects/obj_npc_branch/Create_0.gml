/// @description Insert description here
// You can write your code in this editor
event_inherited();

function get_line(index, answer = line_queue) {
	if (count == 0) return first_queue;
	
	if (global.gold >= 500) {
		return branch(0);	
	}
	else {
		return branch(1);	
	}
}

first_queue = ds_queue_create();
for (var i = 0; i < 2; i++) {
	for (var j = 0; j < 2; j++) {
		line_queue[i][j] = ds_queue_create();
	}
}
line_queue[0][2] = ds_queue_create();

ds_queue_enqueue(first_queue, "안녕", "최고의 검이 단돈 500골드야.");

ds_queue_enqueue(line_queue[0][0], "넌 500골드를 가지고 잇군.", "나의 최고의 검을 가질 자격이 잇다.");
ds_queue_enqueue(line_queue[0][1], "뭐 생각이 바겻나?");
ds_queue_enqueue(line_queue[0][2], "정말?");

ds_queue_enqueue(line_queue[1][0], "넌 500골드도 없잖아");
ds_queue_enqueue(line_queue[1][1], "넌 이번에도 500골드가 없어.");

