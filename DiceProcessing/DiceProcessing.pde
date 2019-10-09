void setup()
{
	size(500, 500);
	background(0, 0 ,0);
	noLoop();
}
void draw()
{
	clearScreen();
	Die[][] die = new Die[5][5];
	for (int row=0; row<=500; row+=100)
	{
		for (int col=0; col<=500; col+=100)
		{
			die[underZero(row/100-1)][underZero(col/100-1)]=new Die(row, col);
			((Die)die[underZero(row/100-1)][underZero(col/100-1)]).roll();
			((Die)die[underZero(row/100-1)][underZero(col/100-1)]).show();
		}
	}
}
void clearScreen()
{
	fill(0, 0, 0);
	rect(0, 0, 500, 500);
}
void mousePressed()
{
	redraw();
}
int underZero(int num)
{
	if (num<0)
	{
		return 0;
	}
	else
	{
		return num;
	}
}
class Die
{
	private int diceNum, xPos, yPos, rectSize=100, roundFactor=10, dotSize=(int)(rectSize*0.1);
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
		stroke(0, 0, 0);
		fill((int)(Math.random()*200+55), (int)(Math.random()*200+55), (int)(Math.random()*200+55));
		rect(xPos, yPos, rectSize, rectSize, roundFactor);
		switch(diceNum)
		{
			case 6:
				dotDrawer(xPos+35, yPos+25);
				dotDrawer(xPos+35, yPos+75);
				dotDrawer(xPos+65, yPos+25);
				dotDrawer(xPos+65, yPos+75);
			case 2:
				dotDrawer(xPos+35, yPos+50);
				dotDrawer(xPos+65, yPos+50);
				break;
			case 4:
				dotDrawer(xPos+20, yPos+80);
				dotDrawer(xPos+80, yPos+20);
				dotDrawer(xPos+20, yPos+20);
				dotDrawer(xPos+80, yPos+80);
				break;
			case 5:
				dotDrawer(xPos+20, yPos+80);
				dotDrawer(xPos+80, yPos+20);
			case 3:
				dotDrawer(xPos+20, yPos+20);
				dotDrawer(xPos+80, yPos+80);
			case 1:
				dotDrawer(xPos+50, yPos+50);
				break;
			default:
				println("Not a valid number for a D6 die.");
		}
	}
	void dotDrawer(int x,int y)
	{
		fill(0, 0, 0);
		ellipse(x, y, 10, 10);
	}
	int getVal()
	{
		return diceNum;
	}
}
