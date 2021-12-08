if (instance_exists(objMockPlayer)) {
	targetInstance = objMockPlayer;
} else {
	targetInstance = objPlayer;	
}

if (keyboard_check_pressed(vk_up)) {
	if (camZoomLevel < camZoomLevelMax) {
		camViewWidth -= (camZoomLevelDifference - camViewWidth) / 10;
		camViewHeight -= (camZoomLevelDifference - camViewHeight) / 10;
		camZoomLevel += 1;
	}
}
if (keyboard_check_pressed(vk_down)) {
	if (camZoomLevel > 1) {
		camViewWidth += (camZoomLevelDifference - camViewWidth) / 10;
		camViewHeight += (camZoomLevelDifference - camViewHeight) / 10;
		camZoomLevel -= 1;
	}
}

camera_set_view_size(view, camViewWidth, camViewHeight);

if (!instance_exists(targetInstance)) {
	camera_set_view_pos(view, room_width/2 - (camViewWidth/2), room_height/2 - (camViewHeight/2));
}

if (instance_exists(targetInstance)) {
	var _offsetLength = 200;
	var _angle = -targetInstance.image_angle + 90;
	var _posX = targetInstance.x - (camViewWidth/2);
	var _posY = targetInstance.y - (camViewHeight/2);
	var _posOffsetX = lengthdir_x(_offsetLength, targetInstance.image_angle);
	var _posOffsetY = lengthdir_y(_offsetLength, targetInstance.image_angle);
	camera_set_view_angle(view, _angle);
	camera_set_view_pos(view, _posX + _posOffsetX, _posY + _posOffsetY);
}