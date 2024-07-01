/// @description Insert description here
// You can write your code in this editor
invin = 0;
function damagef(_idd, _damage) {
	if (_idd.live == true) {
		_idd.hp -= _damage;
		
		var idd = instance_create_depth(_idd.conneted_id.x, _idd.conneted_id.y, depth, obj_dmg);
		idd.num = _damage;
		invin = 30;
	}
}