function shootBullet() {
	var _bullet = instance_create_layer(x, y, self.layer, objBullet);
	with (_bullet) {
		speed = bulletSpeed;
		direction = other.targetImageAngle;
		image_angle = direction;
	}
}

targetImageAngle = direction + 90;

// Check for scripted behaviour before everything else, as it takes precedence
if (scriptedShortcut) {
	var _mockPlayer = instance_create(x, y, objMockPlayer);
	with (_mockPlayer) {
		direction = other.scriptedShortcutDirection;
		image_angle = other.image_angle;
		speed = other.scriptedShortcutSpeed;
	}
	instance_deactivate_object(self);
}

// Check for use of shortcuts
if (!meleeInRange) { // If enemy melee is blocking, shortcut can't be used
	var _isOnVerticalShortcutTrigger = instance_position(x, y, objTriggerShortcutVertical);
	if (instance_exists(_isOnVerticalShortcutTrigger) && keyboard_check_pressed(btnAction)) {
		if (_isOnVerticalShortcutTrigger.active) {
			scriptedShortcut = true;
			if (y < room_height/2) {
				scriptedShortcutDirection = 270;	
			}
			else if (y > room_height/2) {
				scriptedShortcutDirection = 90;	
			}
			_isOnVerticalShortcutTrigger.active = false;
			_isOnVerticalShortcutTrigger.alarm[0] = _isOnVerticalShortcutTrigger.coolDown;
		}
	}

	var _isOnHorizontalShortcutTrigger = instance_position(x, y, objTriggerShortcutHorizontal);
	if (instance_exists(_isOnHorizontalShortcutTrigger) && keyboard_check_pressed(btnAction)) {
		if (_isOnHorizontalShortcutTrigger.active) {
			scriptedShortcut = true;
			if (x < room_width/2) {
				scriptedShortcutDirection = 0;	
			}
			else if (x > room_width/2) {
				scriptedShortcutDirection = 180;	
			}
			_isOnHorizontalShortcutTrigger.active = false;
			_isOnHorizontalShortcutTrigger.alarm[0] = _isOnHorizontalShortcutTrigger.coolDown;
		}
	}
}

if (keyboard_check(btnLeft)) {
	speedGoal = -moveSpeed;
} else if (keyboard_check(btnRight)) {
	speedGoal = moveSpeed;
} else {
	speedGoal = 0;
}

// Killing enemies on the wall
var _xx = x + lengthdir_x(200, targetImageAngle - 180);
var _yy = y + lengthdir_y(200, targetImageAngle - 180);
var _closestEnemy = collision_line(x, y, _xx, _yy, objEnemyParent, 0, 1);
if (instance_exists(_closestEnemy)) {
	meleeInRange = true;
	if (keyboard_check_pressed(btnAction)) {
		with(_closestEnemy) {
			hp -= 100;
		}
	}
} else {
	meleeInRange = false;
}

if (speed != speedGoal) {
	 speed = lerp(speed, speedGoal, 0.25);	
}

if (image_angle != targetImageAngle) {
	var _turnSpeed = 8;
	var _dd = angle_difference(image_angle, targetImageAngle);
	image_angle -= min(abs(_dd), _turnSpeed) * sign(_dd);	
}

if (keyboard_check_pressed(btnShoot)) {
	shootBullet();
}
if (keyboard_check_pressed(ord("R"))) game_restart();
if (keyboard_check_pressed(vk_escape)) game_end();