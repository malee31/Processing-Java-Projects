Spaceship ship;
Star[] stars=new Star[100];
ArrayList<Asteroid> rocks=new ArrayList<Asteroid>();
ArrayList<Bullet> bullets=new ArrayList<Bullet>();
ArrayList<Integer> destroyID=new ArrayList<Integer>();
int rockCount=30;
//counts whatever
int deathAnimationCounter=0, score=0, highscore=0;
//this num/60 is the num of secs bullets last for
int bulletFrameLife=300;
//Format WASDShootSpecial
boolean[] keyDown=new boolean[6];
public void setup() 
{
	size(1000,1000);
	resetAll();
}

public void draw() 
{
	background(0);
	if(ship.going)
	{
		//1% chance of a random asteroid spawn
		if((int)(Math.random()*100)==1)
		{
			randAsteroid();
		}
		moveAll();
		collisionDetect();
		showAll();
	}
	else
	{
        if(deathAnimationCounter>60)
        {
        	if(ship.getColor()==color(255,0,0))
	        {
	            ship.setColor(color(255,255,255));
	        }
	        else
	        {
            	ship.setColor(color(255,0,0));
            }
            deathAnimationCounter=0;
        }
        else
        {
        	deathAnimationCounter++;
        }
		showAll();
		ship.setPointDirection(((int)ship.getPointDirection()+5)%360);
		textSize(20);
		text("Game Over\nPress Shift to Try Again",400,400);
	}
	textSize(20);
	text("High Score: "+highscore,400,50);
	text("Score: "+score,425,100);
}

public void resetAll()
{
	ship=new Spaceship();
	ship.setX(500);
	ship.setY(500);
	rocks.clear();
	bullets.clear();
	for(int i=0; i<stars.length;i++)
	{
		stars[i]=new Star();
	}
	for(int ii=0;ii<rockCount;ii++)
	{
		randAsteroid();
	}
}

public void moveAll()
{
	keyPressedHandler();
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

//WARN. Can index out of bounds
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

public void destroyIDexe()
{
	//deletes the collided or shot asteroids
	for(int x=0; x<destroyID.size();x++)
	{
		rocks.remove(destroyID.get(x)-x);
	}
	destroyID.clear();
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

public void randAsteroid()
{
	//creates a new asteroid and makes sure that it doesn't immediately collide with the ship
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

public void updateScore()
{
	if(score>highscore)
	{
		highscore=score;
	}
}

//All the keyboard handlers
public void keyPressed()
{
	if(ship.going)
	{
		switch(key)
		{
			case 'w':
				keyDown[0]=true;
			break;
			case 'a':
				keyDown[1]=true;
			break;
			case 's':
				keyDown[2]=true;
			break;
			case 'd':
				keyDown[3]=true;
			break;
			case ' ':
				keyDown[4]=true;
			break;
			case 'e':
				keyDown[5]=true;
			break;
			//Developer tools
			case '.':
				randAsteroid();
			break;
			case '+':
				score++;
			break;
		}
	}
	if(keyCode==16)
	{
		resetAll();
	}
}

public void keyReleased()
{
	switch(key)
	{
		case 'w':
			keyDown[0]=false;
		break;
		case 'a':
			keyDown[1]=false;
		break;
		case 's':
			keyDown[2]=false;
		break;
		case 'd':
			keyDown[3]=false;
		break;
		case ' ':
			keyDown[4]=false;
		break;
		case 'e':
			keyDown[5]=false;
		break;
		//Developer tools
		case '.':
			randAsteroid();
		break;
		case '+':
			score++;
		break;
	}
}

void keyPressedHandler()
{
	if(keyDown[0]) ship.accelerate(1);
	if(keyDown[1]) ship.turn(-10);
	if(keyDown[2]) ship.accelerate(-1);
	if(keyDown[3]) ship.turn(10);
	if(keyDown[4]) ship.shoot();
	if(keyDown[5])
	{
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
	}
}