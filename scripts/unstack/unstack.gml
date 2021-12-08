function unstack(){
	var _inst = other;
	var i = point_direction(_inst.x, _inst.y, x, y);
	var _xdir = lengthdir_x(2, i);
	var _ydir = lengthdir_y(2, i);
	if (!collision_point(_xdir, _ydir, objSolidParent, 1, 1)) {
		x += _xdir;
		y += _ydir;
	}
}