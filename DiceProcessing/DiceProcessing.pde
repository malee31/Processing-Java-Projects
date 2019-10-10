int screenBuffer=50;
Die[][] die;
int sum=0;
int sizes=100;
int counted=0;
void setup()
{
	size(500, 550);
	background(0, 0 ,0);
	textAlign(CENTER, CENTER);
	textSize(25);
	noLoop();
}
void draw()
{
	clearScreen();
	die = new Die[5][5];
	sum=0;
	counted=0;
	for (int row=0; row<5; row++)
	{
		for (int col=0; col<5; col++)
		{
			die[row][col]=new Die(row*sizes, col*sizes+screenBuffer);
			die[row][col].roll();
			die[row][col].show();
			sum+=die[row][col].getVal();
			counted++;
		}
	}
	fill(175);
	rect(0, 0, width, screenBuffer, screenBuffer*0.2);
	fill(255);
	text("Total: "+sum+"     Average: "+(float)sum/counted, width/2, screenBuffer/2);
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
				dotDrawer(xPos+25, yPos+25);
				dotDrawer(xPos+25, yPos+75);
				dotDrawer(xPos+75, yPos+25);
				dotDrawer(xPos+75, yPos+75);
				dotDrawer(xPos+25, yPos+50);
				dotDrawer(xPos+75, yPos+50);
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
			case 2:
				dotDrawer(xPos+20, yPos+20);
				dotDrawer(xPos+80, yPos+80);
			case 1:
				if(diceNum==2) break;
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
