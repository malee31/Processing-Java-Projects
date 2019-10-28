Particle[] particles=new Particle[720];
boolean hideOddball=false;
Particle oddball=new OddballParticle(width/2, height/2);
void setup()
{
	size(750, 750);
	noStroke();
	fillArray();
}

void draw()
{
	background(5, 6, 30);
	for(int i=0; i<particles.length; i++)
	{
		particles[i].move();
		particles[i].show();
	}
	oddball.move();
	oddball.show();
}

void fillArray()
{
	for(int i=0; i<particles.length/2; i++)
	{
		particles[i]=new NormalParticle(width/2, width/2, i, 3);
	}
	for(int ii=particles.length/2; ii<particles.length; ii++)
	{
		particles[ii]=new JumboParticle(width/2, width/2, ii, 6);
	}
	oddball=new OddballParticle(width/2, width/2);
}

void randomRestart()
{
	for(int i=0; i<particles.length && i<360; i++)
	{
		particles[i]=new NormalParticle((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*360), 3);
	}
	particles[360]=new JumboParticle(width/2, width/2, 0, 15);
	particles[361]=new OddballParticle(width/2, width/2);
	for(int i=0; i<particles.length/2; i++)
	{
		particles[i]=new NormalParticle((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*360), 3);
	}
	for(int ii=particles.length/2; ii<particles.length; ii++)
	{
		particles[ii]=new JumboParticle((int)(Math.random()*width), (int)(Math.random()*height), (int)(Math.random()*360), 6);
	}
	oddball=new OddballParticle(width/2, width/2);
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
			hideOddball=!hideOddball;
			break;
		case 'e':
			randomRestart();
			hideOddball=true;
	}
}

class Particle
{
	double x, y;
	color colour;
	void move(){};
	void show(){};
	public void colorSetter()
	{
		colour=color((int)(x/width*255), (int)(y/height/255), (int)(dist(width/2, height/2, (float)x, (float)y)/dist(0, 0, width, height)*255));
	}
}

class NormalParticle extends Particle
{
	protected double angleRad, speed;
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
		if(moved>530||(hideOddball&&(x>800||x<-50||y>800||y<-50)))
		{
			x=width/2;
			y=width/2;
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
}

class JumboParticle extends NormalParticle
{
	JumboParticle(double xJ, double yJ, double angleJ, double spedJ)
	{
		super(xJ, yJ, angleJ, spedJ);
	}

	void show()
	{
		fill(colour);
		ellipse((float)x, (float)y, 30, 30);
		if (x==width/2)
		{
			angleRad=radians((float)Math.random()*360);
		}
	}
}

class OddballParticle extends Particle
{
	int phase=1, phaseCount=0;
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
		colorSetter();
	}

	void show()
	{
		if(!hideOddball)
		{
			fill(colour);
			//fill and color now set
			int counter;
			switch(phase)
			{
				case 2:
					counter=phaseCount-9;
					rect((float)x-13, (float)y-counter/5, 26, counter/2.5);
				break;
				
				case 3:
					counter=phaseCount-69;
					ellipse((float)x, (float)y, 24, 24);
					rect((float)x-13, (float)y+counter/5-11.3, 26, 26-counter/2.5);
				break;
				case 4:
					counter=phaseCount-129;
					ellipse((float)x, (float)y, 26-counter/2.5, 26-counter/2.5);
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