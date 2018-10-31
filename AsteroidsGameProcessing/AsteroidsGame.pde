Spaceship ship;
public void setup() 
{
	size(1000,1000);
	ship=new Spaceship();
	ship.setX(500);
	ship.setY(500);
}
public void draw() 
{
	noStroke();
	fill(0,0,0);
	rect(0,0,1000,1000);
  	ship.move();
  	ship.show();
}
public void keyPressed()
{
	switch(key)
	{
		case ' ':
			//ship.shoot();
		break;
		case 'w':
			
		break;
		case 'a':

		break;
		case 's':

		break;
		case 'd':

		break;
		case 'e':

		break;
	}
}