final int PARTICLE_COUNT=362;
Particle[] particles=new Particle[PARTICLE_COUNT];
boolean triggered=false;
void setup()
{
	size(750,750);
	background(19,24,98);
	fillArray();
}
void draw()
{
	reset();
	for(int i=0; i<PARTICLE_COUNT; i++)
	{
		if (particles[i]!=null)
		{
			particles[i].move();
			particles[i].show();
		}
	}
	coverCenter();
}
class NormalParticle implements Particle
{
	//variables required
	protected double x,y,angleRad,speed;
	protected int[] colorArr=new int[3];
	protected int moved=0;
	protected NormalParticle(int red, int green, int blue, double xPos, double yPos, double angleS, double sped)
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
		if(moved>530||(triggered&&(x>800||x<-50||y>800||y<-50)))
		{
			x=375;
			y=375;
			moved=0;
		}
		else
		{
			x+=(double)(cos((float)angleRad)*(float)speed);
			y+=(double)(sin((float)angleRad)*(float)speed);
			moved+=speed;
		}
	}
	public void show()
	{
		//draws particle
		stroke(0,0,0);
		fill(colorArr[0],colorArr[1],colorArr[2]);
		ellipse((float)x,(float)y, 20, 20);
	}
}
interface Particle
{
	void move();
	void show();
}
class OddballParticle implements Particle
{
	OddballParticle()
	{
		
	}
	void move()
	{
		
	}
	void show()
	{
		
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle(int r, int g, int b, double xJ, double yJ, double angleJ, double spedJ)
	{
		super(r,g,b,xJ,yJ,angleJ,spedJ);
	}
	void show()
	{
		if(!triggered)
		{
			stroke(0,0,0);
			fill(colorArr[0],colorArr[1],colorArr[2]);
			ellipse((float)x,(float)y, 100, 100);
		}
		if (x==375)
		{
			angleRad=Math.toRadians(Math.random()*360);
		}
	}
}
void reset()
{
	//clears screen
	noStroke();
	fill(19,24,98);
	rect(0,0,750,750);

}
void coverCenter()
{
	noStroke();
	ellipse(375, 375, 20, 20);
}
void fillArray()
{
	for(int i=0; i<PARTICLE_COUNT&&i<360; i++)
	{
		particles[i]=new NormalParticle(255,255,255,375,375,i,10);
	}
	particles[360]=new JumboParticle(255,255,255,375,375,0,15);
	//particles[360]=new OddballParticle(255,255,255,375,375,20,20);
}
void mousePressed()
{
	fillArray();
}
void keyPressed()
{
	if (key==' ')
	{
		triggered=!triggered;
	}
}