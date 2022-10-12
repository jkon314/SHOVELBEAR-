/// @description throw item if have
// You can write your code in this editor

if(curItem == 1){

	show_debug_message("shot nuke");
	instance_create_depth(x+sprite_width+60,y-sprite_height,-10000,nuke);
	curItem = 0;
	
	with(instance_nearest(0,0,itemHolder)){

		itemNum = other.curItem;
		show_debug_message(itemNum);
	
	}
	
}
	
	

