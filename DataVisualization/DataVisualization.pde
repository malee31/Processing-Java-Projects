int leftBuffer=20;

public void setup()
{
  size(500,500);
  background(100,100,100);
}
public void draw()
{
	fill(100,100,100);
	rect(0, 0, width, height);
	
}
public class bar
{
	int wide=0, tall=0, currentWide=0, currentTall=0, radius=0, counter=0;
	float x, y, angle=0, currentAngle=0;
	public bar(float fX, float fY, int fWide, int fTall, int fRadius, float fAngle)
	{
		x=fY;
		y=fY;
		wide=fWide;
		tall=fTall;
		angle=fAngle;
		radius=fRadius;
	}
	public void grow()
	{
		//grow
	}
	public void show()
	{
		//show (x+leftBuffer, y, currentWide, currentTall)
		
	}
}