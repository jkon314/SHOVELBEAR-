/// @description Insert description here
// You can write your code in this editor

selectionIndex = 0;
sHeight = string_height("Replay");


myRooms  = parseRooms(roomsCSV);
buttons = [];

len = array_length(myRooms);


for(var i = 0; i < len; i++){
	
	buttons[i] = asset_get_index(myRooms[i]);
	
}


show_debug_message(myRooms);


