int leftBuffer=30;
int topBuffer=10;
int heights=50;
int data[]=new int[] {308, 118, 116, 108, 107, 72, 52, 43, 36, 38, 2}; //Ten times the percentage
String[] labels=new String[] {"JavaScript", "Ruby", "Python", "Java", "Objective-C", "PHP", "C", "C++", "Go", "CSS (Not a programming language)", ""};
Bar[] bars=new Bar[data.length];
float scale=1;
public void setup()
{
	size(675, 675);
	frameRate(90);
	int sum=0;
	int max=0;
	for(int summer=0; summer<data.length; summer++)
	{
		// if(labels[summer]==null)
		// {
		// 	labels[summer]="";
		// }
		sum+=data[summer];
		if(data[summer]>max)
		{
			max=data[summer];
		}
	}
	scale=((float)width-3*leftBuffer)/(((float)width-leftBuffer*2)/sum*max);
	for(int i=0; i<bars.length; i++)
	{
		bars[i]=new Bar(leftBuffer, topBuffer*(i+1)+i*heights, (float)(width-leftBuffer*2)/sum*data[i]*scale, heights, 360.0/sum*data[i], labels[i]);
	}
	textSize((int)((float)heights/3*2));
	textAlign(LEFT, CENTER);
}

public void draw()
{
	bg();
	for(int i=0; i<bars.length; i++)
	{
		bars[i].grow();
		bars[i].show();
	}
}

public void bg()
{
	background(100,100,100);
}

public void keyPressed()
{
	if(key==' ')
	{
		setup();
	}
}

public class Bar
{
	static final int time=240;
	int tall=0, counter=0;
	float x, y, currentWide=0, wide=0, currentAngle=0, angle=0;
	String desc="";
	public Bar(int fX, int fY, float fWide, int fTall, float fAngle, String description)
	{
		x=fX;
		y=fY;
		wide=fWide;
		tall=fTall;
		angle=fAngle;
		desc=description;
	}

	public void grow()
	{
		//grow
		if(currentAngle<angle)
		{
			currentAngle+=angle/time;
			currentWide+=wide/time;
		}
		counter++;
		if(counter>=time)
		{
			currentWide=wide;
			currentAngle=angle;
		}
	}

	public void show()
	{
		//show
		stroke(0,0,0);
		fill(255,255,255);
		rect(x, y, currentWide, tall);
		fill(200,200,200);
		arc(x+currentWide, y+tall/2, tall, tall, radians(270), radians(270+currentAngle));
		fill(0,0,0);
		text(desc, x+2, y+tall/2);
	}
}
