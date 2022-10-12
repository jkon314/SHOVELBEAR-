//here we generate the layers of dirt
random_set_seed(randomise());
var offset = 5;


var x_pos = 0;
var y_pos = 480+60*offset;

var num_rows = (1080-y_pos)/60;

nColumns = floor(room_width/sprite_get_width(dirt_sprite));


middle  = floor(nColumns)/2;

//select where the power blocks go

pYs = [2,3,5,6];

numSpec = irandom_range(2,4);

pXs = [];

for(var i  = 0; i < numSpec; i++){
	
	var next = 0;
	tries = 0;
	while(tries < 100){
		
		next = irandom_range(0,middle);
		if(!arrayContains(pXs,next)) break;
		tries++;
		
	}
	
	pXs[i] = next;
	
	
}



for(var i = 0; i < num_rows; i++){
	
	
	
	x_pos = 0;
	for(var j = 0; j < 32; j++){
		
		//do any necessary check to see if we should generate a special block
		//if type = 1 do special thing
		num = irandom_range(0,9);
		
		if(num <=8) instance_create_depth(x_pos+irandom_range(-10,10),y_pos+irandom_range(-10,10),-10000,DIRTBLOCK); // change back to 8
		else with(instance_create_depth(x_pos,y_pos,-10000,DIRTBLOCK)){
		
			destroyMe = true;
			
		}
		x_pos+=60;
		
		
	}
	
	
	y_pos+=60;
	
}


for(var i = 0; i < numSpec; i++){
	
	with(instance_nearest(pXs[i]*60,pYs[i]*60 +480+60*offset,DIRTBLOCK))	{
		turnSpecial();
	}
	
	with(instance_nearest(middle*60 + (middle*60 - pXs[i]*60),pYs[i]*60 +480+60*offset,DIRTBLOCK)){
	
		
		turnSpecial();
	
	
	}
	
}


for(var i = 0; i < instance_number(DIRTBLOCK); i++){
	
	with(instance_find(DIRTBLOCK,i)){
		
		noBlock();
	
	}
	
}


instance_create_depth(0,y,-10000,itemHolder);
instance_create_depth(room_width-sprite_get_width(itemBox),0,-10000,itemHolder);

//audio_play_sound(SSTheme, 10, true);