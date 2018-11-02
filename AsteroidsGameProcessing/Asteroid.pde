class Asteroid
{
	int rotation,x,y;
	public Asteroid()
	{
		int rotation=(int)(Math.random()*20-10);
  		x=(int)(Math.random()*980+10);
  		y=(int)(Math.random()*980+10);
	}
	public void show()
	{
		ellipse(x,y,10,10);
	}
	public void move()
	{
		
	}
}