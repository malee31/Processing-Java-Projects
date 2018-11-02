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
	for(int ii=0;ii<rocks.size();ii++)
	{
		rocks.add(new Asteroid());
	}
}
public void draw() 
{
	noStroke();
	fill(0,0,0);
	rect(0,0,1000,1000);
  	ship.move();
  	for(int i=0; i<stars.length;i++)
	{
		stars[i].show();
	}
	ship.show();
	for(int ii=0;ii<rocks.size();ii++)
	{
		rocks.get(ii).show();
		if(ii==10)
		{
			println("HI");
		}
	}
}
public void keyPressed()
{
	switch(key)
	{
		case 'a':
			//ship.setPointDirection((int)ship.getPointDirection()-2);
			ship.turn(-5);
		break;
		case 'd':
			//ship.setPointDirection((int)ship.getPointDirection()+2);
			ship.turn(5);
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