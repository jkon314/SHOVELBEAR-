/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
 //draw fillable rectangle
draw_rectangle(x,y+3*sHeight,x+100,y + 4*sHeight,1);
draw_set_color(c_red);
draw_rectangle(x,y+3*sHeight+margin,x+rectangleValues[0]*100,y + 4*sHeight,0);
draw_text(x+105,y+3*sHeight+ .5*sHeight,"%" +  string_delete(string(100*rectangleValues[0]),3,3));
draw_set_color(c_white);

draw_rectangle(x,y+5*sHeight,x+100,y + 6*sHeight,1);
draw_set_color(c_red);
draw_rectangle(x,y+5*sHeight+margin,x+rectangleValues[1]*100,y + 6*sHeight-margin,0);
draw_text(x+105,y+5*sHeight+ .5*sHeight,"%" +  string_delete(string(100*rectangleValues[1]),3,3));
draw_set_color(c_white);