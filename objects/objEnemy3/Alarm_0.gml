paused = !paused;

if (paused) {
	var _xx = x + lengthdir_x(sprite_height, direction);
	var _yy = y + lengthdir_y(sprite_height, direction);
	myShield = instance_create_layer(_xx, _yy, self.layer, objEnemyShield);
	alarm[0] = pauseTime;
} else if (instance_exists(myShield)) {
	instance_destroy(myShield);
	alarm[0] = pauseInterval;
}