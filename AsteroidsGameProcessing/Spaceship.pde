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
    public void move()
    {
    	
    }
    public void translate(int xMove, int yMove)
    {
    	/*for(int i=0; i<corners;i++)
    	{
    		xCorners[i]+=xMove;
			yCorners[i]+=yMove;
    	}
    	Wow, I don't need to manually change it...*/
		myCenterX+=xMove;
		myCenterY+=yMove;
    }
    public void shoot()
    {
    	
    }
}
