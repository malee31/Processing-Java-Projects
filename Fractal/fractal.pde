ArrayList<FractalPiece> fractals=new ArrayList<FractalPiece>();
final int sizeLimit=1;
int pause=0, count=0;
void setup()
{
	fractals.add(new FractalPiece(250,250,400));
	fractals.get(0).setColor(randCol());
	background(0,0,0);
	size(500,500);
	frameRate(2);
}
void draw()
{
	reset();
	fill(0,0,0);
	rect(0,0,500,500);
	splitter(count);
	for(int i=0; i<fractals.size(); i++)
	{
		fractals.get(i).show();
	}
	count++;
}
int[] randCol()
{
	int[] rand=new int[3];
	for(int i=0; i<rand.length; i++)
	{
		rand[i]=(int)(Math.random()*256);
	}
	return rand;
}
void splitAll(float smallest)
{
	//splits all fractals of the size and puts them in the arrayList
	int originalSize=fractals.size();
	for(int i=0; i<originalSize; i++)
	{
		int[] newCol=randCol();
		FractalPiece thisOne=fractals.get(i);
		if(thisOne.getSize()==smallest)
		{
			for(int x=0; x<2; x++)
			{
				for(int y=0; y<2; y++)
				{
					fractals.add(new FractalPiece(thisOne.getX()-thisOne.getSize()/2+thisOne.getSize()*x,thisOne.getY()-thisOne.getSize()/2+thisOne.getSize()*y,thisOne.getSize()/2));
					fractals.get(fractals.size()-1).setColor(newCol);
				}
			}
		}
	}
}
// int looper(int x, int y)
// {
// 	x++;
// 	y++;
// 	int returnee=x*y;
// 	if(x==2&&y==1)
// 	{
// 		returnee=3;
// 	}
// 	return returnee-1;
// }
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
	int colorz=color(255,255,255);
	float x,y,size,scaleFactor=0.1;
	public FractalPiece(float xPo, float yPo, float sizeA)
	{
		x=xPo;
		y=yPo;
		size=sizeA;
	}
	public void setColor(int[] cols){colorz=color(cols[0],cols[1],cols[2]);}
	public float getX(){return x;}
	public float getY(){return y;}
	public float getSize(){return size;}
	public void show()
	{
		//Draws hollow square with center x,y
		fill(colorz);
		noStroke();
		//top rect
		rect(x-size/2,y-size/2,size,size*scaleFactor);
		//bottom rect
		rect(x-size/2,y+size/2-size*scaleFactor,size,size*scaleFactor);
		rect(x-size/2,y-size/2,size*scaleFactor,size);
		rect(x+size/2-size*scaleFactor,y-size/2,size*scaleFactor,size);
		
	}
}
void splitter(int a)
{
	if(a!=0)
	{
		if(pause>=2&&findSmallestSize()<sizeLimit)
		{
			reset();
			count=0;
		}
		else if(findSmallestSize()<sizeLimit)
		{
			pause++;
		}
		else
		{
			splitAll(findSmallestSize());
		}
		splitter(a-1);
	}
}
void reset()
{
	fractals.clear();
	fractals.add(new FractalPiece(250,250,400));
	fractals.get(0).setColor(randCol());
	pause=0;
}