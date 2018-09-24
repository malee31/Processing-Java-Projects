//declare bacteria variables here
 void setup()   
 {     
 	//initialize bacteria variables here   
 }   
 void draw()   
 {
 	//move and show the bacteria   
 }
 class Bacteria    
 {
 	Bacteria(x,y)
 	{
 		int moveX, moveY;
 	}
 	void move()
 	{
 		moveX=(int)Math.random()*10+1;
 		moveY=(int)Math.random()*10+1;
 	}
 	void show()
 	{
 		ellipse(x,y);
 	}
 }
