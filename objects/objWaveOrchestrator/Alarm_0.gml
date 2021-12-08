var SEARCH_TRIES_MAX = 30;

var _spawnDifficulty = array_choose(allDifficulties);
var _spawnOptions = variable_struct_get(spawns, _spawnDifficulty);
var _spawnAmount = round(random_range(_spawnOptions.minimum, _spawnOptions.maximum));
var _prevDirIndex = array_search(allDirections, previousDirection);

var _dir;
if (_prevDirIndex > -1) {
	var _endIndex = array_length(allDirections) - 1;
	var _prevDirIndexRight = (_prevDirIndex + 1 > _endIndex) ? 0 : _prevDirIndex + 1;
	var _prevDirIndexLeft = (_prevDirIndex - 1 < 0) ? _endIndex : _prevDirIndex - 1;
	
	// Attempt to not spread out spawns, but have higher chance of spawning next to previous spawn or on the same spot
	if (chance(50)) _dir = allDirections[_prevDirIndex];
	else if (chance(40)) _dir = allDirections[choose(_prevDirIndexLeft, _prevDirIndexRight)];
	else if (chance(10)) _dir = array_choose(allDirections);
	else _dir = allDirections[_prevDirIndex];
} else {
	_dir = array_choose(allDirections);
}
var _pool = _spawnOptions.pool;

for (var _i = 0; _i < _spawnAmount; _i++) {
	var _spawnType = array_choose(_pool);
	var _directionVars = variable_struct_get(spawnAreas, _dir);
	var _xRange = _directionVars.xMax - _directionVars.xMin;
	var _yRange = _directionVars.yMax - _directionVars.yMin;
	
	var _spawnX = _directionVars.xMin + random(_xRange);
	var _spawnY =  _directionVars.yMin + random(_yRange);
	
	if (instance_position(_spawnX, _spawnY, objEnemyParent)) {
		var _searchTries = 0;
		var _searchTriesMax = SEARCH_TRIES_MAX;
		var _searchingForSpawn = true;
		do {
			_spawnX = _directionVars.xMin + random(_xRange);
			_spawnY =  _directionVars.yMin + random(_yRange);
			_searchTries++;
			if !instance_position(_spawnX, _spawnY, objEnemyParent) _searchingForSpawn = false;
		} until (!_searchingForSpawn || _searchTries == _searchTriesMax);
	}
	var _spawn = instance_create_layer(_spawnX, _spawnY, self.layer, _spawnType);
	with (_spawn) {
		startDirection = _directionVars.dir;
	}
}

previousDirection = _dir;

alarm[0] = waveCooldown;