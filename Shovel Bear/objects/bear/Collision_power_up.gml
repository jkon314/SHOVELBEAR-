/// @description Pick up Power up

// You can write your code in this editor




curItem = irandom_range(1,10);

//curItem = 1;    //nuke
//curItem = 2;   //bomb
//curItem = 3;	//block
curItem = 4; //jackhammer
//curItem = 5; // lootbox
//curItem = 6;  //rocket
//curItem = 7; // helmut
//curItem = 8; // scoot
//curItem = 9; //golden shovel
//curItem = 10;
//curItem = 11;//101Games
//curItem = 12;//gokumode
if(curItem == 8) curItem = 9;
with(instance_find(itemHolder,playerNum)){

	itemNum = other.curItem;
	show_debug_message(itemNum);
	
}
instance_destroy(other);

