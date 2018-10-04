final int particleCount=100;
Particle[] particles=new Particle[particleCount];
NormalParticle test=new NormalParticle(255,255,255,375,375,20,20);
void setup()
{
	size(750,750);
	background(19,24,98);
	/*
	for(var i=0; i<particleCount; i++)
	{
		particle[i]=new Particle(255,255,255,500,500);
	}
	*/
}
void draw()
{
	reset();
	test.show();
	test.move();
	/*
	for(var i=0; i<particleCount; i++)
	{
		particle[i].move();
		particle[i].show();
	}
	*/
}
class NormalParticle
{
	//variables required
	double x,y,angleRad,speed;
	int[] colorArr=new int[3];
	NormalParticle(int red, int green, int blue, double xPos, double yPos, double angleS, double sped)
	{
		//sets colors in array in rgb format from index 0-2
		colorArr[0]=red;
		colorArr[1]=green;
		colorArr[2]=blue;
		//sets start position
		x=xPos;
		y=yPos;
		//set start speed
		speed=sped;
		//makes the angle used become radians
		angleRad=Math.toRadians(angleS);
	}
	public void move()
	{
		if(x>1000||x<-100||y>1000||y<-100)
		{
			x=375;
			y=375;
		}
		x+=(double)(cos((float)angleRad)*(float)speed);
		y+=(double)(sin((float)angleRad)*(float)speed);
	}
	public void show()
	{
		//draws particle
		stroke(0,0,0);
		fill(colorArr[0],colorArr[1],colorArr[2]);
		ellipse((float)x,(float)y, 100, 100);
	}
}
interface Particle
{
	void move();
	void show();
}
class OddballParticle implements Particle
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}
void reset()
{
	//clears screen
	noStroke();
	fill(19,24,98);
	rect(0,0,750,750);

}
