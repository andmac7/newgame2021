function array_search(array, value){
	if (value == undefined) return -1;
	for (var _i = 0; _i < array_length(array); _i++) {
		if (array[_i] == value) return _i;
	}
	
	return -1;
}