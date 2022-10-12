/// @description Insert description here
// You can write your code in this editor
if(type != 0){
	
	
	image_alpha = 5;
	
}






for (var i = 0; i < maxpads; i++)
	{
		iCounter = i;
		if gamepad_button_check_pressed(i,gp_face2){
		
			if gamepad_button_check(i,gp_padr)|| (gamepad_axis_value(i,gp_axislh) > deadzone){
			
					if position_meeting(x-10,y+10, bear) {
	
						with(instance_nearest(x,y,bear)){
				
				
							if(other.iCounter == playerNum) other.hp-=1;	
							audio_play_sound(blockBreak, 10, false);
						
						}
	
				}
			
		
			
			}	
		
		else if gamepad_button_check(i,gp_padl)||(gamepad_axis_value(i,gp_axislh) < -deadzone){
			
			if position_meeting(x+sprite_get_width(dirt_sprite)+10,y+10, bear) {
	
				with(instance_nearest(x+sprite_get_width(dirt_sprite)+10,y+10,bear)){
				
				
					if(other.iCounter == playerNum) other.hp-=1;	
					audio_play_sound(blockBreak, 10, false);
				}
	
			}
			
		}
		
		else if (position_meeting(x+5,y-10, bear)||position_meeting(x+45,y-10,bear)||position_meeting(x+30,y-10,bear)) {//change back to x+30 and remove or to return to orignal block dig
	
				with(instance_nearest(x+30,y-10,bear)){
				
				
					if(other.iCounter == playerNum) other.hp-=1;	
					audio_play_sound(blockBreak, 10, false);
				}
	
			}
	
		}
	
}
if(hp <= 0){
	
	
	
	
	instance_destroy();
	
}