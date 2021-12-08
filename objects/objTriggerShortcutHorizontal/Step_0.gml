//if (instance_exists(objPlayer)) {
//	var _isTriggering = place_meeting(x, y, objPlayer);
//	if (_isTriggering && keyboard_check_pressed(btnAction)) {
//		if (active) {
//			with (objPlayer) {
//				scriptedShortcut = true;
//				if (x < room_width/2) {
//					scriptedShortcutDirection = 0;	
//				}
//				else if (x > room_width/2) {
//					scriptedShortcutDirection = 180;	
//				}
//			}
//			active = false;
//			alarm[0] = coolDown;
//		}
//	}
//}