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
		angleRad=radians(angleS);
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
	int telelimit, phase=1;
	int[] colorOdd=new int[3];
	float x, y;
	OddballParticle(int red, int green, int blue, int telemax, float xPos, float yPos)
	{
		x=xPos;
		y=yPos;
		colorOdd[0]=red;
		colorOdd[1]=blue;
		colorOdd[2]=green;
		telelimit=telemax;
	}
	void move()
	{
		//changes x and y if phase is 1, may go off screen. To be fixed at end if I remember
		if(phase==1)
		{
			x+=inLimit(signChoose(telelimit));
			y+=inLimit(signChoose(telelimit));
		}
		phase++;
	}
	void show()
	{
		if(!triggered)
		{
			stroke(0,0,0);
			fill(colorOdd[0],colorOdd[1],colorOdd[2]);
			if(phase==1)
			{
				ellipse(x, y, 5, 5);
			}
		}
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
	//particles[360]=new OddballParticle(255,255,255,50,375,375);
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
int signChoose(int num)
{
	if (Math.random()<0.5)
	{
		return num*(-1);
	}
	else
	{
		return num;
	}
}
double inLimit(double numb)
{
	return Math.random()*(numb-1)+1;
}
int phaseSetter(int phaseCounter, int phaseNow)
{
	switch(phaseCounter)
	{
		case 0:
			phaseNow=1;
		break;
		case 60:
			phaseNow=2;
		break;
		case 120:
			
		break;	
	}
	return phaseNow;
}
