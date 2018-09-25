int goalX=(int)(Math.random()*501);
int goalY=(int)(Math.random()*501);
final int BACTERIA_NUM=	1;
Bacteria[] petriDish=new Bacteria[];
 void setup()   
 {
 	size(500,500);
 }
 void draw()   
 {
 	screenClearer();
 	//Bacteria params: x, y, red, green, blue...
 	for (int i=0; i<BACTERIA_NUM; i++)
 	{
	 	petriDish.push(new Bacteria(250,250,255,0,0));
	 	petriDish[i].move();
	 	petriDish[i].show();
	}
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
 		if (goalX>x)
 		{
 			x+=(int)(Math.random()*10+1);
 		}
 		else
 		{
 			x-=(int)(Math.random()*10+1);
 		}
 		if (goalY>y)
 		{
 			y+=(int)(Math.random()*10+1);
 		}
 		else
 		{
 			y-=(int)(Math.random()*10+1);	
 		}
 		print(x+", "+y);
 	}
 	void show()
 	{
 		stroke(0,0,0);
 		fill(colour[0],colour[1],colour[2],277);
 		ellipse(x,y,10,10);
 	}
 }
 void mousePressed()
 {
 	goalX=mouseX;
 	goalY=mouseY;
 }