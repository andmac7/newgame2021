if (instance_exists(objPlayer)) {
	var _triggerDistance = 10;
	var _isTriggering = point_distance(x, y, objPlayer.x, objPlayer.y) < _triggerDistance;
	if (_isTriggering) {
		with (objPlayer) {
			if (speed < 0) {
				direction += 45;
				x = other.x - lengthdir_x(_triggerDistance + 2, direction);
				y = other.y - lengthdir_y(_triggerDistance + 2, direction);
			}
			if (speed > 0) {
				direction -= 45;
				x = other.x + lengthdir_x(_triggerDistance + 2, direction);
				y = other.y + lengthdir_y(_triggerDistance + 2, direction);
			}
		}
	}
}