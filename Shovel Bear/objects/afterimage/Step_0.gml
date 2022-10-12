/// @description Insert description here
// You can write your code in this editor

image_alpha = clamp(image_alpha - 0.01, 0, 1);
if(image_alpha <= 0.01) instance_destroy();