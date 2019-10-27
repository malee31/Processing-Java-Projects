final int PARTICLE_COUNT=362;
Particle[] particles=new Particle[PARTICLE_COUNT];
boolean triggered=false;
void setup()
{
	size(750, 750);
	noStroke();
	fillArray();
}

void draw()
{
	background(5, 6, 30);
	for(int i=0; i<PARTICLE_COUNT; i++)
	{
		if (particles[i]!=null)
		{
			particles[i].move();
			particles[i].show();
		}
	}
}

void fillArray()
{
	for(int i=0; i<PARTICLE_COUNT && i<360; i++)
	{
		particles[i]=new NormalParticle(375, 375, i, 3);
	}
	particles[360]=new JumboParticle(375, 375, 0, 15);
	particles[361]=new OddballParticle(375, 375);
}

void randomRestart()
{
	for(int i=0; i<PARTICLE_COUNT && i<360; i++)
	{
		particles[i]=new NormalParticle((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*360), 3);
	}
	particles[360]=new JumboParticle(375, 375, 0, 15);
	particles[361]=new OddballParticle(375, 375);
}

void mousePressed()
{
	fillArray();
}

void keyPressed()
{
	switch(key)
	{
		case ' ':
			triggered=!triggered;
			break;
		case 'e':
			randomRestart();
			break;
	}
}

class Particle
{
	void move(){};
	void show(){};
}

class NormalParticle extends Particle
{
	protected double x, y, angleRad, speed;
	protected color colour;
	protected int moved=0;
	protected NormalParticle(double xPos, double yPos, double angleS, double sped)
	{
		//sets colors in array in rgb format from index 0-2
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
		colorSetter();
	}

	public void show()
	{
		//draws particle
		fill(colour);
		ellipse((float)x, (float)y, 5, 5);
	}

	public void colorSetter()
	{
		colour=color((int)(x/width*255), (int)(y/height/255), (int)(x*width+y*height/width*height*255)+30);
	}
}

class JumboParticle extends NormalParticle
{
	JumboParticle(double xJ, double yJ, double angleJ, double spedJ)
	{
		super(xJ, yJ, angleJ, spedJ);
	}

	void show()
	{
		if(!triggered)
		{
			fill(colour);
			ellipse((float)x, (float)y, 100, 100);
		}
		if (x==375)
		{
			angleRad=radians((float)Math.random()*360);
		}
	}
}

class OddballParticle extends Particle
{
	int phase=1, phaseCount=0;
	color colour;
	float x, y;
	OddballParticle(float xPos, float yPos)
	{
		x=xPos;
		y=yPos;
	}

	void move()
	{
		phase=phaseSetter(phaseCount, phase);
		//changes x and y if phase is 1, may go off screen. To be fixed at end if I remember
		if(phase==1)
		{
			x=(int)(Math.random()*698+26);
			y=(int)(Math.random()*698+26);
		}
		phaseCount++;
		phaseCount%=200;
		colour=color((int)(x/width*255), (int)(y/height/255), (int)(x*width+y*height/width*height*255)+30);
	}

	void show()
	{
		if(!triggered)
		{
			fill(colour);
			//fill and color now set
			int counter;
			switch(phase)
			{
				case 2:
					counter=phaseCount-9;
					rect(x-13, y-counter/5, 26, counter/2.5);
				break;
				
				case 3:
					counter=phaseCount-69;
					ellipse(x, y, 24, 24);
					rect(x-13, y+counter/5-11.3, 26, 26-counter/2.5);
				break;
				case 4:
					counter=phaseCount-129;
					ellipse(x, y, 26-counter/2.5, 26-counter/2.5);
				break;
			}
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
}