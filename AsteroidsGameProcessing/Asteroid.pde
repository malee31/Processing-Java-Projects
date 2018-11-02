class Asteroid extends Floater
{
	private int rotation;
	public Asteroid()
	{
		corners=4;
		xCorners=new int[]{-2,2,2,-2};
		yCorners=new int[]{2,2,-2,-2};
		myColor=color(150,150,150);
		rotation=(int)(Math.random()*20-10);
  		myCenterX=(int)(Math.random()*980+10);
  		myCenterY=(int)(Math.random()*980+10);
  		myPointDirection=(int)(Math.random()*361);
  		myDirectionX=0;
		myDirectionY=0;
		accelerate((int)Math.random()*2-1);
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