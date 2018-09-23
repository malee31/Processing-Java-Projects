void setup()
{
	size(500,500)
	background(0,0,0);
	noLoop();
}
void draw()
{
	clearScreen();
	
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
	//variable declarations here
	
	Die(int x, int y) //constructor
	{
		//variable initializations here
	}
	void roll()
	{
		//your code here
	}
	void show()
	{
		//your code here
	}
}
