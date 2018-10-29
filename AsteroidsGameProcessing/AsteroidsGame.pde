Spaceship ship;
public void setup() 
{
	size(1000,1000);
	ship=new Spaceship();
}
public void draw() 
{
  	ship.move();
  	ship.show();
}
public void keyPressed()
{
	switch(keyCode)
	{
		//case 
	}
}