ArrayList<Branch> sticks=new ArrayList<Branch>();
void setup()
{
	size(750,750);
	frameRate(1);
	background(255,255,255);
	stroke(0,0,0);
	strokeWeight(10);
}
void draw()
{
	splitAll();
}
void splitAll()
{

}
public class Branch
{
	float x1,y1,angle,length,x2,y2;
	public Branch(float x, float y, float deg, float size)
	{
		x1=x;
		y1=y;
		angle=deg;
		length=size;
	}
	public void calculateEnd()
	{

	}
	public void show()
	{

	}
}