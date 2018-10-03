Particle[] particles=new Particle[100];
NormalParticle test=new NormalParticle(255,255,255,500,500,20);
void setup()
{
	size(750,750);
	background(19,24,98);
	/*
	for(var i=0; i<100; i++)
	{
		particle[i]=new Particle(255,255,255,500,500);
	}
	*/
}
void draw()
{
	reset();
	//your code here
	test.show();
}
class NormalParticle
{
	//your code here
	double x,y,angle,speed;
	int[] colorArr=new int[3];
	NormalParticle(int red, int green, int blue, double xPos, double yPos, double angleS)
	{
		colorArr[0]=red;
		colorArr[1]=green;
		colorArr[2]=blue;
		x=xPos;
		y=yPos;
		angle=angleS;
	}
	void move()
	{

	}
	void show()
	{
		stroke(0,0,0);
		fill(colorArr[0],colorArr[1],colorArr[2]);
		ellipse((float)x,(float)y, 100, 100);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}
void reset()
{
	noStroke();
	fill(19,24,98);
	rect(0,0,750,750);

}