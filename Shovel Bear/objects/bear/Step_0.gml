/// @description Insert description here
// You can write your code in this editor
//if(playerNum == 0) show_debug_message(phy_speed_y);
touchingGround  = (position_meeting(x-sprite_width/2+8,y+5,DIRTBLOCK)||position_meeting(x+sprite_width/2-8,y+3,DIRTBLOCK)); // check for ground touch
if(touchingGround){
	jumpCounter = 0;
	jumping = false;
	fallJerk = 0;
	jumpFall = false;
}

//check if another bear is on top of you

	oX = 0;
	oY = 0;
	//show_debug_message(-1*(playerNum-1));
	with(instance_find(bear,-1*(playerNum-1))){
	
		other.oX = x;
		other.oY = y;
	
	}
	footStooled = (rectangle_in_rectangle(x-mywidth,y,x+mywidth,y+20,oX-mywidth,oY-(5+myheight),oX+mywidth,oY-(myheight - 5))>0);


sprite_index = sprite[state];


if(respawning){
	
	respawnTimer++;
	if(respawnTimer >= 3*room_speed){
		
		respawning = false;
		respawnTimer = 0;
		
	}

	
}



/*if gamepad_button_check(playerNum, gp_padr)
{
	physics_apply_force(x,y,1000,0)
}

else if gamepad_button_check(playerNum, gp_padl)
{
	physics_apply_force(x,y,-1000,0)
}
*/

if (gamepad_button_check(playerNum, gp_padr) || gamepad_axis_value(playerNum,gp_axislh) >deadzone)
{
	//show_debug_message(phy_speed_x);
	if(phy_speed_x < maxSpeed){
	
		if(phy_speed_x < 0 && (touchingGround)) phy_speed_x = 1;
		else phy_speed_x += 1;
	}
}

else if (gamepad_button_check(playerNum, gp_padl)||(gamepad_axis_value(playerNum,gp_axislh) < -deadzone))
{
	
	if(phy_speed_x > -maxSpeed){
		if(phy_speed_x > 0 && (touchingGround)) phy_speed_x = -1;
		else phy_speed_x -= 1;
	
	}
}

else {
	
	if(abs(phy_speed_x) <= 0.5)
	phy_speed_x = 0;
	else if (phy_speed_x > 0) phy_speed_x -= decel;
	else phy_speed_x +=decel;
}

if gamepad_button_check(playerNum, gp_padd) || (gamepad_axis_value(playerNum,gp_axislv) > deadzone){
	phy_speed_y += .5;
}

if gamepad_button_check(playerNum, gp_face1)
	{
		
		//show_debug_message("Touching ground ? : " + string(touchingGround));
		if(jumping) {
			jumpCounter++;
			phy_speed_y-=0.35;
			//if(phy_speed_y < -5) jumping = false;
				
		}
		if (touchingGround&&!helmutHavin) {
	
			if(!jumping){
				jumpCounter++;
				phy_speed_y = jumpStartSpeed;
				jumping = true;
			} 
	
	
	} else if  (position_meeting(x,y+3, bear)){
		jumpCounter = 1;
		jumpFall = false; // solves inability to jump off of other bear
		//physics_apply_force(x,y,0,-30000); //original method
		if(!jumping){
			phy_speed_y = jumpStartSpeed;
			jumping = true;
		}
		
	}
	
} else{ 
	if (jumping){
			jumpCounter = 0;
			jumping = false;
			jumpFall = true;
	}
	
}
if gamepad_button_check_pressed(playerNum,gp_face2){
	
	if(state != bearStates.hitRight && state != bearStates.hitLeft) state = bearStates.diggin;
	
}


if gamepad_button_check_released(playerNum,gp_face2){
	
	if(state != bearStates.hitRight && state != bearStates.hitLeft) state = bearStates.idle;
	
}



if((x < (0 - sprite_width)||x>(room_width+sprite_width)||y>(room_height+sprite_height)) && !respawning) {
	die();
	//yea idk how the physics engine wolrks lol just set it all to zero this is a sh*tpost
}

