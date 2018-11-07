class Asteroid extends Floater
{
	private int rotation;
	public Asteroid()
	{
		corners=6;
		xCorners=new int[]{-30,-20,10,30,30,10};
		yCorners=new int[]{0,20,30,20,0,-20};
		myColor=color(150,150,150);
		//radians
		rotation=(int)(Math.random()*20-10);
  		myCenterX=(int)(Math.random()*980+10);
  		myCenterY=(int)(Math.random()*980+10);
  		myPointDirection=(int)(Math.random()*361);
  		myDirectionX=0;
		myDirectionY=0;
		accelerate((int)Math.random()*2-1);
	}
	public void move()
	{
		turn(rotation);
		super.move();
	}
	public boolean crudeDetect(int crudeX, int crudeY)
	{
		if(dist((float)myCenterX,(float)myCenterY,crudeX,crudeY)<40)
		{
			ship.gameOver();
			return true;
		}
		else
		{
			return false;
		}
	}
	public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;}
}