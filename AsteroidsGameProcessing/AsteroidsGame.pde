Spaceship ship;
Star[] stars=new Star[100];
ArrayList<Asteroid> rocks=new ArrayList<Asteroid>();
ArrayList<Bullet> bullets=new ArrayList<Bullet>();
ArrayList<int> nums=new ArrayList<int>();
int rockCount=30;
//counts whatever
int arbitCounter=0;
int score=0;
int highscore=0;
//this num/60 is the num of secs bullets last for
int bulletFrameLife=300;
public void setup() 
{
	size(1000,1000);
	resetAll();
}
public void resetAll()
{
	ship=new Spaceship();
	ship.setX(500);
	ship.setY(500);
	for(int i=0; i<stars.length;i++)
	{
		stars[i]=new Star();
	}
	rocks.clear();
	for(int ii=0;ii<rockCount;ii++)
	{
		rocks.add(new Asteroid());
	}
	bullets.clear();
	collisionDetect();
	if(ship.going==false)
	{
		ship.going=true;
		resetAll();
	}
}
public void randAsteroid()
{
	rocks.add(new Asteroid());
	for(int i=0; i<rocks.size(); i++)
	{
		if(rocks.get(i).crudeDetect(ship.getX(),ship.getY()))
		{
			rocks.remove(i);
			randAsteroid();
		}
	}
}
public void draw() 
{
	if((int)(Math.random()*100)==1)
	{
		randAsteroid();
	}
	if(ship.going)
	{
		clearScreen();
		moveAll();
		collisionDetect();
		showAll();
	}
	else
	{
		/*if((int)Math.random()*100==1)
		{
			rocks.add(new Asteroid());
		}*/
		if(ship.getColor()==color(255,0,0)&&arbitCounter>60)
        {
            ship.setColor(color(255,255,255));
            arbitCounter=0;
        }
        else if(arbitCounter>60)
        {
            ship.setColor(color(255,0,0));
            arbitCounter=0;
        }
        else
        {
        	arbitCounter++;
        }
		clearScreen();
		showAll();
		ship.setPointDirection(((int)ship.getPointDirection()+5)%360);
		textSize(20);
		text("Game Over\nPress Shift to Try Again",400,400);
	}
	textSize(20);
	text("High Score: "+highscore,400,50);
	text("Score: "+score,425,100);
}
public void collisionDetect()
{
	//loops through list of rocks
	for(int i=0; i<rocks.size(); i++)
	{
		//checks if there's anything there
		if(rocks.get(i)!=null)
		{
			if(rocks.get(i).crudeDetect(ship.getX(),ship.getY()))
			{
				ship.gameOver();
				rocks.remove(i);
				updateScore();
				score=0;
			}
			//checks for bullet-asteroid collisions for this rock and every bullet
			for(int ii=0; ii<bullets.size(); ii++)
			{
				//checks if there's anything there
				if(bullets.get(ii)!=null)
				{
					//collision detection rock-bullet
					if(rocks.get(i).crudeDetect(bullets.get(ii).getX(),bullets.get(ii).getY()))
					{
						destroyID.add(i);
						bullets.remove(ii);
						score++;
						updateScore();
						destroyIDexe();
						break;
					}
				}
			}
		}
	}
}
public void updateScore()
{
	if(score>highscore)
	{
		highscore=score;
	}
}
public void moveAll()
{
	for(int ii=0;ii<rocks.size();ii++)
	{
		rocks.get(ii).move();
	}
	for(int iii=0;iii<bullets.size();iii++)
	{
		bullets.get(iii).move();
	}
  	ship.move();
}
public void clearScreen()
{
	noStroke();
	fill(0,0,0);
	rect(0,0,1000,1000);
}
public void showAll()
{
	for(int i=0; i<stars.length;i++)
	{
		stars[i].show();
	}
	for(int ii=0;ii<rocks.size();ii++)
	{
		rocks.get(ii).show();
	}
	for(int iii=0;iii<bullets.size();iii++)
	{
		if(bullets.get(iii).lifetime()>=bulletFrameLife)
		{
			bullets.remove(iii);
			break;
		}
		else
		{
			bullets.get(iii).show();
		}
	}
	ship.show();
}
public void keyPressed()
{
	if(ship.going)
	{
		switch(key)
		{
			case 'a':
				//ship.setPointDirection((int)ship.getPointDirection()-2);
				ship.turn(-10);
			break;
			case 'd':
				//ship.setPointDirection((int)ship.getPointDirection()+2);
				ship.turn(10);
			break;
			case 'e':
				if(score>10)
				{
					
					ellipse(ship.getX(),ship.getY(),400,400);
					for(int i=0; i<rocks.size(); i++)
					{
						if(dist(rocks.get(i).getX(),rocks.get(i).getY(),ship.getX(),ship.getY())<400)
						{
							destroyID.add(i);
						}
					}
					destroyIDexe();
					score-=10;
				}
			break;
			case 'w':
				ship.accelerate(1);
			break;
			case 's':
				ship.accelerate(-1);
			break;
			case ' ':
				ship.shoot();
			break;
			case '.':
				randAsteroid();
			break;
		}
	}
	if(keyCode==16)
	{
		resetAll();
	}
}
public void destroyIDexe()
{
	for(int x=0; x<destroyID.size();x++)
	{
		rocks.remove(x);
	}
	destroyID.clear();
}