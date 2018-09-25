//declare bacteria variables here
 void setup()   
 {
 	size(500,500);
 }
 void draw()   
 {
 	screenClearer();
 	//Bacteria params: x, y, red, green, blue...
 	Bacteria bac=new Bacteria(250,250,255,0,0);
 	bac.move();
 	bac.show();
 }
 void screenClearer()
 {
 	noStroke();
 	fill(255,255,255);
 	rect(0,0,500,500);
 }
 class Bacteria    
 {
 	int x, y;
 	int colour[]=new int[3];
 	Bacteria(int xPosInit, int yPosInit, int red, int green, int blue)
 	{
 		x=xPosInit;
 		y=yPosInit;
 		colour[0]=red;
 		colour[1]=blue;
 		colour[2]=green;
 	}
 	void move()
 	{
 		x+=(int)(Math.random()*10+1);
 		y+=(int)(Math.random()*10+1);
 	}
 	void show()
 	{
 		stroke(0,0,0);
 		fill(colour[0],colour[1],colour[2],277);
 		ellipse(x,y,10,10);
 	}
 }