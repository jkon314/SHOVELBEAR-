/// @description Insert description here
// You can write your code in this editor

if(gamepad_button_check_pressed(0,gp_padr)) {
	mapIndex++;
	if(mapIndex > array_length(maps) - 1) mapIndex = 0;
	//wraps maps back around
}

else if(gamepad_button_check_pressed(0,gp_padl)) {
	mapIndex--;
	if(mapIndex < 0) mapIndex = array_length(maps) - 1;
	//wraps maps back around
	
}


if(gamepad_button_check_pressed(0,gp_face1)){
	
	switch(mapIndex){
		
	case 0: room_goto(Room1);
	break;
	case 1: room_goto(space);
	break;
	
	case 2: room_goto(bigBlook);
	break;
	
	case 3: room_goto(uneven);
	break;
	default: room_goto(Room1);
	break;
		
		
	}
	
}