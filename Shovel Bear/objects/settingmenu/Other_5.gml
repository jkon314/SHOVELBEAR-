/// @description Insert description here
// You can write your code in this editor

savefile = "saveTest";

			ini_open(savefile); 

			ini_write_real("file1", "masterVolume", rectangleValues[0]);
				
			ini_write_real("file1", "deadzone", rectangleValues[1]);	

			ini_close();
			
			audio_set_master_gain(0,rectangleValues[0]);
			
			winControl.globalDeadzone = rectangleValues[1];