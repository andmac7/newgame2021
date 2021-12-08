event_inherited();

if (paused) {
	speed = 0;
	var _xx = x + lengthdir_x(sprite_height, direction);
	var _yy = y + lengthdir_y(sprite_height, direction);
	if (instance_exists(myShield)) {
		with (myShield) {
			image_angle = other.image_angle;
			x = _xx;
			y = _yy;
		}
	}
} else {
	speed = moveSpeed;
	direction = startDirection;
	image_angle = direction;
}