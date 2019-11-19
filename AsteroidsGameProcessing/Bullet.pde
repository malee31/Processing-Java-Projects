class Bullet extends Floater
{
	private int lifeFrame=0;
	public Bullet(Spaceship theShip)
	{
		corners= 15;
		xCorners=new int[]{4, 3, 1, 0, -1, -4, -4, -5, -5, -4, -4, -1, 0, 1, 3};
		yCorners=new int []{0, 1, 2, 2, 3, 4, 2, 1, -1, -2, -4, -3, -2, -2, -1};
		myColor= color(200, 0, 0);
		hitRadius=4.5;
		myPointDirection=theShip.getPointDirection();
		myCenterX=theShip.getX();
		myCenterY=theShip.getY();
		double dRadians=myPointDirection*(Math.PI/180);
		myDirectionX=5*Math.cos(dRadians)+theShip.getDirectionX();
		myDirectionY=5*Math.sin(dRadians)+theShip.getDirectionY();
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
	public float getHitRadius(){return hitRadius;}
	public void show()
	{
		stroke(0, 0, 0);
		super.show();
		lifeFrame++;
	}
	public int lifetime(){return lifeFrame;}
}