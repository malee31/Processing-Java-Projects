Spaceship ship;
Star[] stars=new Star[100];
ArrayList<Asteroid> rocks=new ArrayList<Asteroid>();
public void setup() 
{
	size(1000,1000);
	ship=new Spaceship();
	ship.setX(500);
	ship.setY(500);
	for(int i=0; i<stars.length;i++)
	{
		stars[i]=new Star();
	}
	for(int ii=0;ii<30;ii++)
	{
		rocks.add(new Asteroid());
	}
}
public void draw() 
{
	clearScreen();
	moveAll();
	if(ship.going)
	{
		collisionDetect();
	}
	showAll();
}
public void collisionDetect()
{
	//loops through list
	for(int i=0; i<rocks.size(); i++)
	{
		//checks if there's anything there
		if(rocks.get(i)!=null)
		{
			for(int ii=0;ii<rocks.get(i).corners;ii++)
			{
				rocks.get(i).crudeDetect(ship.getX(),ship.getY());
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
			/*case ' ':
				ship.shoot();
			break;
			*/
		}
	}
}