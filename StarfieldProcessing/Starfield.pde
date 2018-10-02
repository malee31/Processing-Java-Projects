Particle[] particles=new Particle[100];
void setup()
{
	size(750,750);
	background(19,24,98);
}
void draw()
{
	reset();
	//your code here
}
class NormalParticle
{
	//your code here
	double x,y,angle,speed;
	int[] colorArr=new int[3];
	NormalParticle(int red, int green, int blue, double xPos, double yPos)
	{
		colorArr[0]=red;
		colorArr[1]=green;
		colorArr[2]=blue;
		
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