/// @description Insert description here
// You can write your code in this editor
var idd = instance_create_depth(x, y + random_range(-10, 10), depth, obj_bullet);
if (instance_exists(obj_heart)) {
	idd.image_angle = point_direction(x, y, obj_heart.x, obj_heart.y);
}
alarm[0] = 40;