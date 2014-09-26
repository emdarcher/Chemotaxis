import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chemotaxis extends PApplet {

 //Bacteria Bob;
 Bacteria[] creatures;

int total_creatures_amount = 8;

int color_for_creatures = 0xff432904; //put Bob's color here

 //declare bacteria variables here   
 public void setup()   
 {     
 	size(200, 200);
 	//initialize bacteria variables here   
 	//Bob = new Bacteria((width>>1),(height>>1), color_for_Bob );//(x>>1) = x/2;
 	creatures = new Bacteria [total_creatures_amount];
 	init_creatures();

 	frameRate(10);
 }   
 public void draw()   
 {    
 	background(0);
 	//move and show the bacteria
 	show_then_move_creatures();   
 	//Bob.show();
 	//Bob.move();

 }  
 class Bacteria    
 {     
 	int B_X, B_Y;
 	int B_color;
 	int B_max_walk_dist;
 	int B_ellipse_w;

 	Bacteria(int cB_X, int cB_Y, int cB_color){
 		B_X = cB_X;	B_Y = cB_Y; B_color = cB_color;
 		B_max_walk_dist = 10;
 		B_ellipse_w = 8;
 	}
 	public void move(){
 		if((B_X < width) && (B_X >0)){
 			B_X += (int)((Math.random()*(B_max_walk_dist<<1))-B_max_walk_dist);//(x<<1) = x*2
 		} else {
 			int random_d = (int)((Math.random()*B_max_walk_dist));
 			B_X += (B_X <= 0) ? (random_d) : (0-random_d);
 		}
 		if((B_Y < width) && (B_Y >0)){
 			B_Y += (int)((Math.random()*(B_max_walk_dist<<1))-B_max_walk_dist);//(x<<1) = x*2
 		} else {
 			int random_d = (int)((Math.random()*B_max_walk_dist));
 			B_Y += (B_Y <= 0) ? (random_d) : (0-random_d);
 		}
 	}
 	public void show(){
 		fill(B_color);
 		ellipse(B_X, B_Y, B_ellipse_w, B_ellipse_w);
 	}
 }    
 public void init_creatures(){
 	//inits the creatures
 	for(int n=0;n<(creatures.length);n++){
 		int rand_Color = color(random_byte_thing(),random_byte_thing(),random_byte_thing());
 		creatures[n] = new Bacteria((width>>1),(height>>1), rand_Color );//(x>>1) = x/2;
 	}
 }
 public void show_then_move_creatures(){
 	for(int n=0;n<(creatures.length);n++){
 		creatures[n].show();
 		creatures[n].move();
 	}
 }
 public int random_byte_thing(){
 	//returns a random byte (0-255)
 	return (int)((Math.random()*256));
 }
 public void mousePressed()
{//if mouse gets pressed
	//re-initialize the creatures
	init_creatures();
	redraw();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
