if (!other.active) return;
instance_activate_object(objPlayer);
objPlayer.x = other.x;
objPlayer.direction = direction - 90;
objPlayer.image_angle = image_angle;
objPlayer.scriptedShortcut = false;
instance_destroy();