function init(){
	// Directions
	#macro DIR_RIGHT		0
	#macro DIR_UP_RIGHT		45	
	#macro DIR_UP			90
	#macro DIR_UP_LEFT		135
	#macro DIR_LEFT			180
	#macro DIR_DOWN_LEFT	225
	#macro DIR_DOWN			270
	#macro DIR_DOWN_RIGHT	315
	
	// Controls
	globalvar btnAction, btnLeft, btnRight, btnShoot;
	btnAction = vk_down;
	btnLeft = vk_left;
	btnRight = vk_right;
	btnShoot = vk_space;
	
	randomize();
}