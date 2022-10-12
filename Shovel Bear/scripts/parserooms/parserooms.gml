// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function parseRooms(stringList){

	var roomList = [];
	var curRoom = "";
	var i = 1;
	var j = 0; 
	
	while(i < string_length(stringList)+1){
		
		if(string_char_at(stringList,i) != ","){
			
			curRoom = curRoom + string_char_at(stringList,i);
			show_debug_message(curRoom);
		
		}else {
			
			roomList[j] = curRoom;
			curRoom = "";
			j++;
			
		}
		i++;
	}
	roomList[j] = curRoom;
	
	
	return roomList;


}