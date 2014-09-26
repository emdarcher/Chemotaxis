Bacteria[] creatures;
int total_creatures_amount = 8;

 //declare bacteria variables here   
 void setup() {     
 	size(200, 200);
 	//initialize bacteria variables here 
 	creatures = new Bacteria [total_creatures_amount];
 	init_creatures();
 	frameRate(10);
 }   
 void draw() {    
 	background(0);
 	//move and show the bacteria
 	show_then_move_creatures();
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
 			B_X += (B_X <= 0) ? (random_d) : (0-random_d); //hooray for ternary operator!
 		}
 		if((B_Y < width) && (B_Y >0)){
 			B_Y += (int)((Math.random()*(B_max_walk_dist<<1))-B_max_walk_dist);//(x<<1) = x*2
 		} else {
 			int random_d = (int)((Math.random()*B_max_walk_dist));
 			B_Y += (B_Y <= 0) ? (random_d) : (0-random_d); //hooray for ternary operator!
 		}
 	}
 	void show(){
 		fill(B_color);
 		ellipse(B_X, B_Y, B_ellipse_w, B_ellipse_w);
 	}
 }    
 void init_creatures(){
 	//inits the creatures
 	for(int n=0;n<(creatures.length);n++){
 		color rand_Color = color(random_byte_thing(),random_byte_thing(),random_byte_thing());
 		creatures[n] = new Bacteria((width>>1),(height>>1), rand_Color );//(x>>1) = x/2;
 	}
 }
 void show_then_move_creatures(){
 	for(int n=0;n<(creatures.length);n++){
 		creatures[n].show();
 		creatures[n].move();
 	}
 }
 int random_byte_thing(){
 	//returns a random byte (0-255)
 	return (int)((Math.random()*256));
 }
 void mousePressed()
{//if mouse gets pressed
	//re-initialize the creatures
	init_creatures();
	redraw();
}