class Spaceship extends Floater  
{
    public boolean going=true;
    public Spaceship()
    {
		corners= 15;
		xCorners=new int[]{20,15,5,0,-5,-20,-20,-25,-25,-20,-20,-5,0,5,15};
		yCorners=new int []{0,5,10,10,15,20,10,5,-5,-10,-20,-15,-10,-10,-5};
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
    public void setColor(int colorz){myColor=colorz;}
    public int getColor(){return myColor;}
    public void gameOver()
    {
        myColor=color(255,255,255);
        going=false;
        myDirectionX=0;
        myDirectionY=0;
    }
    public void shoot()
    {

    }
    /*public void move(int steps)
    {
    	setDirectionX(getDirectionX()+steps*Math.cos(Math.toRadians(getPointDirection())));
    	setDirectionY(getDirectionY()+steps*Math.sin(Math.toRadians(getPointDirection())));
    }
    public void translate(int xMove, int yMove)
    {
    	for(int i=0; i<corners;i++)
    	{
    		xCorners[i]+=xMove;
			yCorners[i]+=yMove;
    	}
    	Wow, I don't need to manually change it...
		myCenterX+=xMove;
		myCenterY+=yMove;
    }*/
}
