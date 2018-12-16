ArrayList<Branch> sticks=new ArrayList<Branch>();
void setup()
{
	size(750,750);
	frameRate(1);
	background(255,255,255);
	stroke(0,0,0);
	strokeWeight(10);
	sticks.add(new Branch(370,300,90,50));
}
void draw()
{
	int temp=sticks.size();
	for(int i=0; i<sticks.size(); i++)
	{
		sticks.get(i).show();
		sticks.get(i).split();
	}
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
	public void show()
	{
		//quad(x1,y1,
	}
	public void split()
	{
		
	}
}