//below code will use the item in the players inventory

if(gamepad_button_check(playerNum, gp_face3)){//shoootitem
	if(curItem == 1){

		//show_debug_message("shot nuke");
		
		if (other.phy_speed_x > 0){
			
			instance_create_depth(x+sprite_width+60,y-sprite_height,-10000,nuke)
			
				
			
			
			
		} 
		
		else{
			with(instance_create_depth(x-sprite_width-60,y-sprite_height,-10000,nuke)){
			
				 dir = -1; //shoot nuke in direction of bear movement
			
			
			}
		}
		curItem = 0;
	
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
	
	} else if(curItem == 2){
		
			instance_create_depth(x+sprite_width+60,y-sprite_height,-10000,bombObj)
			curItem = 0;
			with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
		
	}
	
	else if(curItem == 3){
		
			instance_create_depth(x+sprite_width+60,y-sprite_height,-10000,DIRTBLOCK);
			curItem = 0;
			with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
		
	} else if(curItem == 4){
		
		instance_create_depth(x,y, -10000,jackHammer);
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
	
	} else if (curItem == 5){
		
		if(irandom_range(1,10) > 2) myLives--;
		else myLives++
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}
	
	else if (curItem == 6){
		
		instance_create_depth(x,y+5,-100000,rocket);
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}
	
	else if (curItem == 7){
		
		with(instance_create_depth(x,y-sprite_height+20,-100000,helmut)){
			
			playerNum = other.playerNum;	
			
		}
		helmutHavin = true;
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}
	
	else if (curItem == 8){
		//scott
		with(instance_create_depth(x,y-sprite_height+20,-100000,helmut)){
			
			playerNum = other.playerNum;	
			
		}
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}
	
	else if (curItem == 9){
		
		knockback = 10000;
		image_blend = c_yellow;
		
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}
	
	else if (curItem == 10){
		
		//fuckWith fps
		var newFps = irandom_range(5,1000);
		game_set_speed(newFps,gamespeed_fps);
		fpsMode = true;
		with(instance_create_depth(room_width/2,room_height/2,-1110000,fpsCounter)){
			myfps = newFps;
				
		}
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	} else if (curItem == 12){
		
		ultraAIMode = true;	
		curItem = 0;
		with(instance_find(itemHolder,playerNum)){

			itemNum = other.curItem;
			//show_debug_message(itemNum);
	
		}
		
	}

}



if(gamepad_button_check_pressed(playerNum,gp_face2)&& !stunned){
	/*show_debug_message("button Clicked");
	var width = sprite_get_width(bear_idle)/2;
	var height = sprite_get_height(bear_idle);
	oX = 0;
	oY = 0;
	show_debug_message(-1*(playerNum-1));
	with(instance_find(bear,-1*(playerNum-1))){
	
		other.oX = x;
		other.oY = y;
	//this was originally coded here but found another use for this so changed it to a boolean
	}*/
	
	//show_debug_message(rectangle_in_rectangle(x-width,y,x+width,y+5,oX-width,oY-(3+height),oX+width,oY-(height - 5))>0)
	if(footStooled) {
		//show_debug_message("damage");
		with(instance_find(bear,(playerNum-1)*-1)){
	
			if(!helmutHavin){
				physics_apply_impulse(x,y,0,1000);
				hp--;
				
			}
			if(hp <=0){
				
				die();
				
				
			}
	
		}// comment out below to remove hitting
	} else if (state != bearStates.hitRight && (gamepad_button_check(playerNum,gp_padr)|| (gamepad_axis_value(playerNum,gp_axislh) > deadzone))){
		state = bearStates.hitRight;
		if(position_meeting(x+sprite_width/2 + 10,y-sprite_height/2,bear)){
			//show_debug_message("made it");
			with(instance_find(bear,(playerNum-1)*-1)){
				stunned = true;
				if (other.knockback >100) golded = true;
				//phy_speed_x = other.knockback;
				physics_apply_impulse(x,y,knockback*100,0);
				//show_debug_message(other.knockback);
				phy_speed_y = -knockback/15 - 5;
				
			}
		}
		image_blend = c_white; //resetting values in case of gold shovel
		knockback = 15;
		
	}
	
	else if(gamepad_button_check(playerNum,gp_padl)||(gamepad_axis_value(playerNum,gp_axislh) < -deadzone)){
		state = bearStates.hitLeft;
		if(position_meeting(x-(sprite_width/2) - 14,y-sprite_height/2,bear))
			with(instance_find(bear,(playerNum-1)*-1)){
				stunned = true;
				//show_debug_message("made it");
				if (other.knockback >100) golded = true;
				//show_debug_message("knockback is " +string(other.knockback));
				//phy_speed_x = -1*other.knockback; // uncomment for original hitting
				physics_apply_impulse(x,y,-knockback*100,0);
				phy_speed_y = -knockback/15 - 5;
			}
		}
		
		knockback = 15;
		image_blend = c_white;
}

