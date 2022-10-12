/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
inputCounter++;
if(gamepad_button_check(0,gp_padl) && selectionIndex == 1){
	
	if(inputCounter >= inputDelay && rectangleValues[0] > 0){
		
		rectangleValues[0]-=0.01;
			
	}
		
	
} else if(gamepad_button_check(0,gp_padr) && selectionIndex == 1){
	
	if(inputCounter >= inputDelay && rectangleValues[0] < 1){
		
		rectangleValues[0]+=0.01;
			
	}
		
	
}

if(selectionIndex == 2){
	
	if(gamepad_button_check(0,gp_padr)){
	
		if(inputCounter >= inputDelay && rectangleValues[1] < 1){
		
			rectangleValues[1]+=0.01;
			
		}
	}
	
	else if(gamepad_button_check(0,gp_padl)){
	
		if(inputCounter >= inputDelay && rectangleValues[1] > 0){
		
			rectangleValues[1]-=0.01;
			
		}
		
	
	}
		
	
}
	
	



if(inputCounter >inputDelay ) inputCounter = 0;