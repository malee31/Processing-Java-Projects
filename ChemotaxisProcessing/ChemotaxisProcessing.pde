int goalX=(int)(Math.random()*501);
int goalY=(int)(Math.random()*501);
int showLimit=10;
Bacteria[] petriDish=new Bacteria[500];
void setup()
{
	size(500, 500);
	init();
}
void draw()
{
	//make them follow mouse
	goalX=mouseX;
	goalY=mouseY;
	screenClearer();
	fill(255, 255, 255);
	ellipse(goalX, goalY, 20, 20);
	for (int go=0; go<Math.min(showLimit, petriDish.length); go++)
	{
		if(go<Math.min(showLimit, petriDish.length))
		{
			petriDish[go].move();
		}
		petriDish[go].show();
	}
}
void init()
{
	for (int i=0; i<petriDish.length; i++)
	{
		petriDish[i]=new Bacteria(randPos(), randPos(), randColor(), randColor(), randColor());
		petriDish[i].move();
		// petriDish[i].show();
	}
}
void screenClearer()
{
	noStroke();
	background(0, 0, 0, 0.5);
	//rect(0, 0, 500, 500, 0.5);
}
class Bacteria
{
	int x, y;
	color colour=0;
	static final float backChance=0.2;
	static final int rangeLimit=20;
	Bacteria(int xPosInit, int yPosInit, int red, int green, int blue)
	{
		x=xPosInit;
		y=yPosInit;
		colour=color(red, green, blue);
	}
	void move()
	{
		boolean opposite=Math.random()<backChance||dist(x, y, goalX, goalY)<=rangeLimit;
		if (goalX>x&&!opposite)
		{
			x+=(int)(Math.random()*11);
		}
		else
		{
			x-=(int)(Math.random()*11);
		}
		if (goalY>y&&!opposite)
		{
			y+=(int)(Math.random()*11);
		}
		else
		{
			y-=(int)(Math.random()*11);	
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
void keyPressed()
{
	if(key==' ')
	{
		init();
		showLimit=Math.max(0, (int)(showLimit*0.9));
	}
	else if(key=='e'||key=='E')
	{
		showLimit+=10;
	}
}