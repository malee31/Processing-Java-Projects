Spaceship ship;
Star[] stars=new Star[100];
ArrayList<Asteroid> rocks=new ArrayList<Asteroid>();
ArrayList<Bullet> bullets=new ArrayList<Bullet>();
ArrayList<Integer> destroyID=new ArrayList<Integer>();
//this num/60 is the num of secs bullets last for. Its the amount of frames it can live
final int BULLET_LIFESPAN=300;
//Amount of asteroids by default
final int INIT_ROCK_COUNT=30;
int deathAnimationCounter=0,  score=0,  highscore=0;
//Format WASDShootSpecial
boolean[] keyDown=new boolean[6];
public void setup() 
{
	size(1000, 1000);
	resetAll();
}

public void draw() 
{
	background(0);
	if(ship.isGoing())
	{
		mainOps();
	}
	else
	{
        displayDeath();
	}
	displayScore();
}

//WARN. Can index out of bounds. Usually in bullets to rock collisions
//for collisions with asteroids
private void collisionDetectAll()
{
	destroyID.clear();
	//loops through list of rocks
	for(int currentRock=0; currentRock<rocks.size(); currentRock++)
	{
		//Ship collision
		if(ship.collide(rocks.get(currentRock).getX(),  rocks.get(currentRock).getY()))
		{
			destroyID.add(currentRock);
			endGame();
			continue;
		}
		//Bullet collisions
		for(int ii=0; ii<bullets.size(); ii++)
		{
			//collision detection rock-bullet
			if(rocks.get(currentRock).crudeDetect(bullets.get(ii)))
			{
				destroyID.add(currentRock);
				bullets.remove(ii);
				score++;
				updateScore();
				break;
			}
		}
	}
}

//Microtasks
private void resetAll()
{
	ship=new Spaceship();
	ship.setX(500);
	ship.setY(500);
	rocks.clear();
	bullets.clear();
	for(int i=0; i<stars.length; i++)
	{
		stars[i]=new Star();
	}
	for(int ii=0; ii<INIT_ROCK_COUNT; ii++)
	{
		randAsteroid(1);
	}
}

private void mainOps()
{
	randAsteroid(0.01);
	moveAll();
	collisionDetectAll();
	destroyIDexe();
	bulletDeath();
	showAll();
}

private void randAsteroid(float chance)
{
	//creates a new asteroid and makes sure that it doesn't immediately collide with the ship
	//float chance is the chance of one spawning (as a decimal)
	if(Math.random()>=chance){return;}
	rocks.add(new Asteroid());
	for(int i=0; i<rocks.size(); i++)
	{
		if(rocks.get(i).crudeDetect(ship))
		{
			rocks.remove(i);
			randAsteroid(chance);
		}
	}
}

private void bulletDeath()
{
	//removes bullets that don't hit its targets after a certain amount of frames
	for(int currentBullet=0; currentBullet<bullets.size(); currentBullet++)
	{
		if(bullets.get(currentBullet).lifetime()>=BULLET_LIFESPAN)
		{
			bullets.remove(currentBullet);
		}
	}
}

private void endGame()
{
	updateScore();
	score=0;
	ship.gameOver();

}

private void destroyIDexe()
{
	//deletes the collided or shot asteroids. IDs recleared and reset when calling collisionDetectAll()
	for(int x=0; x<destroyID.size(); x++)
	{
		//minus x is the offset for previously deleted assteroids
		rocks.remove(destroyID.remove(0)-x);
	}
}

private void updateScore()
{
	if(score>highscore)
	{
		highscore=score;
	}
}

private void displayScore()
{
	textSize(20);
	text("High Score: "+highscore, 400, 50);
	text("Score: "+score, 425, 100);
}

//all move functions
private void moveAll()
{
	moveAsteroids();
	moveBullets();
	keyPressedHandler();
	ship.move();
}

private void moveBullets()
{
	for(int i=0; i<bullets.size(); i++)
	{
		bullets.get(i).move();
	}
}

private void moveAsteroids()
{
	for(int i=0; i<rocks.size(); i++)
	{
		rocks.get(i).move();
	}
}

//all show functions
private void showAll()
{
	showStars();
	showAsteroids();
	showBullets();
	ship.show();
}

private void showStars()
{
	for(int i=0; i<stars.length; i++)
	{
		stars[i].show();
	}
}

private void showBullets()
{
	for(int i=0; i<bullets.size(); i++)
	{
		bullets.get(i).show();
	}
}

private void showAsteroids()
{
	for(int i=0; i<rocks.size(); i++)
	{
		rocks.get(i).show();
	}
}

private void displayDeath()
{
	if(deathAnimationCounter>60)
    {
    	if(ship.getColor()==color(255, 0, 0))
        {
            ship.setColor(color(255, 255, 255));
        }
        else
        {
        	ship.setColor(color(255, 0, 0));
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
	text("Game Over\nPress Shift to Try Again", 400, 400);
}

//All the keyboard handlers
public void keyPressed()
{
	if(ship.isGoing())
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
			case 'q':
				ship.setDirectionX(0);
				ship.setDirectionY(0);
				ship.setX((int)(Math.random()*width));
				ship.setY((int)(Math.random()*height));
			break;
			//Developer tools
			case '.':
				randAsteroid(1);
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
	}
}

private void keyPressedHandler()
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
			ellipse(ship.getX(), ship.getY(), 400, 400);
			for(int i=0; i<rocks.size(); i++)
			{
				if(dist(rocks.get(i).getX(), rocks.get(i).getY(), ship.getX(), ship.getY())<400)
				{
					destroyID.add(i);
				}
			}
			destroyIDexe();
			score-=10;
		}
	}
}