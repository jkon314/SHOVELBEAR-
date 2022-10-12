/// @description Insert description here
// You can write your code in this editor


	
	/*sprite_index = Explosion;
	mask_index = Explosion;
	instance_destroy();*/
	
	
	instance_create_depth(x,y,-10000,explosion_obj);
	exploding = true;
	//show_debug_message("imexploding");
	instance_destroy();
