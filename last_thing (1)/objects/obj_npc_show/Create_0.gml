/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (var i = 0; i < 4; i++ ) {
	line_queue[i] = ds_queue_create();
}

ds_queue_enqueue(line_queue[0], "내가 한번 색을 바꿔볼께");
ds_queue_enqueue(line_queue[0], "... |$FF0000얍!");
ds_queue_enqueue(line_queue[0], "|$FF00FF 놀랍게도 |$FFFF00 여러색도 |$121011 가능하지 |$1210FF 롱|$000000");

ds_queue_enqueue(line_queue[1], "이번엔 크기를 바꿔볼께");
ds_queue_enqueue(line_queue[1], "... |@4| 얍!");
ds_queue_enqueue(line_queue[1], "|@5| 야! |@0.5| 미안 ㅎㅎ|@1|");

ds_queue_enqueue(line_queue[2], "이번엔 그림을 넣어볼께");
ds_queue_enqueue(line_queue[2], "... |#spr_hole|얍!|#spr_hole|1235123512351235");
ds_queue_enqueue(line_queue[2], "|#spr_hole| |#spr_test1|안녕 |#spr_hole| |#spr_wall|");

ds_queue_enqueue(line_queue[3], "이번엔 움직이는 그림을 넣어볼께 \n 사실 오브젝트임");
ds_queue_enqueue(line_queue[3], "... |%obj_text_wave| 얍! |%obj_text_wave|");