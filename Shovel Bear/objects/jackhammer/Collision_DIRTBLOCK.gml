/// @description Insert description here
// You can write your code in this editor
if(other.hp > 30){
	
	with(other){
	
		hp -= 100;
		
	}
	instance_destroy();
	
} else
instance_destroy(other);