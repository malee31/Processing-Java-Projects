int goalX=(int)(Math.random()*501);
int goalY=(int)(Math.random()*501);
int showLimit=5;
Bacteria[] petriDish=new Bacteria[300];
 void setup()   
 {
 	size(500, 500);
 	for (int i=0; i<petriDish.length; i++)
 	{
	 	petriDish[i]=new Bacteria(randPos(), randPos(), randColor(), randColor(), randColor());
	 	petriDish[i].move();
	 	petriDish[i].show();
	}
 }
 void draw()   
 {
 	//make them follow mouse
	goalX=mouseX;
 	goalY=mouseY;
 	screenClearer();
 	for (int go=0; go<Math.min(showLimit, petriDish.length); go++)
	{
		if(go<Math.min(showLimit, petriDish.length))
		{
			petriDish[go].move();
		}
		petriDish[go].show();
	}
 }
 void screenClearer()
 {
 	noStroke();
 	fill(0, 0, 0);
 	// rect(0, 0, 500, 500, 0.5);
 }
 class Bacteria    
 {
 	int x, y;
 	color colour=0;
 	Bacteria(int xPosInit, int yPosInit, int red, int green, int blue)
 	{
 		x=xPosInit;
 		y=yPosInit;
 		colour=color(red, green, blue);
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
 	}
 	void show()
 	{
 		noStroke();
 		fill(colour);
 		ellipse(x, y, 10, 10);
 	}
 }

 int randColor()
 {
 	return (int)(Math.random()*256);
 }
 int randPos()
 {
 	return (int)(Math.random()*width);
 }
 void mousePressed()
 {
 	showLimit++;
 }