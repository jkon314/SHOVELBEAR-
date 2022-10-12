/// @description Insert description here
// You can write your code in this editor

nuclearWinter = false;

savefile = "saveTest";
ini_open(savefile); 
audio_set_master_gain(0,ini_read_real("file1", "masterVolume", 50))  

globalDeadzone = ini_read_real("file1", "deadzone",0.25);
