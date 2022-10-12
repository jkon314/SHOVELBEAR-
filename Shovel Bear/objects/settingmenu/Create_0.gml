/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event

inputCounter = 0;
event_inherited();

rectangleValues = [];

savefile = "saveTest";
ini_open(savefile); 
rectangleValues[0] = ini_read_real("file1", "masterVolume", 0.5); // 

rectangleValues[1] =  ini_read_real("file1", "deadzone", 0.25);

//rectangleValues[0] = 0.5;

margin = 1;

inputDelay = 5;