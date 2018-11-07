Spaceship ship;
Star[] stars=new Star[100];
ArrayList<Asteroid> rocks=new ArrayList<Asteroid>();
int rockCount=30;
//counts whatever
int arbitCounter=0;
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
	collisionDetect();
	if(ship.going==false)
	{
		ship.going=true;
		resetAll();
	}
}
public void draw() 
{
	if(ship.going)
	{
		clearScreen();
		moveAll();
		collisionDetect();
		showAll();
	}
	else
	{
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
}
public void collisionDetect()
{
	//loops through list
	for(int i=0; i<rocks.size(); i++)
	{
		//checks if there's anything there
		if(rocks.get(i)!=null)
		{
			if(rocks.get(i).crudeDetect(ship.getX(),ship.getY()))
			{
				ship.gameOver();
				rocks.remove(i);
			}
		}
	}
}
public void moveAll()
{
	for(int ii=0;ii<rocks.size();ii++)
	{
		rocks.get(ii).move();
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
			/*case 'e':
				ship.
			break;*/
			case 'w':
				ship.accelerate(1);
			break;
			case 's':
				ship.accelerate(-1);
			break;
			case ' ':
				ship.shoot();
			break;
		}
	}
	if(keyCode==16)
	{
		resetAll();
	}
}