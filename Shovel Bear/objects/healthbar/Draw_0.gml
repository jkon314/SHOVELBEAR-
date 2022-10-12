/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_red);
draw_rectangle(x,y+sprite_height*(1-hpRatio),x+sprite_width,y+sprite_height,0);
draw_set_color(c_white);
draw_sprite(bar,0,x,y);