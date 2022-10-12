/// @description Insert description here
// You can write your code in this editor

if(gamepad_button_check_pressed(0,gp_padu)){
	selectionIndex--;
	if(selectionIndex < 0) selectionIndex = maxIndex; 
	show_debug_message(selectionIndex);
}

else if(gamepad_button_check_pressed(0,gp_padd)){
	selectionIndex++;
	if(selectionIndex > maxIndex) selectionIndex = 0; 
	show_debug_message(selectionIndex);
}

if(gamepad_button_check_pressed(0,gp_face1)){
	
	if(selectionIndex < array_length(buttons)){
		if(object_exists(buttons[selectionIndex]))
			room_goto(buttons[selectionIndex]);	
	}
}