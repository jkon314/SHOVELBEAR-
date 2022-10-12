/// @description Insert description here
// You can write your code in this editor

with(instance_find(bear,playerNum)){
	
		if(helmutHavin) {
			
			other.x = x;
			other.y = y - sprite_height + 20;
			
		}
		else instance_destroy(other);
}