if(position_meeting(x+sprite_width/2 + 10,y-sprite_height/2,bear)&&state == bearStates.hitRight){
			//show_debug_message("made it");
			with(instance_find(bear,(playerNum-1)*-1)){
				if (other.knockback >100) golded = true;
				//phy_speed_x = other.knockback;
				physics_apply_impulse(x,y,knockback*100,0);
				//show_debug_message(other.knockback);
				phy_speed_y = -knockback/15 - 5;
				
			}
		}

if(myLives <=0){
	
	//end the game 
	if(playerNum == 0) winControl.winner = 2;
	else winControl.winner = 1;
	
	room_goto(GameOver);
}
//show_debug_message(phy_speed_x);

if(golded){
	
	if(phy_speed_x > 0) phy_speed_x++;
	else phy_speed_x--;
	
}

//if(gamepad_axis_value(playerNum,gp_axislv) !=0 ) show_debug_message(gamepad_axis_value(playerNum,gp_axislv));
//if(gp_axislv !=0 ) show_debug_message(gp_axislv);

/*if(phy_speed_x < 0) image_xscale = -1;
else image_xscale = -1;*/


if (phy_speed_y < (jumpStartSpeed - 1) || jumpCounter > 10){
	jumping = false;
	jumpFall = true;
	//phy_speed_y = 0;
}



else if(jumping){
	var otherFoot;
	with(instance_find(bear,-1*(playerNum-1))){
	
		otherFoot = footStooled;
	
	}
	if(otherFoot){
		jumping = false;
		jumpFall = true;
	}
}


if(jumpFall){
	
	phy_speed_y += fallJerk;
	fallJerk+=0.1;
}

if(fpsMode){

	fpsTimer++;
	show_debug_message(fpsTimer);
	show_debug_message(room_speed*10);
	if(fpsTimer > room_speed*10) {
		
		fpsMode = false;
		fpsTimer = 0;
		room_speed = 60;
		instance_destroy(instance_find(fpsCounter,0));
		
	}
	
	
}

 //uncomment to send debug messages at a predetermined interval
debugTimer++;
if(debugTimer > 3*room_speed){
	//prints debug messages every 1 second
	//show_debug_message(touchingGround); 
	debugTimer = 0;
	if(playerNum == 0){
		
		show_debug_message("limit is " + string( room_speed*10));
		show_debug_message("current fps timer is: " + string(fpsTimer))
		//show_debug_message("Player " + string(playerNum) + "'s info");
	
		//show_debug_message("JumpFall is " + string(jumpFall));
	
		//show_debug_message("jumping is " + string(jumping));
	
		//show_debug_message("footstooled is " + string(footStooled));
	}
	//show_debug_message("Y speed is : " + string(phy_speed_y));
}
	
if(stunned){

	stunTimer++; 
	
	if(stunTimer > 10){
		
		stunned = false;
		stunTimer = 0;
		
	}

	
}

if(ultraAIMode) {
	
	modeTimer++;
	 if(modeTimer%3 == 0) instance_create_depth(x,y,-110000,afterImage);
	if(modeTimer >= room_speed*7) {
	
		ultraAIMode = false;
		modeTimer = 0;
		
	}
	
}