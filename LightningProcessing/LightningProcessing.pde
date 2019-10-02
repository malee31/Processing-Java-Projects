int strike=2, startX=0, startY=150, endX=0, endY=150;
Cloud sky[]=new Cloud[200];
void setup()
{
	size(700,750);
	strokeWeight(5);
	// noLoop();
  frameRate(25);
  for(int i=0; i<sky.length; i++)
  {
    sky[i]=new Cloud();
  }
}
void draw()
{
	background(48,51,56);
	for(int i=0; i<strike; i++)
	{
		lightningStrike();
	}
  for(int i=0; i<sky.length; i++)
  {
    sky[i].show();
  }
}

void lightningStrike()
{
  strike=Math.min(strike, 200);
	stroke(rand(0,255),rand(0,255),rand(0,255));
	startX=rand(width/2-150,width/2+150);
	startY=0;
	while (startY<=height)
	{
		endX=startX+rand(-9,9);
		endY=startY+rand(0,9);
		line(startX,startY,endX,endY);
		startX=endX;
		startY=endY;
	}
}

int rand(int min,int max){ return (int)((Math.random()*(max-min+1))+min);}
void mousePressed()
{
	strike*=2;
	redraw();
}

public class Cloud
{
  int x=(int)(Math.random()*width), y=(int)(Math.random()*50), rad=(int)(Math.random()*50), speed=(int)(Math.random()*10)+1;
  public void show()
  {
    noStroke();
    fill(200);
    ellipse(x, y, rad, rad);
    x+=speed;
    if(x>=width+rad)
    {
      x=rad*-1;
    }
  }
}