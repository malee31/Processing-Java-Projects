class Spaceship extends Floater  
{
    private boolean going=true;
    public Spaceship()
    {
		corners= 15;
		xCorners=new int[]{20, 15, 5, 0, -5, -20, -20, -25, -25, -20, -20, -5, 0, 5, 15};
		yCorners=new int []{0, 5, 10, 10, 15, 20, 10, 5, -5, -10, -20, -15, -10, -10, -5};
		myColor= color(128, 128, 128);
        hitRadius=23;
		myCenterX=0;
		myCenterY=0;
		myDirectionX=0;
		myDirectionY=0;
		myPointDirection=90;
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
    public void setColor(int colorz){myColor=colorz;}
    public int getColor(){return myColor;}
    public boolean isGoing(){return going;}
    public float getHitRadius(){return hitRadius;}
    public void gameOver()
    {
        myColor=color(255, 255, 255);
        going=false;
        myDirectionX=0;
        myDirectionY=0;
    }
    public void shoot()
    {
        bullets.add(new Bullet(ship));
    }
    public boolean collide(int x, int y)
    {
        return dist(x, y, (int)myCenterX, (int)myCenterY)<=hitRadius;
    }
}
