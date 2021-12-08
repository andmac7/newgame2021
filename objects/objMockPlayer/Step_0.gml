if (image_angle != direction) {
	var _turnSpeed = 8;
	var _dd = angle_difference(image_angle, direction);
	image_angle -= min(abs(_dd), _turnSpeed) * sign(_dd);	
}