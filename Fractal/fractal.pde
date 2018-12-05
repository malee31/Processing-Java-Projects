ArrayList<FractalPiece> fractals=new ArrayList<FractalPiece>();
void setup()
{
	fractals.add(new FractalPiece(250,250,400));
	background(0,0,0);
	size(500,500);
	noLoop();
}
void draw()
{
	for(int i=0; i<fractals.size(); i++)
	{
		fractals.get(i).show();
	}
}
void splitAll(float smallest)
{
	//splits all fractals of the size and puts them in the arrayList

}
float findSmallestSize()
{
	//returns the size of the smallest fractals
	float smallest=fractals.get(0).getSize();
	for(int i=1; i<fractals.size(); i++)
	{
		if(fractals.get(i).getSize()<smallest)
		{
			smallest=fractals.get(i).getSize();
		}
	}
	return smallest;
}
public class FractalPiece
{
	//centerx, centery, and size
	float x,y,size,scaleFactor=0.1;
	public FractalPiece(int xPo, int yPo, int sizeA)
	{
		x=xPo;
		y=yPo;
		size=sizeA;
	}
	public float getX(){return x;}
	public float getY(){return y;}
	public float getSize(){return size;}
	public void show()
	{
		//Draws hollow square with center x,y
		fill(255,255,255);
		noStroke();
		//top rect
		rect(x-size/2,y-size/2,size,size*scaleFactor);
		//bottom rect
		rect(x-size/2,y+size/2-size*scaleFactor,size,size*scaleFactor);
		rect(x-size/2,y-size/2,size*scaleFactor,size);
		rect(x+size/2-size*scaleFactor,y-size/2,size*scaleFactor,size);
		
	}
}
void mousePressed()
{
	splitAll(findSmallestSize());
}