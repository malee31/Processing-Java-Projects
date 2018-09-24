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
	a.roll();
	a.show();
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
	Die(int x, int y)
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
			dotDrawer(xPos+50,yPos+50);
		}
		else if (diceNum==6||diceNum==2)
		{
			dotDrawer(xPos+35,yPos+50);
			dotDrawer(xPos+65,yPos+50);
		}
		if (diceNum==3||diceNum==5)
		{
			dotDrawer(xPos+20,yPos+20);
			dotDrawer(xPos+80,yPos+80);
		}
		if (diceNum==5)
		{
			dotDrawer(xPos+20,yPos+80);
			dotDrawer(xPos+80,yPos+20);
		}
		if (diceNum==4)
		{
			dotDrawer(xPos+35,yPos+35);
			dotDrawer(xPos+35,yPos+65);
			dotDrawer(xPos+65,yPos+35);
			dotDrawer(xPos+65,yPos+65);
		}
		if (diceNum==6)
		{
			dotDrawer(xPos+35,yPos+25);
			dotDrawer(xPos+35,yPos+75);
			dotDrawer(xPos+65,yPos+25);
			dotDrawer(xPos+65,yPos+75);
		}
		print(diceNum);
	}
	void dotDrawer(int x,int y)
	{
		fill(0,0,0);
		ellipse(x,y,10,10);
	}
}
