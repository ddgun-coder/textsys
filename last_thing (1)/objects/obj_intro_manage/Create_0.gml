/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font1);
snd = audio_play_sound(snd_main, 0, true);
image_alpha = 0;
image_speed = 0;
say_step = 0;
alpha_up = true;

draw_say_num = 0;
draw_say = "";
say[0] = "조금 옛날, 대민한국에는\n코딩열풍이 엄청나게 과열되고 있다.";
say[1] = "결국, 프로그래머의 공급은\n상상하지 못할정도로 늘어났다";
say[2] = "짧은시간 안에, 수많은 실직자가\n대민한국을 지배했다.";
say[3] = "대한민국 정부는,\n실업률을 줄이기위해 \n질낮은 일자리를 만들어낸다.";
say[4] = "많은 시간이\n지난후...";
say[5] = "2021년, \n북X산";
say[6] = "전설에 따르면\n이곳에 취업한 사람은\n절때 못나온다고 한다.";

my_say = say[say_step++];
alarm[0] = 10;