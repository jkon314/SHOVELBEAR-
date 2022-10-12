/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(surf)){
	
	
	surf = surface_create(sprite_width, sprite_height);
	
}
	
	
	
	surface_set_target(surf);
	
	draw_sprite(sprite_index,image_index,sprite_xoffset,sprite_yoffset);
	
	if(itemNum == 1) draw_sprite(nuke_sprite,0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 2) draw_sprite(bomb,0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 3) draw_sprite(dirt_sprite,0,16,16);
	
	else if(itemNum == 4) draw_sprite(jackHammerSprite, 0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 5) draw_sprite(lootBox_sprite, 0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 6) draw_sprite(rocket_sprite, 0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 7) draw_sprite(helmut_sprite,0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 8) draw_sprite(scort,0,sprite_xoffset,sprite_yoffset);
	
	else if(itemNum == 9) draw_sprite(golden_shovel,0,sprite_xoffset,sprite_yoffset);
	
	surface_reset_target();
	
	draw_surface(surf,x, y);
