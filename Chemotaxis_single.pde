 Bacteria Bob;

color color_for_Bob = #432904; //put Bob's color here

 //declare bacteria variables here   
 void setup()   
 {     
 	size(200, 200);
 	//initialize bacteria variables here   
 	Bob = new Bacteria((width>>1),(height>>1), color_for_Bob );//(x>>1) = x/2;
 	frameRate(10);
 }   
 void draw()   
 {    
 	background(0);
 	//move and show the bacteria   
 	Bob.show();
 	Bob.move();

 }  
 class Bacteria    
 {     
 	int B_X, B_Y;
 	color B_color;
 	int B_max_walk_dist;
 	int B_ellipse_w;

 	Bacteria(int cB_X, int cB_Y, color cB_color){
 		B_X = cB_X;	B_Y = cB_Y; B_color = cB_color;
 		B_max_walk_dist = 10;
 		B_ellipse_w = 8;
 	}
 	void move(){
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
 	void show(){
 		ellipse(B_X, B_Y, B_ellipse_w, B_ellipse_w);
 	}
 }    