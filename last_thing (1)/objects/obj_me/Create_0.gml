/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
my_direction = 0;
#macro ARRAY_SIZE 15
char = noone;

to_x = 0;
to_y = 0;
time = 0;
afterimage = false;

go_x = 0;
go_y = 0;

function attacking() {
	image_index = 0;
	sprite_index = spr_attack;
	animation_delay = 240;
	image_speed = 1;
}

surface_array = [];
x_array = [];
y_array = [];

zoom_out = false;
zoom_out_val = 0;