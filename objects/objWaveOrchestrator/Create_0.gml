spawns = {
	a: {
		minimum: 1,
		maximum: 2,
		pool: [objEnemy1, objEnemy2]
	},
	b: {
		minimum: 1,
		maximum: 3,
		pool: [objEnemy1, objEnemy2]
	},
	c: {
		minimum: 1,
		maximum: 3,
		pool: [objEnemy1, objEnemy2, objEnemy3]
	},
	d: {
		minimum: 2,
		maximum: 3,
		pool: [objEnemy1, objEnemy2, objEnemy3]
	},
	e: {
		minimum: 1,
		maximum: 1,
		pool: [objEnemy4]
	},
	f: {
		minimum: 1,
		maximum: 2,
		pool: [objEnemy3, objEnemy4]
	}
};

allDifficulties = variable_struct_get_names(spawns);;
allDirections = ["top", "topRight", "right", "bottomRight", "bottom", "bottomLeft", "left", "topLeft"];

previousDirection = undefined;

alarm[0] = 1;
waveCooldown = seconds(5);

var _spawnStretch = 500;
var _spreadEven = 320;
var _spreadAngled = 260;
var _xCenter = room_width/2;
var _yCenter = room_height/2;

spawnAreas = {
	top: { dir: DIR_DOWN, xMin: _xCenter - _spreadEven, xMax: _xCenter + _spreadEven, yMin: 0, yMax: _spawnStretch },
	topRight: {
		dir: DIR_DOWN_LEFT,
		xMin: (_xCenter - _spreadAngled) + lengthdir_x(_xCenter, DIR_UP_RIGHT),
		xMax: (_xCenter + _spreadAngled) + lengthdir_x(_xCenter, DIR_UP_RIGHT),
		yMin: (_yCenter - _spreadAngled) + lengthdir_y(_yCenter, DIR_UP_RIGHT),
		yMax: (_yCenter + _spreadAngled) + lengthdir_y(_yCenter, DIR_UP_RIGHT)
	},
	right: { dir: DIR_LEFT, xMin: room_width - _spawnStretch, xMax: room_width, yMin: _yCenter - _spreadEven, yMax: _yCenter + _spreadEven },
	bottomRight: {
		dir: DIR_UP_LEFT,
		xMin: (_xCenter - _spreadAngled) + lengthdir_x(_xCenter, DIR_DOWN_RIGHT),
		xMax: (_xCenter + _spreadAngled) + lengthdir_x(_xCenter, DIR_DOWN_RIGHT),
		yMin: (_yCenter - _spreadAngled) + lengthdir_y(_yCenter, DIR_DOWN_RIGHT),
		yMax: (_yCenter + _spreadAngled) + lengthdir_y(_yCenter, DIR_DOWN_RIGHT)
	},
	bottom: { dir: DIR_UP, xMin: _xCenter - _spreadEven, xMax:  _xCenter + _spreadEven, yMin: room_height - _spawnStretch, yMax: room_height },
	bottomLeft: {
		dir: DIR_UP_RIGHT,
		xMin: (_xCenter - _spreadAngled) + lengthdir_x(_xCenter, DIR_DOWN_LEFT),
		xMax: (_xCenter + _spreadAngled) + lengthdir_x(_xCenter, DIR_DOWN_LEFT),
		yMin: (_yCenter - _spreadAngled) + lengthdir_y(_yCenter, DIR_DOWN_LEFT),
		yMax: (_yCenter + _spreadAngled) + lengthdir_y(_yCenter, DIR_DOWN_LEFT)
	},
	left: { dir: DIR_RIGHT, xMin: 0, xMax: _spawnStretch, yMin: _yCenter - _spreadEven, yMax: _yCenter + _spreadEven },
	topLeft: {
		dir: DIR_DOWN_RIGHT,
		xMin: (_xCenter - _spreadAngled) + lengthdir_x(_xCenter, DIR_UP_LEFT),
		xMax: (_xCenter + _spreadAngled) + lengthdir_x(_xCenter, DIR_UP_LEFT),
		yMin: (_yCenter - _spreadAngled) + lengthdir_y(_yCenter, DIR_UP_LEFT),
		yMax: (room_height/2 + _spreadAngled) + lengthdir_y(room_height/2, DIR_UP_LEFT)
	}
};