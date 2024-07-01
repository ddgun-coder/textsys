/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
array_size = 5;
surface_array = [];
x_array = [];
y_array = [];
afterimage = true;
time = 500;

disappear = false;
disappear_fail = false;

function attack_con() {
	if (from == 0) {
		obj_me.attacking();		
	}
	else {
		with(obj_follow) {
			if(other.from == number) {
				attacking();
			}
		}
	}
}