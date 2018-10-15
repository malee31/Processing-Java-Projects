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
		angleRad=radians((float)angleS);
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
	int phase=1, phaseCount=0;
	int[] colorOdd=new int[3];
	float x, y;
	OddballParticle(int red, int green, int blue, float xPos, float yPos)
	{
		x=xPos;
		y=yPos;
		colorOdd[0]=red;
		colorOdd[1]=blue;
		colorOdd[2]=green;
	}
	void move()
	{
		phase=phaseSetter(phaseCount, phase);
		//changes x and y if phase is 1, may go off screen. To be fixed at end if I remember
		if(phase==1)
		{
			x=(int)(Math.random()*698+26);
			y=(int)(Math.random()*698+26);
			println("rand");
		}
		phaseCount++;
		phaseCount%=200;
	}
	void show()
	{
		if(!triggered)
		{
			stroke(0,0,0);
			fill(colorOdd[0],colorOdd[1],colorOdd[2]);
			//fill and color now set
			int counter;
			switch(phase)
			{
				case 2:
					counter=phaseCount-9;
					rect(x-13,y-counter/5,26,counter/2.5);
				break;
				
				case 3:
					counter=phaseCount-69;
					ellipse(x,y,24,24);
					rect(x-13,y+counter/5-11.3,26,26-counter/2.5);
				break;
				case 4:
					counter=phaseCount-129;
					ellipse(x,y,26-counter/2.5,26-counter/2.5);
				break;
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
			angleRad=radians((float)Math.random()*360);
		}
	}
}
void reset()
{
	//clears screen
	noStroke();
	//fill(19,24,98);
	fill(0,0,0);
	rect(0,0,750,750);

}
void coverCenter()
{
	noStroke();
	fill(0,0,0);
	ellipse(375, 375, 20, 20);
	fill(255,255,255);
}
void fillArray()
{
	for(int i=0; i<PARTICLE_COUNT&&i<360; i++)
	{
		particles[i]=new NormalParticle(255,255,255,375,375,i,10);
	}
	particles[360]=new JumboParticle(255,255,255,375,375,0,15);
	particles[361]=new OddballParticle(255,255,255,375,375);
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
int phaseSetter(int phaseCounter, int phaseNow)
{
	switch(phaseCounter)
	{
		case 0:
			phaseNow=1;
			//recalculate pos phase
		break;
		case 10:
			phaseNow=2;
			//start drawing growing square
		break;
		case 70:
			phaseNow=3;
			//start shrinking square
		break;
		case 130:
			phaseNow=4;
			//only the ball
		break;
	}
	return phaseNow;
}
