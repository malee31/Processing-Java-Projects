class Spaceship extends Floater  
{
    public Spaceship()
    {
		corners= 14;
		xCorners=new int[]{4,3,1,0,-1,-4,-4,-5,-4,-4,-1,0,1,3};
		yCorners=new int []{0,1,2,2,3,4,2,1,-1,-2,-4,-3,-2,-2,-1};
		myColor= color(128,128,128);
		myCenterX=0;
		myCenterY=0;
		myDirectionX=0;
		myDirectionY=0;
		myPointDirection=90;
    }
    void setX(int x)
    {
    	myCenterX=x;
    }
    int getX()
    {
    	return (int)myCenterX;
    }
    void setY(int y)
    {
    	myCenterY=y;
    }
    int getY()
    {
    	return (int)myCenterY;
    }
    void setDirectionX(double x)
    {
    	myDirectionX=x;
    }
    double getDirectionX()
    {
    	return myDirectionX;
    }
    void setDirectionY(double y)
    {
    	myDirectionY=y;
    }
    double getDirectionY()
    {
    	return myDirectionY;
    }
    void setPointDirection(int degrees)
    {
    	myPointDirection=degrees;
    }
    double getPointDirection()
    {
    	return myPointDirection;
    }
    void move()
    {

    }
    private void translate(int xMove, int yMove)
    {
    	
    }
}
