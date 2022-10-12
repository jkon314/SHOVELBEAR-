//here we generate the layers of dirt

var offset = 5;


var x_pos = 0;
var y_pos = 480+60*offset;

var num_rows = (1080-y_pos)/60;

show_debug_message(num_rows);

for(var i = 3; i < num_rows+3; i++){
	
	
	
	x_pos = 60*i;
	for(var j = 0+i; j < 32-i; j++){
		
		//do any necessary check to see if we should generate a special block
		//if type = 1 do special thing
		num = irandom_range(0,9);
		
		if(num <=8) instance_create_depth(x_pos,y_pos,-100000,DIRTBLOCK);
		
		x_pos+=60;
		
		
	}
	
	
	y_pos+=60;
	
}


instance_create_depth(0,y,-10000,itemHolder);
instance_create_depth(room_width-sprite_get_width(itemBox),0,-10000,itemHolder);
