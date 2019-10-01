int strike=100, startX=0, startY=150, endX=0, endY=150;
void setup()
{
	size(500,600);
	background(48, 51, 56);
	strokeWeight(5);
	noLoop();
}
void draw()
{
	background(48,51,56);
	while (strike>0)
	{
		lightningStrike();
		strike--;
	}
}
void lightningStrike()
{
	stroke(rand(0,255),rand(0,255),rand(0,255));
	startX=rand(100,400);
	startY=0;
	while (startY<=600)
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
	strike++;
	startX=0;
	startY=150;
	endX=0;
	endY=150;
	redraw();
}
