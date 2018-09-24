void setup()
{
	size(500,500);
	background(0,0,0);
	noLoop();
}
void draw()
{
	clearScreen();
	Die a=new Die(200,200);
	
}
void clearScreen()
{
	fill(0,0,0);
	rect(0,0,500,500);
}
void mousePressed()
{
	redraw();
}
class Die //models one single dice cube
{
	int diceNum,xPos,yPos;
	
	Die(int x, int y) //constructor
	{
		xPos=x;
		yPos=y;

	}
	void roll()
	{
		diceNum=(int)(Math.random()*6+1);
	}
	void show()
	{
		stroke(0,0,0);
		fill(255,255,255);
		rect(xPos,yPos,100,100);
		if (diceNum%2==1)
		{
			dotDrawer(50,50);
		}
		else if (diceNum%2==1&&diceNum!=4)
		{
			dotDrawer(35,50);
			dotDrawer(65,50);
		}
		if (diceNum==3||diceNum==5)
		{
			dotDrawer(20,20);
			dotDrawer(80,80);
		}
		if (diceNum==5)
		{
			dotDrawer(20,80);
			dotDrawer(80,20);
		}
		if (diceNum==4)
		{
			dotDrawer(35,35);
			dotDrawer(35,65);
			dotDrawer(65,35);
			dotDrawer(65,65);
		}
		if (diceNum==6)
		{
			dotDrawer(35,25);
			dotDrawer(35,75);
			dotDrawer(65,25);
			dotDrawer(65,75);
		}
	}
	void dotDrawer(int x,int y)
	{
		fill(0,0,0);
		ellipse(x,y,10,10);
	}
}
