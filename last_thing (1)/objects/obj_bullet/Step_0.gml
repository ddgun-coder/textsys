/// @description Insert description here
// You can write your code in this editor
sped += 0.03;
x += lengthdir_x(sped, image_angle);
y += lengthdir_y(sped, image_angle);

image_xscale += 0.03;
image_yscale += 0.03;

image_xscale = min(1, image_xscale);
image_yscale = min(1, image_yscale);