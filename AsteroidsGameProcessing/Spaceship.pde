class Spaceship extends Floater  
{
    public Spaceship()
    {
		//corners= ;
		//xCorners={ };
		//yCorners={ };
		//myColor= ;
		//myCenterX= ;
		//myCenterY= ;
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
    void show()
    {
    	 
    }
}
