/// @description Insert description here
// You can write your code in this editor
if(!surface_exists(surf)){
	
	
	surf = surface_create(sprite_width, sprite_height);
	
}
	
	
	
	surface_set_target(surf);
	
	
	if (type == 0) sprite_index = dirt_sprite;
	
	else if (type == 1) sprite_index = stoneSprite;
	
	if(type ==3){
	
		draw_sprite_ext(sprite_index,image_index,sprite_xoffset,sprite_yoffset,15,10,0,c_white,1);
		
	} else draw_sprite(sprite_index,image_index,sprite_xoffset,sprite_yoffset);
	
	
	
	if(hp < (5*(1+type))) {
		
		overlay = breaking1;
		
		breakstate = floor((hp-1)/(1+type));
		
		
		
		
		switch (breakstate){
			
			case 2: 
				overlay = breaking2;
			break;	
			
			case 1: 
				overlay = breaking3;
			break;
			
			case 0: 
				overlay = breaking4;
				break;
				
			default: 
				overlay = breaking1;
			break;
		}
		
		
			
		draw_sprite(overlay,0,0,0);
	}
	
	
	
	surface_reset_target();
	
	draw_surface(surf,x - sprite_xoffset, y-sprite_yoffset);
	

