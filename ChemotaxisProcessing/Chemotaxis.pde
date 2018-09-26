int goalX=(int)(Math.random()*501);
int goalY=(int)(Math.random()*501);
final int START_BACTERIA_NUM=5;
Bacteria[] petriDish=new Bacteria[300];
 void setup()   
 {
 	size(500,500);
 }
 void draw()   
 {
 	//make them follow mouse
	goalX=mouseX;
 	goalY=mouseY;
 	screenClearer();
 	if (petriDish[0]==null)
 	{
	 	//Bacteria params: x, y, red, green, blue...
	 	for (int i=0; i<START_BACTERIA_NUM; i++)
	 	{
		 	petriDish[i]=new Bacteria(randPos(),randPos(),randColor(),randColor(),randColor());
		 	petriDish[i].move();
		 	petriDish[i].show();
		}
	}
	for (int go=0; go<petriDish.length; go++)
	{
		if (petriDish[go]==null)
		{
			break;
		}
		else
		{
			petriDish[go].move();
			petriDish[go].show();
		}
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
 	}
 	void show()
 	{
 		stroke(0,0,0);
 		fill(colour[0],colour[1],colour[2],277);
 		ellipse(x,y,10,10);
 	}
 }
 int randColor()
 {
 	return (int)(Math.random()*256);
 }
 void aNewBac()
 {
 	for (int i=0; i<petriDish.length; i++)
 	{
 		if(petriDish[i]==null)
 		{
 			print("new!");
 			petriDish[i]=new Bacteria(randPos(),randPos(),randColor(),randColor(),randColor());
 			break;
 		}
 	}
 }
 int randPos()
 {
 	return (int)(Math.random()*500);
 }
 /*
 void mousePressed()
 {
 	goalX=mouseX;
 	goalY=mouseY;
 }
No longer in use since the mouse moving part.
 */
 void mousePressed()
 {
 	aNewBac();
 }
