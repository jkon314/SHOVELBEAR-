/// @description Insert description here
// You can write your code in this editor

modeTimer = 0;
ultraAIMode = false;
show_debug_message(room_speed);
stunned = false;
stunTimer = 0;
fpsMode = false;
fpsTimer = 0;
jumpCounter = 0;
mywidth = sprite_get_width(bear_idle)/2;
myheight = sprite_get_height(bear_idle);
footStooled = false;
debugTimer = 0;
jumpStartSpeed = -10;
fallJerk = 0;
touchingGround = false;
jumpFall = false;
golded = false;
knockback = 15;
jumping = false;
phy_active = true;
maxSpeed = 10;
decel = 0.35; //original value was 0.25
helmutHavin = false;
hp = 10;
myLives = 3;
enum bearStates{
	
   idle,
   
   diggin,
   hitRight,
   hitLeft,
   
   runnin,
	
}

state = bearStates.idle;



sprite[bearStates.idle] = bear_idle;
sprite[bearStates.diggin] = bear_dig;
sprite[bearStates.hitRight] = bear_hitRight;
sprite[bearStates.hitLeft] = bear_hitLeft;
phy_fixed_rotation = true;
respawning = false;


respawnTimer = 0;

function die(){
	hp = 10;
	//show_debug_message("working");
	myLives--;
	//show_debug_message("bear lives at: ");
	//show_debug_message(myLives);
	phy_position_x = room_width/2;
	phy_position_y = 0;
	x = room_width/2;
	y = 0;
	respawning = true;
	speed = 0;
	phy_speed_x = 0;
	phy_speed_y = 0;
	helmutHavin = false;
	golded = false;
	jumpFall = false;
	jumping = false;
	fallJerk = 0;
	
}